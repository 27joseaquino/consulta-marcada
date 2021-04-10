import 'package:consulta_marcada/core/utils/navigator.dart';
import 'package:consulta_marcada/core/utils/validators.dart';
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
  final GlobalKey<FormState> _registerFormKey = GlobalKey();
  final _cpf = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        height: size.height,
        width: size.width,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                logoConsultaMarcada(
                  height: constraints.maxHeight * .25,
                  width: constraints.maxWidth,
                ),
                registrationForm(
                  height: constraints.maxHeight * .53,
                  width: constraints.maxWidth,
                ),
                buttons(
                  heigth: constraints.maxHeight * .22,
                  width: constraints.maxWidth,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Container logoConsultaMarcada({double height, double width}) {
    return Container(
      padding:EdgeInsets.only(top: height * .2),
      height: height,
      width: width,
      child: LogoConsultaMarcada(
        fontSize: height * .1,
        height: height * .6,
        width: width,
      ),
    );
  }

  Container buttons({double heigth, double width}) {
    return Container(
      height: heigth,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            title: "Cadastrar",
            height: 50,
            width: width,
            onPressed: _onClickRegister,
          ),
          pushLoginPage(),
        ],
      ),
    );
  }

  Container registrationForm({double height, double width}) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      height: height,
      width: width,
      child: Form(
        key: _registerFormKey,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              CustomTextField(
                hintText: "CPF",
                controller: _cpf,
                maxLength: 20,
              ),
              CustomTextField(
                hintText: "E-mail",
                controller: _email,
                maxLength: 50,
              ),
              CustomTextField(
                hintText: "Senha",
                isObscure: true,
                validator: passwordValidation,
                controller: _password,
              ),
              CustomTextField(
                hintText: "Confirmar Senha",
                isObscure: true,
                validator: passwordValidation,
                controller: _confirmPassword,
              ),
            ],
          ),
        ),
      ),
    );
  }

  InkWell pushLoginPage() {
    return InkWell(
      child: Container(
        padding: EdgeInsets.only(top: 5),
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
    if (!_registerFormKey.currentState.validate()) return;

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
