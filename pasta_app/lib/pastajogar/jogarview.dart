import 'package:flutter/material.dart';

class Jogarview extends StatelessWidget {
  const Jogarview({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget>receba =  widgetperguntas();
    return Scaffold(
      appBar: AppBar(title: Text('Questão numero 1'),),
      body: Container(child: ListView.builder(itemCount: receba.length,itemBuilder: (contexto, indice){
          return receba[indice];
      }),),
    );
  }
}

List<Widget> widgetperguntas(){
  List<Widget>dados = [];
  for(int quantidade=1; quantidade <=5; quantidade++){
    if(quantidade == 1){
      dados.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),border: Border.all(color: Colors.black)),child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Oque é programação orientada a objeto?',style: TextStyle(fontSize: 26),),
        ),),
      ));
    }else{
      dados.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),border: Border.all(color: Colors.black)),child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('resposta número -> ${quantidade}',style: TextStyle(fontSize: 26),),
        ),),
      ));
    }
  }
  return dados;
}


