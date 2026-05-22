import 'dart:io';

import 'package:http/http.dart' as http;
class ApiQuiz{

  Future<Object> buscarcategorias()async{ // ele vai gerar e retorna um objeto future<Object> com o bloco de código da função.
    try{
      var url = Uri.parse('https://opentdb.com/api_category.php');
      var resposta = await http.get(url);
      return resposta;
    } on SocketException {
      return 'Sem conexão com a internet';
    }catch(e){
      return 'Erro no $e';
    }
  }

  Future<Object> buscarperguntas({required Map<String, String> partes})async{
    try{
      var urlp = Uri.parse('https://opentdb.com/api.php?amount=${partes['quantidade']}&category=${partes['categoria']}&difficulty=${partes['nivel']}&type=multiple');
      var respostap = await http.get(urlp);
      return respostap;
    } on SocketException{
      return 'Sem Conexão com a internet';
    }catch(e){
      return 'Erro no $e';
    }
  }

}