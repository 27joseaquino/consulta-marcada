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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.all(16),
        child: LayoutBuilder(builder: (context, constrainsts) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              logoConsultaMarcada(
                height: constrainsts.maxHeight * .35,
                width: constrainsts.maxWidth,
              ),
              loginForm(
                context,
                height: constrainsts.maxHeight * .65,
                width: constrainsts.maxWidth,
              ),
            ],
          );
        }),
      ),
    );
  }

  Visibility logoConsultaMarcada({double height, double width}) {
    return Visibility(
      visible: height > 59,
      child: Container(
        padding: EdgeInsets.only(top: 10),
        height: height,
        width: width,
        child: LogoConsultaMarcada(
          fontSize: 25,
          height: height * .5,
          width: width,
        ),
      ),
      replacement: SizedBox(),
    );
  }

  Container loginForm(BuildContext context, {double height, double width}) {
    return Container(
      height: height,
      width: width,
      child: ListView(
        children: [
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
              textAlign: TextAlign.center,
            ),
            CustomText(
              fontSize: 20,
              text: "Cadastrar",
              fontWeight: FontWeight.bold,
              maxlines: 2,
              textAlign: TextAlign.center,
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
