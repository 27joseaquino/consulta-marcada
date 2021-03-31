import 'package:consulta_marcada/core/utils/navigator.dart';
import 'package:consulta_marcada/ui/components/buttons/custom_button.dart';
import 'package:consulta_marcada/ui/components/form/custom_text_field.dart';
import 'package:consulta_marcada/ui/components/logo_consulta_marcada.dart';
import 'package:consulta_marcada/ui/pages/home/home_page.dart';
import 'package:consulta_marcada/ui/pages/user/register_page.dart';
import 'package:consulta_marcada/ui/styles/custom_text.dart';
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
        padding: EdgeInsets.only(top: 16, left: 16, right: 16),
        child: LayoutBuilder(builder: (context, constrainsts) {
          return Visibility(
            visible: size.height >= 640,
            child: verticalScreen(constrainsts, context),
            replacement: horizontalScreen(constrainsts, context),
          );
        }),
      ),
    );
  }

  Column verticalScreen(BoxConstraints constrainsts, BuildContext context) {
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
          height: constrainsts.maxHeight * .45,
          width: constrainsts.maxWidth,
        ),
        Visibility(
          visible: constrainsts.maxHeight > 388,
          child: pushRegisterPage(
            context,
            height: constrainsts.maxHeight * .2,
            width: constrainsts.maxWidth,
          ),
          replacement: SizedBox(),
        ),
      ],
    );
  }

  Column horizontalScreen(
    BoxConstraints constrainsts,
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 16),
          height: constrainsts.maxHeight * .8,
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
                context,
                height: constrainsts.maxHeight * .65,
                width: constrainsts.maxWidth * .6,
              ),
            ],
          ),
        ),
        Visibility(
          visible: constrainsts.maxHeight >= 344,
          child: pushRegisterPage(
            context,
            height: constrainsts.maxHeight * .2,
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
        padding: EdgeInsets.only(top: 10),
        height: height,
        width: width,
        child: LogoConsultaMarcada(
          fontSize: height * .15,
          height: height * .6,
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
        ],
      ),
    );
  }

  InkWell pushRegisterPage(
    BuildContext context, {
    double height,
    double width,
  }) {
    return InkWell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
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
