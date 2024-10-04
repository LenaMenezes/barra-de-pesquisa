import 'package:flutter/material.dart';
import 'package:scroll_view/carro_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _BarraPesquisa createState() => _BarraPesquisa();
}

class _BarraPesquisa extends State<MainPage> {
  final controller = TextEditingController();
  List<Carros> carros = allCarros;
  String query = '';

  void pesquisaCar(String query) {
    final suggestion = allCarros.where((carro) {
      final carroNome = carro.nome.toLowerCase();
      final input = query.toLowerCase();

      return carroNome.contains(input);
    }).toList();

    setState(() {
      this.query = query;  // Atualiza a query
      carros = suggestion;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Barra de pesquisa'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(16),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Pesquisar carros',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                ),
                onChanged: pesquisaCar,
              ),
            ),
            if (query.isNotEmpty) // Só exibe a lista se a query não estiver vazia
              Expanded(
                child: ListView.builder(
                  itemCount: carros.length,
                  itemBuilder: (context, index) {
                    final carro = carros[index];

                    return ListTile(
                      leading: Image.network(
                        carro.image,
                        fit: BoxFit.cover,
                        height: 50,
                        width: 50,
                      ),
                      title: Text(carro.nome),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CarroPage(carro: carro),
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      );
}

class Carros {
  final String nome;
  final String image;

  const Carros({
    required this.nome,
    required this.image,
  });
}

const allCarros = [
  Carros(
    nome: 'Billie red hair',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0PBg0XUkyH4aLL69tuCXRQSK35Xif4MjdYlSNcGKlC2YP7fKUODDS1JZPjflb6EruwK0&usqp=CAU',
  ),
  Carros(
    nome: 'Billie green hair',
    image:'https://media.cnn.com/api/v1/images/stellar/prod/210317181128-billie-eilish-file-2020.jpg?q=w_2163,h_1380,x_0,y_0,c_fill',
  ),
  Carros(
    nome: 'Billie blue hair', 
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJ9CZO_1RQQL9BPRFjJgLnlzKQVPf97HooGw&s'
  ),
  Carros(
    nome: 'Billie gray hair', 
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCLqSKDiOHJuYLKbwESbKJC26YFg_s3-eeGQ&s'
  ),
  Carros(
    nome: 'Billie blonde hair', 
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXNc2DGfH8xjAFm9JCwJchlZvUQqzaajEqGj77FyNoq7Bs8KwnRSxp37bRPnnELfiZw2I&usqp=CAU'
  ),
    Carros(
    nome: 'Jimin black hair', 
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRggVwWMf6g6pPaltytcB4E3YnzzAQHBgxdVg&s'
  ),
  Carros(
    nome: 'Billie black hair', 
    image: 'https://images.hellomagazine.com/horizon/square/d73349b8f519-billie-eilish-tattoo-dragon.jpg'
  ),
  Carros(
    nome: 'Billie black hair', 
    image: 'https://media.zenfs.com/en/hypebae_340/3901c6c967afe79b1b769b36e7cc964a'
  ),
    Carros(
    nome: 'Billie black hair', 
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSB6L5vzDL4qjtoqgR2iKy1QKdWfnlcqkUJuy75MAjZaqMWd-4xyHwiGNQJvF6JkLRoFnc&usqp=CAU'
  ),
  Carros(
    nome: 'Jimin pink hair', 
    image: 'https://64.media.tumblr.com/db1f28f2e3afa1a7246b676da9cb2f85/1a23bf5bd75ae24a-50/s1280x1920/c0be6de565a6aa65ec23e15b77403eb00e0d74fe.jpg'
  ),
  
  // Adicione mais carros aqui
];
