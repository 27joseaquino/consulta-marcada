import 'package:consulta_marcada/core/utils/navigator.dart';
import 'package:consulta_marcada/ui/components/buttons/custom_button.dart';
import 'package:consulta_marcada/ui/components/form/custom_text_field.dart';
import 'package:consulta_marcada/ui/components/logo_consulta_marcada.dart';
import 'package:consulta_marcada/ui/pages/home/home_page.dart';
import 'package:consulta_marcada/ui/pages/user/register_page.dart';
import 'package:consulta_marcada/ui/components/custom_text.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.only(top: 16, left: 16, right: 16),
        child: LayoutBuilder(builder: (context, constrainsts) {
          return Visibility(
            visible: size.height >= 640,
            child: verticalScreen(constrainsts),
            replacement: horizontalScreen(constrainsts),
          );
        }),
      ),
    );
  }

  Column verticalScreen(BoxConstraints constrainsts) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        logoConsultaMarcada(
          height: constrainsts.maxHeight * .35,
          width: constrainsts.maxWidth,
        ),
        loginForm(
          height: constrainsts.maxHeight * .5,
          width: constrainsts.maxWidth,
        ),
        Visibility(
          visible: constrainsts.maxHeight > 500,
          child: pushRegisterPage(
            height: constrainsts.maxHeight * .15,
            width: constrainsts.maxWidth,
          ),
          replacement: SizedBox(),
        ),
      ],
    );
  }

  Column horizontalScreen(BoxConstraints constrainsts) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: constrainsts.maxHeight * .88,
          width: constrainsts.maxWidth,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              logoConsultaMarcada(
                height: constrainsts.maxHeight * .35,
                width: constrainsts.maxWidth * .4,
              ),
              loginForm(
                height: constrainsts.maxHeight * .8,
                width: constrainsts.maxWidth * .6,
              ),
            ],
          ),
        ),
        Visibility(
          visible: constrainsts.maxHeight >= 344,
          child: pushRegisterPage(
            height: constrainsts.maxHeight * .12,
            width: constrainsts.maxWidth,
          ),
          replacement: SizedBox(),
        ),
      ],
    );
  }

  Visibility logoConsultaMarcada({double height, double width}) {
    return Visibility(
      visible: height > 90,
      child: Container(
        padding: EdgeInsets.only(top: height * .2),
        height: height,
        width: width,
        child: LogoConsultaMarcada(
          fontSize: height * .1,
          height: height * .6,
          width: width,
        ),
      ),
      replacement: SizedBox(),
    );
  }

  Container loginForm({double height, double width}) {
    return Container(
      padding: EdgeInsets.only(top: height * .1),
      height: height,
      width: width,
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Form(
            key: _loginFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  hintText: "E-mail",
                  controller: _email,
                  textInputType: TextInputType.emailAddress,
                  validator: _emailValidation,
                ),
                CustomTextField(
                  hintText: "Senha",
                  isObscure: true,
                  controller: _password,
                  validator: _passwordValidation,
                ),
              ],
            ),
          ),
          CustomButton(
            title: "Entrar",
            height: 50,
            width: double.infinity,
            onPressed: _onClickLogin,
          ),
        ],
      ),
    );
  }

  Container pushRegisterPage({double height, double width}) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(vertical: 2),
      child: InkWell(
        child: CustomText(
          fontSize: 20,
          text: "Ainda não possui uma conta? Cadastrar",
          maxlines: 2,
          textAlign: TextAlign.center,
        ),
        onTap: () => push(context, RegisterPage(), replace: true),
      ),
    );
  }

  _onClickLogin() {
    if (!_loginFormKey.currentState.validate()) return;

    String email = _email.text;
    String password = _password.text;

    print("E-mail: $email");
    print("Senha: $password");

    push(context, HomePage(), replace: true);
  }

  String _passwordValidation(String text) {
    if (text.isEmpty) {
      return "Preencha este campo!";
    } else if (text.length > 50) {
      return "Você ultrapassou o limite de caracteres!";
    } else if (text.length < 8) {
      return "A senha precisa ter no mínimo 8 caracteres!";
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
