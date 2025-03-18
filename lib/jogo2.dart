import 'package:flutter/material.dart';
import 'dart:math';

class Jogo2 extends StatefulWidget {
  const Jogo2({super.key});

  @override
  State<Jogo2> createState() => _Jogo2State();
}

class _Jogo2State extends State<Jogo2> {
  var _imagemApp = AssetImage('images/padrao.png')!;
  var _mensagem = '';

  final Map<String, AssetImage> _opcaoImagem = {
    'pedra': AssetImage('images/pedra.png')!,
    'papel': AssetImage('images/papel.png')!,
    'tesoura': AssetImage('images/tesoura.png')!,
  };

  void _opcaoSelecionada(String escolhaUsuario) {
    final opcoes = ['pedra', 'papel', 'tesoura'];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];
    setState(() {
      this._imagemApp = _opcaoImagem[escolhaApp]!;

      if (
        (escolhaUsuario == 'pedra' && escolhaApp == 'tesoura') ||
        (escolhaUsuario == 'tesoura' && escolhaApp == 'papel') ||
        (escolhaUsuario == 'papel' && escolhaApp == 'pedra')
      ) {
        setState(() {
          this._mensagem = 'Parabéns! Você ganhou!';
        });
      } else if (
        (escolhaApp == 'pedra' && escolhaUsuario == 'tesoura') ||
        (escolhaApp == 'tesoura' && escolhaUsuario == 'papel') ||
        (escolhaApp == 'papel' && escolhaUsuario == 'pedra')
      ) {
        setState(() {
          this._mensagem = 'Você perdeu!';
        });
      } else {
        setState(() {
          this._mensagem = 'Empatamos!';
        });
      }
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jokenpo'),
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
          Image(image: this._imagemApp),
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
              GestureDetector(
                onTap: () => _opcaoSelecionada('pedra'),
                child: Image.asset('images/pedra.png', height: 100,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada('papel'),
                child: Image.asset('images/papel.png', height: 100,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada('tesoura'),
                child: Image.asset('images/tesoura.png', height: 100,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
