import 'package:agenda_dmi/pages/home.dart';
import 'package:flutter/material.dart';
import 'controllers.dart';
import 'package:flutter/services.Dart';

class Agregar extends StatefulWidget {
  @override
  _CreateStudents createState() => _CreateStudents();
}

class _CreateStudents extends State<Agregar> {
  late TextEditingController nameTextController;
  late TextEditingController gradeTextController;
  late TextEditingController groupextController;
  late TextEditingController emailTextController;
  late String name;
  late String grade;
  late String group_;
  late String email;
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Agregar estudiante'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
                key: formkey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 50),
                    TextFormField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(255),
                      ],
                      decoration: InputDecoration(labelText: "Nombre:"),
                      initialValue: '',
                      onSaved: (value) {
                        name = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '¡Campo Vacio!';
                        }
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Correo:"),
                      initialValue: '',
                      onSaved: (value) {
                        email = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Vacio';
                        }
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Grado:"),
                      keyboardType: TextInputType.number,
                      initialValue: '',
                      onSaved: (value) {
                        grade = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Vacio';
                        }
                      },
                    ),
                    TextFormField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                      ],
                      decoration: InputDecoration(labelText: "Grupo:"),
                      initialValue: '',
                      onSaved: (value) {
                        group_ = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Vacio';
                        }
                      },
                    ),
                    const SizedBox(height: 30),
                    RaisedButton(
                      child: Text('Agregar'),
                      onPressed: () {
                        setState(() {
                          _addStudents(context);
                        });
                      },
                    ),
                  ],
                ))));
  }

  void _addStudents(BuildContext context) {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      createStudents(this.name, this.grade, this.group_, this.email);
      // Navigator.of(context).Push(new MaterialPageRoute(builder: (context) => HomePage())).whenComplete(retrieveData);
      Navigator.of(context)
          .push(new MaterialPageRoute(builder: (context) => HomePage()));
      // Navigator.of(context)
      //     .push(new MaterialPageRoute<String>(builder: (BuildContext context) {
      //   return new HomePage();
      // }));
    }
  }
}
