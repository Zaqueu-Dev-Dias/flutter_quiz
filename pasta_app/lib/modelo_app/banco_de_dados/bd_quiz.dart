import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB_quiz extends maedb{ // filho real. DB_quiz

  Future<Database> inicializardb()async{
    if(super.database != null){ // <- verificar se o banco de dados esta aberto para não abrir de novo
      return super.database!;
    }else{ // se não tiver aberto, vamos abrir.
      return super.database = await openDatabase(
        join(await getDatabasesPath(),'arquivoquizdb.db'), // procurar a pasta onde fica os banco de dados e criar um arquivo db.
        version: 1, // versão do banco de dados
        onCreate: (db,versao)async{ //<- função anonima assincrona para criar a tabela de db
           await db.execute('CREATE TABLE tabelaquiz(id INTEGER PRIMARY KEY AUTOINCREMENT, usuario TEXT, email TEXT, senha TEXT,acertos INTEGER, erros INTEGER, ranking INTEGER)');
        }
      );
    }
  }

}

abstract class maedb{ // <- classe generica. ser mae do mock tambem.
  Database? database;
  Future<Database> inicializardb(); // <- class filho obrigado a implementar
}