import 'package:consulta_marcada/pages/home/home_page.dart';
import 'package:consulta_marcada/ui/styles/light_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'consulta marcada',
      theme: lightTheme,
      home: HomePage(),
    );
  }
}
