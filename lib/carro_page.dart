import 'package:flutter/material.dart';
import 'main.dart'; // Ou ajuste para o arquivo que contém a classe Carros

class CarroPage extends StatelessWidget {
  final Carros carro; // Deve ser apenas um carro

  const CarroPage({
    Key? key,
    required this.carro,
  }) : super(key: key); // Corrigi o construtor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(carro.nome), // Usando "carro.nome" para o título
      ),
      body: Column(
        children: [
          Image.network(
            carro.image,
            width: 500,
            fit: BoxFit.cover,
            // height: 500,
          
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Descrição do carro: ${carro.nome}', // Exibindo o nome do carro
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
