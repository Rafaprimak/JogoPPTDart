import 'package:flutter/material.dart';
import 'package:flutter_application_1/jogo.dart';
import 'package:flutter_application_1/jogo2.dart'; 

//Criar na tela principal (main) dois botões. Cada um deles, ao ser pressionado, será
//redirecionado para cada um dos jogos implementados;

//Botao para o Jokenpo (Jogo)
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Builder(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text('Escolha um jogo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Jogo()),
                  );
                },
                child: Text('Jokenpo'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Jogo2()),
                  );
                },
                child: Text('Par ou Impar'),
              ),
            ],
          ),
        ),
      ),
    ),
  ));
}


