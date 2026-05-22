import 'package:aplicativo_de_quiz/pastajogar/carregarcategoriaview.dart';
import 'package:aplicativo_de_quiz/pastajogar/configurarjogoview.dart';
import 'package:aplicativo_de_quiz/pastajogar/jogarview.dart';
import 'package:aplicativo_de_quiz/pastajogar/jogarviewmodel.dart';
import 'package:aplicativo_de_quiz/pastajogar/resultadofinalview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'autenticacao/autenticarviewmodel.dart';
import 'autenticacao/cadastroview.dart';
import 'modelo_app/apis/OpenIA.dart';
import 'modelo_app/apis/apiquiz.dart';
import 'modelo_app/repositorio/repositorio2.dart';
import 'modelo_app/repositorio/repositorio3.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          Provider(create: (contexto) => ApiQuiz()),
          Provider(create: (contexto) => OpenAPI()),
          Provider(create: (contexto) => AutenticarVM()),
          Provider(create: (contexto) => Repositorio2(quaizapi: contexto.read<ApiQuiz>())),
          Provider(create: (contexto) => Repositorio3(apiopen: contexto.read<OpenAPI>())),
          ChangeNotifierProvider(create: (contexto) => JogarVM(repositorio2: contexto.read<Repositorio2>(), repositorio3: contexto.read<Repositorio3>()))
        ],
        child:MaterialApp(home: Carregarcategoriaview(),debugShowCheckedModeBanner: false,),
  ));
}

//MaterialApp(home: Cadastroview(),)