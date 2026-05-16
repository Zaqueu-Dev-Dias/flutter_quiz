import 'dart:convert';

import 'package:aplicativo_de_quiz/modelo_app/apis/apiquiz.dart';
import 'package:http/http.dart' as http;

class Repositorio2{

  ApiQuiz quaizapi;
  late http.Response _respostacategoria; // privar para não usar antes da inicialização
  late http.Response _respostaperguntas; // as perguntas da api
  late Map _json_para_map_categoria;
  late Map _json_para_map_perguntas;
  Repositorio2({required this.quaizapi});

  Future<Object> trazercategorias()async{
      var resultado = quaizapi.buscarcategorias();
      resultado.then((valor){
        if(valor is http.Response){
          this._respostacategoria = valor;
        }
      });
     return resultado;
  }

  void transformajson(){
    if(_respostacategoria is http.Response){
      _json_para_map_categoria = jsonDecode(utf8.decode(this._respostacategoria.bodyBytes));
    }else{
      // tratar erro aqui
    }
  }

  Map pegarmapcategoria(){
    transformajson();
    return _json_para_map_categoria;
  }

  Future<Object> pegarmapdadogeral(Map<String, String> pesquisa)async{ // porque mesmo retornado void o future quer que eu retorne algo.
     var resultado = quaizapi.buscarperguntas(partes: pesquisa);
     resultado.then((valor){
       if(valor is http.Response){
         this._respostaperguntas = valor;
       }
     });
     return resultado;
  }

  void transformajsongeral(){
    if(_respostaperguntas is http.Response){
      _json_para_map_perguntas = jsonDecode(utf8.decode(this._respostaperguntas.bodyBytes));
    }else{
      print('ERRO NA RESPOSTA');
    }
  }

  Map pegarmapperguntas(){
    return this._json_para_map_perguntas;
  }

}