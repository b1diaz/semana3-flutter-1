import 'package:flutter/material.dart';
import 'package:semana3noticias/models/articulo.models.dart';
import 'package:semana3noticias/providers/articulo.provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ArticuloProvider articuloProvider = ArticuloProvider();
  Future<List<Articulo>> listaArticulos = Future.value([]);

  @override
  void initState() {
    listaArticulos = articuloProvider.getArticulos();
    super.initState();
  }

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
    return FutureBuilder(
        future: listaArticulos,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Text> lista = [];
            snapshot.data.forEach((articulo) {
              lista.add(Text(articulo.author));
            });
            return ListView(
              children: lista,
            );
          }
          return Text("No hay Data");
        });
  }
}
