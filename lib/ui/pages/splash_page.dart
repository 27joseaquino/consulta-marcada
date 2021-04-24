import 'package:consulta_marcada/core/utils/navigator.dart';
import 'package:consulta_marcada/data/database/database.dart';
import 'package:consulta_marcada/ui/pages/user/login_page.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

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
    Future.delayed(Duration(milliseconds: 100)).then((value) async {
      Database db = await ConsultaMarcadaDB().database;

      if (db != null) {
        push(context, LoginPage(), replace: true);
      }
    });
  }
}
