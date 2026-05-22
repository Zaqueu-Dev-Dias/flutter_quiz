import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'jogarview.dart';
import 'jogarviewmodel.dart';
import 'package:provider/provider.dart';

class Carregaridiomaview extends StatelessWidget {
  const Carregaridiomaview({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: context.read<JogarVM>().traduzir(), builder: (contexto,situacao){
      if(situacao.hasData){
        if(situacao.data is String){
          return Container(color: Colors.white,child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.signal_wifi_connected_no_internet_4,color: Colors.red,size: 100,),
              Padding(
                padding: const EdgeInsets.only(left: 20,top: 10),
                child: GestureDetector(onTap: (){
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => Carregaridiomaview(),
                      ),
                          (var valor) =>false
                  );
                },child: Text('${situacao.data}',style: TextStyle(fontSize: 20),)),
              )
            ],
          ),);
        }else{
          return Jogarview();
        }
      }else if(situacao.hasError){
        print('SEM INTERNET -> ${situacao.error}');
        return Container(color: Colors.white,child: Center(child: Image.asset('imagens/anxiety.png')),);
      }else{
        return Container(color: Colors.white,child: Center(child: Lottie.asset('animacoes/Loading IDE.json',width: 200)),);
      }
    });;
  }
}
