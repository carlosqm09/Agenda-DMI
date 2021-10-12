import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String url1 = "https://emergencynumberapi.com/api/country/484";

Future<dynamic> _getListado() async {
  final respuesta = await http.get(Uri.parse(url1));

  if (respuesta.statusCode == 200) {
    return jsonDecode(respuesta.body);
  } else {
    print("Error con la respusta");
  }
}

List<Widget> listado(List<dynamic> info) {
  List<Widget> lista = [];
  info.forEach((elemento) {
    lista.add(Text(elemento[""]));
  });
  return lista;
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Listado API"),
        ),
        body: FutureBuilder<dynamic>(
          future: _getListado(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot);
              return ListView(children: listado(snapshot.data));
            } else {
              print("No hay información");
              return Text("Sin data");
            }
          },
          initialData: Center(child: CircularProgressIndicator()),
        ));
  }
}
