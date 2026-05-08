
import 'package:aplicativo_de_quiz/modelo_app/banco_de_dados/bd_quiz.dart';
import 'package:sqflite/sqflite.dart';

class Repositorio1{
    late maedb banco_de_dado;

    Future<int> cadastra({required String nome, required String email, required String senha,})async{
      if(banco_de_dado.database != null){
        return await banco_de_dado.database!.insert('tabelaquiz', {'usuario':nome, 'email':email,'senha':senha});
      }else{
        await banco_de_dado.inicializardb();
        return await banco_de_dado.database!.insert('tabelaquiz', {'usuario':nome, 'email':email,'senha':senha});
      }
    }
}