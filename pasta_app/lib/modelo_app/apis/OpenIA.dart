import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class OpenAPI{

  String chave = ''; //não vou mostrar a chava 😂😅


  Future<Object> IApesquisar(Map pergunta)async{
    try{
      Uri url = Uri.parse('https://api.groq.com/openai/v1/chat/completions');
      var resposta = await http.post(
          url,
          headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $chave',},
          body: jsonEncode({
            "model": "llama-3.3-70b-versatile",
            "messages": [
              {
                "role": "user",
                "content": "Traduza para português so os valores do Map, não as chaves e Responda APENAS em JSON válido.: $pergunta"
              }
            ]
          }),
      );
      if(resposta.statusCode == 200){
         return resposta;
      }else{
        return '''
        ---ERRO NO SERVIDOR
        STATO -> ${resposta.statusCode}
        RESPOSTA -> ${resposta.body}
        ''';
      }
    } on SocketException{
      return 'Sem internet';
    }catch (e){
      return 'ERRO no $e';
    }
  }
}