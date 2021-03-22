import 'package:consulta_marcada/components/custom_button.dart';
import 'package:consulta_marcada/components/custom_text_field.dart';
import 'package:consulta_marcada/core/utils/navigator.dart';
import 'package:consulta_marcada/pages/home/home_page.dart';
import 'package:consulta_marcada/pages/user/login_page.dart';
import 'package:consulta_marcada/styles/custom_text.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _cpf = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();

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
                hintText: "CPF",
                controller: _cpf,
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
              CustomTextField(
                hintText: " Confirmar Senha",
                obscure: true,
                controller: _confirmPassword,
              ),
              CustomButton(
                title: "Cadastrar",
                height: 50,
                width: double.infinity,
                onPressed: _onClickRegister,
              ),
              pushLoginPage(context),
            ],
          ),
        ),
      ),
    );
  }

  InkWell pushLoginPage(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            CustomText(
              fontSize: 20,
              text: "Já possui uma conta? ",
              maxlines: 2,
            ),
            CustomText(
              fontSize: 20,
              text: "Entrar",
              fontWeight: FontWeight.bold,
              maxlines: 2,
            ),
          ],
        ),
      ),
      onTap: () => push(context, LoginPage(), replace: true),
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

  _onClickRegister() {
    String cpf = _cpf.text;
    String email = _email.text;
    String password = _password.text;
    String confirmPassword = _confirmPassword.text;
    print("E-mail: " +
        email +
        " - Senha: " +
        password +
        "CPF" +
        cpf +
        "confirmar Senha" +
        confirmPassword);

    push(context, HomePage(), replace: true);
  }
}
