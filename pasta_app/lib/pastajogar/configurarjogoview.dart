import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'carregarjogoview.dart';
import 'jogarviewmodel.dart';

class Configurarjogoview extends StatelessWidget {
  final chave = GlobalKey<FormState>();
  Configurarjogoview({super.key});

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuEntry> opcaocategoria() {
      List<dynamic> listatexto = context.read<JogarVM>().listacategoria();
      List<DropdownMenuEntry> opcao = [];
      for (
        int quantidade = 0;
        quantidade <= listatexto.length - 1;
        quantidade++
      ) {
        opcao.add(
          DropdownMenuEntry(
            value: '${listatexto[quantidade]['id']}',
            label: '${listatexto[quantidade]['name']}',
          ),
        );
      }
      return opcao;
    }

    return Scaffold(
      drawer: Drawer(
        child: ListView(children: [
          DrawerHeader(child: Row(children: [Icon(Icons.settings),Text('Configuração')],)),
          SegmentedButton(
            segments: [
              ButtonSegment(value: 'Ingles', label: Text('Ingles')),
              ButtonSegment(value: 'Portugues', label: Text('Portugues')),
            ],
            selected: {
              context.watch<JogarVM>().idioma_selecionado,
            },
            onSelectionChanged: (Set selecionado) {
              context.read<JogarVM>().mudaridioma(selecionado);
            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Claridade'),

            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],)
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Adventure Quiz',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
            color: Colors.deepPurpleAccent,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Text(
              'Configuração do jogo',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Color(0xFFD1C4E9)),
              ),
              width: MediaQuery.of(context).size.width,
              height: 110,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'imagens/controle-de-video-game.png',
                        ),
                      ),
                      Text(
                        'Nivel de dificuldade',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  SegmentedButton(
                    segments: [
                      ButtonSegment(value: 'easy', label: Text('easy')),
                      ButtonSegment(value: 'medium', label: Text('medium')),
                      ButtonSegment(value: 'hard', label: Text('hard')),
                    ],
                    selected: {
                      context.watch<JogarVM>().dadospararequisicao['nivel'],
                    },
                    onSelectionChanged: (Set selecionado) {
                      context.read<JogarVM>().mudarnivel(selecionado);
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 110,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Color(0xFFD1C4E9)),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('imagens/ponto-de-interrogacao.png'),
                      ),
                      Text(
                        'Quantidade de perguntas',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.read<JogarVM>().diminuirpergunta();
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              '-',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 60,
                        height: 30,
                        child: Center(
                          child: Text(
                            '${context.watch<JogarVM>().quantidadeperguntas}',
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<JogarVM>().aumentarpergunta();
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              '+',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 140,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Color(0xFFD1C4E9)),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('imagens/abra-o-livro.png'),
                      ),
                      Text(
                        'Categoria de perguntas',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  Form(
                    key: chave, // final chave = GlobalKey<FormState>();
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: FormField(
                      validator: (valor) {
                        if (valor == null) {
                          return 'Esse campo é obrigatorio';
                        } else {
                          return null;
                        }
                      },
                      builder: (estado) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: DropdownMenu(
                                label: Text('Selecione a categoria'),
                                onSelected: (valor) {
                                  if (valor == null) {
                                    print('nada passado');
                                  } else {
                                    estado.didChange(valor);
                                    context
                                            .read<JogarVM>()
                                            .dadospararequisicao['categoria'] =
                                        valor;
                                  }
                                },
                                dropdownMenuEntries: opcaocategoria(),
                              ),
                            ),
                            if (estado.hasError)
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 12,
                                  top: 4,
                                ),
                                child: Text(
                                  estado.errorText!,
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.error,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 180, left: 10, right: 10),
            child: GestureDetector(
              onTap: () {
                if (chave.currentState!.validate()) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => const Carregarjogoview(),
                    ),
                    (var valor) => false,
                  );
                } else {}
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.blue,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.play_circle, color: Colors.white),
                    Text(
                      'jogar',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
