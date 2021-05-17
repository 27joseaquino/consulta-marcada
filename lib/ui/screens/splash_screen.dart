import 'package:consulta_marcada/core/models/user.dart';
import 'package:consulta_marcada/core/utils/navigator.dart';
import 'package:consulta_marcada/ui/providers/user_provider.dart';
import 'package:consulta_marcada/ui/screens/home/home_screen.dart';
import 'package:consulta_marcada/ui/screens/user/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
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
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);

    Future.delayed(Duration(milliseconds: 100)).then((value) async {
      User user = await userProvider.activeUser();
      if (user != null) {
        push(context, HomeScreen(), replace: true);
      } else {
        push(context, LoginScreen(), replace: true);
      }
    });
  }
}
