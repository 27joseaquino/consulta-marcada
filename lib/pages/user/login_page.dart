import 'package:consulta_marcada/components/custom_button.dart';
import 'package:consulta_marcada/components/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: <Widget>[
                Container(
                  height: 150.0,
                  child: Image.asset("logo.png", fit: BoxFit.contain),
                ),
                SizedBox(height: 40.0),
                CustomTextField(hintText: "E-mail"),
                SizedBox(height: 20.0),
                CustomTextField(hintText: "Senha", obscure: true),
                SizedBox(height: 30.0),
                CustomButton(title: "Entrar"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
