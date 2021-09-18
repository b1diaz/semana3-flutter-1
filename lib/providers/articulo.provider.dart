import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:semana3noticias/models/articulo.models.dart';

class ArticuloProvider {
  List<Articulo> listaArticulos = [];

  Future<List<Articulo>> getArticulos() async {
    Map<String, String> parametros = {
      'q': 'tesla',
      'from': '2021-09-09',
      'sortBy': 'publishedAt',
      'apiKey': '38ea433bd56c43e2901ed2172c566f2f'
    };
    var url = Uri.https('newsapi.org', '/v2/everything', parametros);

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      jsonResponse['articles']
          .forEach((item) => {listaArticulos.add(Articulo.fromJson(item))});
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    print(listaArticulos);
    return listaArticulos;
  }
}
