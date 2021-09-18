import 'package:flutter/material.dart';
import 'package:semana3noticias/providers/articulo.provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ArticuloProvider articuloProvider = ArticuloProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: body(),
    );
  }

  body() {
    articuloProvider.getArticulos();
    return Text("Cuerpo de la aplicacion");
  }
}
