
import 'dart:convert';

import '../apis/OpenIA.dart';
import 'package:http/http.dart' as http;

class Repositorio3{

  OpenAPI apiopen;
  late Map dado;
  Repositorio3({required this.apiopen});

  Future<Object> traduzir(Map traduz){
    var resultado = apiopen.IApesquisar(traduz);
    resultado.then((valor){
      if(valor is http.Response){
        print('''
        Ingles: Tonight is going to be great.
        Portugues: ${jsonDecode(utf8.decode(valor.bodyBytes))}
        ''');
        dado = jsonDecode(utf8.decode(valor.bodyBytes));
        print('----- $dado---------');
      }
    });
    return resultado;
  }

}