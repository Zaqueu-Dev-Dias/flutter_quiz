import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'carregarjogoview.dart';
import 'jogarviewmodel.dart';

class Configurarjogoview extends StatelessWidget {
  Configurarjogoview({super.key});

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuEntry> opcaocategoria() {
      List<dynamic>listatexto = context.read<JogarVM>().listacategoria();
      List<DropdownMenuEntry> opcao = [];
      for (int quantidade = 0; quantidade <= listatexto.length-1; quantidade++) {
        opcao.add(DropdownMenuEntry(value: '${listatexto[quantidade]['id']}', label: '${listatexto[quantidade]['name']}'));
      }
      return opcao;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Fernando'),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Text('Configuração do jogo',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800),),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),border: Border.all(color: Color(0xFFD1C4E9),)),
                width: MediaQuery.of(context).size.width,
                height: 110,
                child: Column(children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('imagens/controle-de-video-game.png'),
                  ),
                  Text('Nivel de dificuldade', style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800)),
                ],
              ),
              SegmentedButton(
                segments: [
                  ButtonSegment(value: 'easy', label: Text('easy')),
                  ButtonSegment(value: 'medium', label: Text('medium')),
                  ButtonSegment(value: 'hard', label: Text('hard')),
                ],
                selected: {context.watch<JogarVM>().dadospararequisicao['nivel']},
                onSelectionChanged: (Set selecionado) {
                  context.read<JogarVM>().mudarnivel(selecionado);
                },
              ),
            ],)),
          ),
         Padding(
           padding: const EdgeInsets.all(10.0),
           child: Container(
             height: 110,
             width: MediaQuery.of(context).size.width,
             decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),border: Border.all(color: Color(0xFFD1C4E9),)),
             child: Column(children: [
             Row(
               children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Image.asset('imagens/ponto-de-interrogacao.png'),
                 ),
                 Text('Quantidade de perguntas', style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800)),
               ],
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 GestureDetector(
                   onTap: (){
                     context.read<JogarVM>().diminuirpergunta();
                   },
                   child: Container(
                     width: 30,
                     height: 30,
                     decoration: BoxDecoration(
                       color: Colors.blue,
                       borderRadius: BorderRadius.circular(10)
                     ),
                     child: Center(
                       child: Text(
                         '-',
                         style: TextStyle(color: Colors.white, fontSize: 30,fontWeight: FontWeight.w800),
                       ),
                     ),
                   ),
                 ),
                 Container(width: 60, height: 30,child: Center(child: Text('${context.watch<JogarVM>().quantidadeperguntas}',style: TextStyle(fontSize: 25),)),),
                 GestureDetector(
                   onTap: (){
                     context.read<JogarVM>().aumentarpergunta();
                   },
                   child: Container(
                     width: 30,
                     height: 30,
                     decoration: BoxDecoration(
                       color: Colors.blue,
                       borderRadius: BorderRadius.circular(10)
                     ),
                     child: Center(
                       child: Text(
                         '+',
                         style: TextStyle(fontSize: 30, color: Colors.white,fontWeight: FontWeight.w800),
                       ),
                     ),
                   ),
                 ),
           ],),
              ],
            ),),
         ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 120,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),border: Border.all(color:Color(0xFFD1C4E9),)),
              child: Column(children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('imagens/abra-o-livro.png'),
                  ),
                  Text('Categoria de perguntas', style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: DropdownMenu(
                    onSelected: (valor){
                      if(valor == null){
                        print('nada passado');
                      }else{
                        context.read<JogarVM>().dadospararequisicao['categoria'] = valor;
                      }
                    },
                    dropdownMenuEntries: opcaocategoria()),
              ),
            ],),),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 200,left: 10, right: 10),
            child: GestureDetector(
              onTap: (){
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => const Carregarjogoview(),
                  ),
                    (var valor) =>false
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.blue,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.play_circle,color: Colors.white,),
                    Text(
                      'jogar',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

