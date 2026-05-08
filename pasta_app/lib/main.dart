import 'package:aplicativo_de_quiz/pastajogar/configurarjogoview.dart';
import 'package:aplicativo_de_quiz/pastajogar/jogarview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'autenticacao/autenticarviewmodel.dart';
import 'autenticacao/cadastroview.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [Provider(create: (contexto) => AutenticarVM())],
        child:MaterialApp(home: Configurarjogoview(),),
  ));
}

//MaterialApp(home: Cadastroview(),)