import 'package:agenda_dmi/bloc/login_bloc.dart';
import 'package:agenda_dmi/widgets/LoginButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final login = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 24),
              child: Text(
                "AgendaApp",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            LoginButton(
              width: "300",
              height: "45",
              backgroundColor: Color(0xffDC4E41),
              onPressed: () async {
                final result = await login.signInGoogle();
                if (result) {
                  Navigator.of(context).pushNamed("/bienvenida");
                } else {
                  final scaffold = ScaffoldMessenger.maybeOf(context);

                  scaffold!.showSnackBar(
                      SnackBar(content: Text("Error al iniciar sesión")));
                }
              },
              children: [
                FaIcon(
                  FontAwesomeIcons.google,
                  color: Colors.white,
                ),
                Container(
                    margin: EdgeInsets.only(left: double.parse("60")),
                    child: Text(
                      'Inicia sesión con Google',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
