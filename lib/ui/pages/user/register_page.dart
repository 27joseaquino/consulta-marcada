import 'package:consulta_marcada/core/utils/navigator.dart';
import 'package:consulta_marcada/ui/components/buttons/custom_button.dart';
import 'package:consulta_marcada/ui/components/form/custom_text_field.dart';
import 'package:consulta_marcada/ui/components/logo_consulta_marcada.dart';
import 'package:consulta_marcada/ui/pages/home/home_page.dart';
import 'package:consulta_marcada/ui/pages/user/login_page.dart';
import 'package:consulta_marcada/ui/components/custom_text.dart';
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
                  height: constraints.maxHeight > 404
                      ? constraints.maxHeight * .2
                      : constraints.maxHeight * .4,
                  width: constraints.maxWidth,
                ),
                registrationForm(
                  height: constraints.maxHeight > 404
                      ? constraints.maxHeight * .7
                      : constraints.maxHeight * .6,
                  width: constraints.maxWidth,
                ),
                Visibility(
                  visible: constraints.maxHeight > 404,
                  child: pushLoginPage(
                    height: constraints.maxHeight * .1,
                    width: constraints.maxWidth,
                  ),
                  replacement: SizedBox(),
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
      padding: EdgeInsets.only(top: height * .2),
      height: height,
      width: width,
      child: LogoConsultaMarcada(
        fontSize: height * .1,
        height: height * .65,
        width: width,
      ),
    );
  }

  Container registrationForm({double height, double width}) {
    return Container(
      padding: EdgeInsets.only(top: height * .05),
      height: height,
      width: width,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Form(
              key: _registerFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                    hintText: "CPF",
                    controller: _cpf,
                    maxLength: 20,
                  ),
                  CustomTextField(
                    hintText: "E-mail",
                    controller: _email,
                    textInputType: TextInputType.emailAddress,
                    validator: _emailValidation,
                  ),
                  CustomTextField(
                    hintText: "Senha",
                    isObscure: true,
                    validator: _passwordValidation,
                    controller: _password,
                  ),
                  CustomTextField(
                    hintText: "Confirmar Senha",
                    isObscure: true,
                    validator: _passwordValidation,
                    controller: _confirmPassword,
                  ),
                ],
              ),
            ),
            CustomButton(
              title: "Cadastrar",
              height: 50,
              width: width,
              onPressed: _onClickRegister,
            ),
          ],
        ),
      ),
    );
  }

  Container pushLoginPage({double height, double width}) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(vertical: 2),
      child: InkWell(
        child: CustomText(
          fontSize: 18,
          text: "Já possui uma conta? Entrar",
          maxlines: 2,
          textAlign: TextAlign.center,
        ),
        onTap: () => push(context, LoginPage(), replace: true),
      ),
    );
  }

  _onClickRegister() {
    if (!_registerFormKey.currentState.validate()) return;

    String cpf = _cpf.text;
    String email = _email.text;
    String password = _password.text;
    String confirmPassword = _confirmPassword.text;

    print("CPF: $cpf");
    print("E-mail: $email");
    print("Senha: $password");
    print("Confirmar Senha: $confirmPassword");

    push(context, HomePage(), replace: true);
  }

  String _passwordValidation(String text) {
    if (text.isEmpty) {
      return "Preencha este campo!";
    } else if (text.length > 50) {
      return "Você ultrapassou o limite de caracteres!";
    } else if (text.length < 8) {
      return "A senha precisa ter no mínimo 8 caracteres!";
    } else if (_confirmPassword.text != _password.text &&
        _confirmPassword.text.isNotEmpty &&
        _password.text.isNotEmpty) {
      return "Os campos SENHA e CONFIRMAR SENHA estão diferentes!";
    }
    return null;
  }

  String _emailValidation(String text) {
    if (text.isEmpty) {
      return "Preencha este campo!";
    } else if (text.length > 50) {
      return "Você ultrapassou o limite de caracteres!";
    } else if (!text.contains('@gmail.com') &&
        !text.contains('@outlook.com') &&
        !text.contains('@hotmail.com')) {
      return "Este e-mail é inválido!";
    }
    return null;
  }
}
