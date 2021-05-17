import 'package:consulta_marcada/core/utils/navigator.dart';
import 'package:consulta_marcada/ui/components/buttons/progress_button.dart';
import 'package:consulta_marcada/ui/components/custom_alert.dart';
import 'package:consulta_marcada/ui/components/custom_text.dart';
import 'package:consulta_marcada/ui/components/form/custom_text_field.dart';
import 'package:consulta_marcada/ui/components/logo_consulta_marcada.dart';
import 'package:consulta_marcada/ui/providers/user_provider.dart';
import 'package:consulta_marcada/ui/screens/home/home_screen.dart';
import 'package:consulta_marcada/ui/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
          height: constrainsts.maxHeight * .4,
          width: constrainsts.maxWidth,
        ),
        loginForm(
          height: constrainsts.maxHeight * .6,
          width: constrainsts.maxWidth,
        ),
      ],
    );
  }

  Container horizontalScreen(BoxConstraints constrainsts) {
    return Container(
      height: constrainsts.maxHeight,
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
          loginButton(),
        ],
      ),
    );
  }

  Consumer<UserProvider> loginButton() {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        if (userProvider.error != null) {
          String errorMessage = userProvider.error;
          userProvider.clearError();

          Future.delayed(Duration.zero, () {
            CustomAlert.alert(
              context: context,
              title: "Erro no Login",
              message: errorMessage,
            );
          });
        }

        return ProgressButton(
          function: () => _onClickLogin(),
          height: 50,
          width: double.infinity,
          content: CustomText(
            text: "Entrar",
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          color: AppColors.blue,
          showProgress: userProvider.isProcessing,
        );
      },
    );
  }

  _onClickLogin() async {
    if (!_loginFormKey.currentState.validate()) return;

    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);

    String email = _email.text.trim();
    String password = _password.text.trim();

    bool success = await userProvider.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (success) {
      push(context, HomeScreen(), replace: true);
    }
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
