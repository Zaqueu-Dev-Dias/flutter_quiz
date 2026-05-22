import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'carregaridiomaview.dart';
import 'jogarview.dart';
import 'jogarviewmodel.dart';

class Carregarjogoview extends StatelessWidget {
  const Carregarjogoview({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: context.read<JogarVM>().carregarperguntas(), builder: (contexto,situacao){
      if(situacao.hasData){
        if(situacao.data is String){
          return Container(color: Colors.white,child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Icon(Icons.signal_wifi_connected_no_internet_4,color: Colors.red,size: 100,),
            GestureDetector(
              onTap: (){
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => Carregarjogoview(),
                    ),
                        (var valor) =>false
                );
              },
                child: Text('${situacao.data}',style: TextStyle(decoration: TextDecoration.none,fontSize: 25),)),
          ],),);
        }else{
          return Carregaridiomaview();
        }
      }else if(situacao.hasError){
        return Container(color: Colors.white,child: Center(child: Image.asset('imagens/anxiety.png')),);
      }else{
        return Container(color: Colors.white,child: Center(child: Lottie.asset('animacoes/Loading IDE.json',width: 200)),);
      }
    });
  }
}
