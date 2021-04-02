import 'package:consulta_marcada/core/utils/navigator.dart';
import 'package:consulta_marcada/ui/components/buttons/custom_button.dart';
import 'package:consulta_marcada/ui/components/form/custom_text_field.dart';
import 'package:consulta_marcada/ui/components/logo_consulta_marcada.dart';
import 'package:consulta_marcada/ui/pages/home/home_page.dart';
import 'package:consulta_marcada/ui/pages/user/login_page.dart';
import 'package:consulta_marcada/ui/styles/custom_text.dart';
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
              LogoConsultaMarcada(
                fontSize: 25,
                height: 150,
                width: 150,
              ),
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
                isObscure: true,
                controller: _password,
              ),
              CustomTextField(
                hintText: "Confirmar Senha",
                isObscure: true,
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
