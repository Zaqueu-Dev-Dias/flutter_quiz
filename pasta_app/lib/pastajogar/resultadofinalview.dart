import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'carregarcategoriaview.dart';
import 'jogarviewmodel.dart';

class Resultadofinalview extends StatelessWidget {
  const Resultadofinalview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Adventure Quiz',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800,color: Colors.deepPurpleAccent),)),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Text('Resultado final: ',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700),),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 10,
                right: 20,
                bottom: 20,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.deepPurpleAccent),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.book_sharp,
                        color: Colors.deepPurpleAccent,
                        size: 30,
                      ),
                      Text('Categoria:', style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800)),
                      Expanded(
                        child: Text(
                          '${context.watch<JogarVM>().estadoquestao.questao['category']}',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.deepPurpleAccent,
                            fontWeight: FontWeight.w800
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.deepPurple),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.leaderboard, color: Colors.blue,),
                      ),
                      Text('Dificuldade: ', style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800)),
                      Expanded(
                        child: Text(
                          '${context.watch<JogarVM>().estadoquestao.questao['difficulty']}',
                          style: TextStyle(fontSize: 30,color: Colors.blue, fontWeight: FontWeight.w800),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20 ),
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.deepPurpleAccent)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.check_circle,color: Colors.green,),
                      ),
                      Text('Acertos:',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('${context.watch<JogarVM>().acerto}',
                          style: TextStyle(fontSize: 30,color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, right: 20,bottom: 20),
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.deepPurpleAccent)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.close, color: Colors.red,size: 25,),
                      ),
                      Text('Erros:',style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${context.watch<JogarVM>().erros}',
                          style: TextStyle(fontSize: 30,color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    context.read<JogarVM>().acerto = 0;
                    context.read<JogarVM>().erros = 0;
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => const Carregarcategoriaview(),
                      ),
                      (var valor) => false,
                    );
                  },
                  child: Container(
                    width: 150,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        'Concluído',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
