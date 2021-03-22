import 'package:consulta_marcada/components/custom_button.dart';
import 'package:consulta_marcada/components/custom_text_field.dart';
import 'package:consulta_marcada/core/utils/navigator.dart';
import 'package:consulta_marcada/pages/home/home_page.dart';
import 'package:consulta_marcada/pages/user/register_page.dart';
import 'package:consulta_marcada/styles/custom_text.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              logo(),
              CustomTextField(
                hintText: "E-mail",
                controller: _email,
              ),
              CustomTextField(
                hintText: "Senha",
                obscure: true,
                controller: _password,
              ),
              CustomButton(
                title: "Entrar",
                height: 50,
                width: double.infinity,
                onPressed: _onClickLogin,
              ),
              pushRegisterPage(context),
            ],
          ),
        ),
      ),
    );
  }

  InkWell pushRegisterPage(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            CustomText(
              fontSize: 20,
              text: "Ainda não uma conta? ",
              maxlines: 2,
            ),
            CustomText(
              fontSize: 20,
              text: "Cadastrar",
              fontWeight: FontWeight.bold,
              maxlines: 2,
            ),
          ],
        ),
      ),
      onTap: () => push(context, RegisterPage(), replace: true),
    );
  }

  Container logo() {
    return Container(
      margin: EdgeInsets.only(top: 16, bottom: 16),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 16, bottom: 16),
            height: 150,
            child: Image.asset("assets/logo.png", fit: BoxFit.contain),
          ),
          CustomText(
            text: "Consulta Marcada",
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }

  _onClickLogin() {
    String email = _email.text;
    String password = _password.text;

    print("E-mail: " + email + " - Senha: " + password);

    push(context, HomePage(), replace: true);
  }
}
