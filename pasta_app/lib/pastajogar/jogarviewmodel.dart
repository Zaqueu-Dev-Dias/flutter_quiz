import 'dart:math';

import 'package:aplicativo_de_quiz/modelo_app/repositorio/repositorio2.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

import '../modelo_app/repositorio/repositorio3.dart';

class JogarVM extends ChangeNotifier{

  int quantidadeperguntas = 1;
  String idioma_selecionado = 'Ingles';
  Repositorio2 repositorio2;
  Repositorio3 repositorio3;
  late Map _mappergunta;
  int acerto = 0;
  int erros = 0;
  late var resposta_correta;
  late int em_qual_pergunta = 0;
  late EstadoQuestao estadoquestao;
  bool limite = false;
  Map<String,String> dadospararequisicao = {'nivel': 'easy'};
  JogarVM({required this.repositorio2, required this.repositorio3});

  void mudarnivel(Set nivel){
    dadospararequisicao['nivel'] = nivel.first;
    notifyListeners();//notificar que tem que renderizar a tela
  }

  void mudaridioma(Set idioma){
    this.idioma_selecionado = idioma.first;
    notifyListeners();
  }
  void aumentarpergunta(){
    this.quantidadeperguntas += 1;
    notifyListeners();
  }

  void diminuirpergunta(){
    if(quantidadeperguntas == 1){
        // vai acontecer nada
    }else{
      this.quantidadeperguntas -= 1;
      notifyListeners();
    }
  }

  Future<Object>carregarcategoria()async{ // O FUTUREBUILDER NÃO VAI FUNCIONAR SE O FUTURE RETORNA VOID
    return repositorio2.trazercategorias(); // O FUTURE TEM QUE RETORNA ALGO <-
  }

  List<dynamic> listacategoria(){
    print('##### ${repositorio2.pegarmapcategoria()} #####');
    var dados = repositorio2.pegarmapcategoria();
    print('parou aqui');
    List<dynamic>listadados = dados['trivia_categories'];
    print('foi');
    return listadados;
  }

  Future<Object> carregarperguntas()async{
    dadospararequisicao['quantidade'] = quantidadeperguntas.toString();
    print(')))))) ${dadospararequisicao} (((((((');
    return repositorio2.pegarmapdadogeral(dadospararequisicao);
  }

  Future<Object> traduzir()async{
    repositorio2.transformajsongeral();
    this._mappergunta = repositorio2.pegarmapperguntas();
    return repositorio3.traduzir(_mappergunta);
  }

  void pegarmapgeral(){
    if(idioma_selecionado == 'Portugues'){
      this.estadoquestao = EstadoQuestao(repositorio3.dado['results'][em_qual_pergunta]);
      estadoquestao.misturar(em_qual_pergunta);
    }else{
      this.estadoquestao = EstadoQuestao(_mappergunta['results'][em_qual_pergunta]);
      estadoquestao.misturar(em_qual_pergunta);
    }
  }

  bool verificarresposta(var questao){
     if(questao == _mappergunta['results'][em_qual_pergunta]['correct_answer']){
       resposta_correta = questao;
       return true;
     }else{
       return false;
     }
  }

  void proximapergunta(){
     em_qual_pergunta+=1;
     if(em_qual_pergunta <= _mappergunta['results'].length-1){
       estadoquestao = EstadoQuestao(_mappergunta['results'][em_qual_pergunta]);
       notifyListeners();
     }else{
       limite = true;
       em_qual_pergunta = 0;
       notifyListeners();
     }
  }

}


class EstadoQuestao{ // usar objeto pra organizar

  Map<dynamic,dynamic> questao;
  List<dynamic> misturado = [];
  EstadoQuestao(this.questao);
  late var pergunta;
  void misturar(int qual_pergunta){
    misturado = [];
    pergunta = questao['question'];
    int gerarnumero = Random().nextInt(questao['incorrect_answers'].length+1);
    Object correta = questao['correct_answer'];
    List<dynamic> erradas = questao['incorrect_answers'];
    int indice_erros = 0;
    for(int vezes = 0; vezes <= erradas.length; vezes++){
      if(vezes == gerarnumero){
        misturado.add(correta);
      }else{
        misturado.add(erradas[indice_erros]);
        indice_erros++;
      }
    }
  }

}

// funções desaparecem, mas objetos não