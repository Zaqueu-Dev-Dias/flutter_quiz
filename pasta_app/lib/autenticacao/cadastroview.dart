import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'autenticarviewmodel.dart';
class Cadastroview extends StatelessWidget {
  final chave = GlobalKey<FormState>();
  final capturarusuario = TextEditingController();
  final capturaremail = TextEditingController();
  final capturarsenha = TextEditingController();
  final capturarconfirmasenha = TextEditingController();
  Cadastroview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Cadastro',style: TextStyle(fontSize: 50),))),
      body: SingleChildScrollView(
        child: Form(
          key: chave,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: capturarusuario,
                  validator: context.read<AutenticarVM>().validarusuario,
                  decoration: InputDecoration(
                    labelText: 'Nome do usuário',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ), // usuario
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: context.read<AutenticarVM>().validaremail,
                  controller: capturaremail,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ), // email
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: context.read<AutenticarVM>().validarsenha,
                  controller: capturarsenha,
                  decoration: InputDecoration(
                    labelText: 'Criar senha',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ), // senha
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: context.read<AutenticarVM>().confirmasenha,
                  controller: capturarconfirmasenha,
                  decoration: InputDecoration(
                    labelText: 'Confirma senha',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ), // confirma senha
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(onTap:(){
                  final bool vali = chave.currentState!.validate();
                },child: Container(width: 150,height: 60,decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(5)),child: Center(child: Text('Cadastrar',style: TextStyle(fontSize: 25,color: Colors.white),)),)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
