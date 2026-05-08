import 'package:flutter/material.dart';

class Configurarjogoview extends StatelessWidget {
  const Configurarjogoview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Fernando'),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          SegmentedButton(segments: [
            ButtonSegment(value: 'Fácil',label: Text('Facil')),
            ButtonSegment(value: 'Médio', label: Text('Médio')),
            ButtonSegment(value: 'Difícil', label: Text('Difícil')),
          ], selected: (){})
        ],
      ),
    );
  }
}
