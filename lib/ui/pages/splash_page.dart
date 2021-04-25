import 'package:consulta_marcada/core/models/user.dart';
import 'package:consulta_marcada/core/utils/navigator.dart';
import 'package:consulta_marcada/ui/bloc/user_bloc.dart';
import 'package:consulta_marcada/ui/pages/home/home_page.dart';
import 'package:consulta_marcada/ui/pages/user/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    splash(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/logo.png',
        ),
      ),
    );
  }

  void splash(context) {
    UserBloc userBloc = Provider.of<UserBloc>(context, listen: false);
    Future.delayed(Duration(milliseconds: 100)).then((value) async {
      User user = await userBloc.activeUser();
      if (user != null) {
        push(context, HomePage(), replace: true);
      } else {
        push(context, LoginPage(), replace: true);
      }
    });
  }
}
