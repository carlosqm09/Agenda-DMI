import 'package:agenda_dmi/tools/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bienvenido extends StatelessWidget {
  Bienvenido({Key? key}) : super(key: key);
  final _prefs = PreferenciasUsuario.instance;


  @override
  Widget build(BuildContext context) {
  final name = _prefs.nombre;
  final foto = _prefs.foto;
  final email = _prefs.email;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Bienvenido $name"),
            Text("Haz iniciado con $email")
          ],
        ),
      ),
    );
  }
}