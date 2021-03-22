import 'package:consulta_marcada/components/custom_button.dart';
import 'package:consulta_marcada/components/custom_text_field.dart';
import 'package:consulta_marcada/components/logo_consulta_marcada.dart';
import 'package:consulta_marcada/pages/home/home_page.dart';
import 'package:consulta_marcada/pages/user/register_page.dart';
import 'package:consulta_marcada/styles/custom_text.dart';
import 'package:consulta_marcada/utils/navigator.dart';
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
              LogoConsultaMarcada(
                fontSize: 25,
                height: 150,
                width: 150,
              ),
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
              text: "Ainda não possui uma conta? ",
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

  _onClickLogin() {
    String email = _email.text;
    String password = _password.text;

    print("E-mail: " + email + " - Senha: " + password);

    push(context, HomePage(), replace: true);
  }
}
