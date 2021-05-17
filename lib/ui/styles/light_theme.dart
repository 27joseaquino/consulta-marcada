import 'package:consulta_marcada/ui/styles/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: MyColors.appColors["blue"],
  scaffoldBackgroundColor: Colors.grey[200],
  appBarTheme: AppBarTheme(
    color: MyColors.appColors["blue"],
    textTheme: TextTheme(
      headline6: GoogleFonts.poppins(
        fontSize: 25,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
      size: 25,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    showUnselectedLabels: true,
    elevation: 20,
    selectedItemColor: MyColors.appColors["blue"],
    unselectedItemColor: MyColors.appColors["grey"],
  ),
);
