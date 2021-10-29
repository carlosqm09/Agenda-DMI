import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

// delete
Future<http.Response?> deleteStudents(String id) async {
  final http.Response response;
  response = await http.delete(
    Uri.parse('https://api-students-10a.herokuapp.com/students/delete/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
}

Future<http.Response> updateStudents(String id, String name, String grade,
    String group_, String email, String direccion, String lat, String long_) {
  return http.put(
    Uri.parse('https://api-students-10a.herokuapp.com/students/update/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': name,
      'grade': grade,
      'group_': group_,
      'email': email,
      'direccion': direccion,
      'lat': lat,
      'long_': long_
    }),
  );
}

Future<http.Response> createStudents(
    String name, String grade, String group_, String email) {
  return http.post(
    Uri.parse('https://api-students-10a.herokuapp.com/students/add'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': name,
      'grade': grade,
      'group_': group_,
      'email': email
    }),
  );
}
