import 'dart:async';
import 'dart:convert';
import 'Datos_Contactos.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// delete
Future<http.Response?> deletecontacto(String id) async {
  final http.Response response = await http.delete(
    Uri.parse('https://agendaprueba.herokuapp.com/contacts/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
}

Future<http.Response> updateContacto(String id, String apellido, String name,
    String correo, String celular, String user_id) {
  return http.put(
    Uri.parse('https://agendaprueba.herokuapp.com/contacts/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'nombre': name,
      'apellido': apellido,
      'telefono': celular,
      'email': correo,
      'user_id': user_id
    }),
  );
}

Future<http.Response> createcontact(String nombre, String apellido,
    String correo, String numero, String user_id) {
  return http.post(
    Uri.parse('https://agendaprueba.herokuapp.com/contacts'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'nombre': nombre,
      'apellido': apellido,
      'telefono': numero,
      'email': correo,
      'user_id': user_id
    }),
  );
}
