import 'package:aplicativo_de_quiz/pastajogar/jogarviewmodel.dart';
import 'package:aplicativo_de_quiz/pastajogar/resultadofinalview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class Jogarview extends StatelessWidget {
  Jogarview({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<JogarVM>().pegarmapgeral();
    List<Widget> widgetperguntas() {
      List<Widget> dados = [];
      print('AQUIIIIII');
      for (int quantidade = 0; quantidade <= context.read<JogarVM>().estadoquestao.misturado.length - 1; quantidade++) {
        if (quantidade == 0) {
          dados.add(
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${context.read<JogarVM>().estadoquestao.pergunta}',
                    style: TextStyle(fontSize: 26,fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          );
          dados.add(
            CadaPergunta(alternativa: context.read<JogarVM>().estadoquestao.misturado[quantidade],indice: quantidade,),
          );
        } else {
          dados.add(
            CadaPergunta(alternativa: context.read<JogarVM>().estadoquestao.misturado[quantidade],indice: quantidade,),
          );
        }
      }
      return dados;
    }

    List<Widget> receba = widgetperguntas();
    return Scaffold(
      appBar: AppBar(title: Text('Questão número ${context.watch<JogarVM>().em_qual_pergunta+1}')),
      body: Container(
        child: ListView.builder(
          itemCount: receba.length,
          itemBuilder: (contexto, indice) {
            return receba[indice];
          },
        ),
      ),
    );
  }
}

class CadaPergunta extends StatefulWidget {
  List<String> alfabeto_letra = ['A','B','C','D'];
  var cor_fundo = Colors.white;
  var cor_letra = Colors.black;
  late var alternativa;
  int indice;
  CadaPergunta({super.key, this.alternativa, required this.indice});

  @override
  State<CadaPergunta> createState() => _CadaPerguntaState();
}

class _CadaPerguntaState extends State<CadaPergunta> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          if(context.read<JogarVM>().verificarresposta(widget.alternativa)){
            widget.cor_fundo = Colors.green;
            widget.cor_letra = Colors.white;
            context.read<JogarVM>().acerto +=1;
          }else{
            context.read<JogarVM>().limite = false;
            widget.cor_fundo = Colors.red;
            widget.cor_letra = Colors.white;
            context.read<JogarVM>().erros +=1;
          }
          setState(() {});
          Future.delayed(Duration(seconds: 2),(){
            context.read<JogarVM>().proximapergunta();
            if(context.read<JogarVM>().limite){
              context.read<JogarVM>().em_qual_pergunta = 0;
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute<void>(builder: (context) => Resultadofinalview(),),
                    (var valor) => false,
              );
            }else{
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute<void>(builder: (context) => Jogarview(),),
                    (var valor) => false,
              );
            }
          });
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.black),
              color:widget.cor_fundo),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),border: Border.all(color: Colors.deepPurpleAccent),color: Colors.deepPurple),
                      child: Center(child: Text('${widget.alfabeto_letra[widget.indice]}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.white),)),
                    ),
                  ),
                  Expanded(child: Text('${widget.alternativa}', style: TextStyle(fontSize: 26,color: widget.cor_letra,fontWeight: FontWeight.w500)))
                ],
              ),
          ),
        ),
      ),
    );;
  }
}
