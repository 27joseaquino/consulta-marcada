import 'package:consulta_marcada/ui/styles/my_colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: MyColors.appColors["blue"],
  accentColor: MyColors.appColors["light-blue"],
  scaffoldBackgroundColor: Colors.grey[200],
  appBarTheme: AppBarTheme(
    color: MyColors.appColors["blue"],
    textTheme: TextTheme(
      headline6: TextStyle(
        fontSize: 25,
        color: Colors.white,
        fontFamily: "Poppins",
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
);
