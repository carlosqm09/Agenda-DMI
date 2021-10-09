import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:agenda_dmi/models/Agenda.dart';
import 'package:http/http.dart' as http;

void main() => runApp(HomeApp());

class HomeApp extends StatefulWidget {
  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  late Future<List<Agenda>> _listadoAgenda;

  Future<List<Agenda>?> _getAgenda() async {
    final urlGetAgenda = Uri.encodeFull('https://agendaprueba.herokuapp.com/contacts');
    final response = await http.get(urlGetAgenda, headers: {
      "Content-Type": "application/json",
      "Access_Control_Allow_Origin": "*"
    });

    late List<Agenda> agenda = [];

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);

      print(jsonData[""]);
      print(response.body);
    } else {
      throw Exception("No funciona");
    }
  }

  @override
  void initState() {
    super.initState();
    _getAgenda();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Consumiendo APIs'),
        ),
        body: Center(
          child: Container(
            child: Text('Consumiendo Apis en Flutter'),
          ),
        ),
      ),
    );
  }
}
