import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String url1 = "https://api.thecatapi.com/v1/breeds";

Future<dynamic> _getListado() async {
  final respuesta = await http.get(Uri.parse(url1));

  if (respuesta.statusCode == 200) {
    return jsonDecode(respuesta.body);
  } else {
    print("Error con la respuesta");
  }
}

List<Widget> listado(List<dynamic> info) {
  List<Widget> lista = [];

  info.forEach((elemento) {
    lista.add(Text(
      elemento["name"],
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontWeight: FontWeight.bold),
    ));

    lista.add(Text(elemento["description"]));
    lista.add(RichText(
      text: TextSpan(
        text: '\n',
        children: const <TextSpan>[
          TextSpan(
              text: 'Temperamento:',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    ));
    lista.add(Text(elemento["temperament"]));
  });
  return lista;
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Razas de Gatos"),
        ),
        body: FutureBuilder<dynamic>(
          future: _getListado(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot);
              return ListView(children: listado(snapshot.data));
            } else {
              print("No hay información");
              return Text("Sin datos");
            }
          },
          initialData: Center(child: CircularProgressIndicator()),
        ));
  }
}
