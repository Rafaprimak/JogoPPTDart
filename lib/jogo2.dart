import 'package:flutter/material.dart';
import 'dart:math';

class Jogo2 extends StatefulWidget {
  const Jogo2({super.key});

  @override
  State<Jogo2> createState() => _Jogo2State();
}

class _Jogo2State extends State<Jogo2> {
  var _mensagem = 'Escolha entre Par ou Ímpar';

  void _opcaoSelecionada(String escolhaUsuario) {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Par ou Ímpar'),
          backgroundColor: Colors.green,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                'Escolha do App',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                this._mensagem,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => _opcaoSelecionada('Par'),
                  child: Text('Par'),
                ),
                ElevatedButton(
                  onPressed: () => _opcaoSelecionada('Ímpar'),
                  child: Text('Ímpar'),
                ),
              ],
            ),
          ],
        ),
      );
    }

    void _mostrarEscolhaNumero(String escolhaUsuario) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Escolha um número de 0 a 10'),
            content: Container(
              height: 150,
              child: Column(
                children: List.generate(11, (index) {
                  return ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _verificarResultado(escolhaUsuario, index);
                    },
                    child: Text(index.toString()),
                  );
                }),
              ),
            ),
          );
        },
      );
    }

    void _verificarResultado(String escolhaUsuario, int numeroUsuario) {
      var numeroApp = Random().nextInt(11);
      var soma = numeroUsuario + numeroApp;
      var resultado = soma % 2 == 0 ? 'Par' : 'Ímpar';

      setState(() {
        _mensagem = 'Você escolheu $numeroUsuario e o App escolheu $numeroApp. A soma é $soma, que é $resultado. Você ${resultado == escolhaUsuario ? 'ganhou' : 'perdeu'}!';
      });
    }

    _opcaoSelecionada(escolhaUsuario);
    _mostrarEscolhaNumero(escolhaUsuario);

  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Par ou Ímpar'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              'Escolha do App',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ],
      ),
    );
  }
}
