import 'package:consulta_marcada/ui/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: AppColors.blue,
  scaffoldBackgroundColor: Colors.grey[200],
  appBarTheme: AppBarTheme(
    color: AppColors.blue,
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
    selectedItemColor: AppColors.blue,
    unselectedItemColor: AppColors.grey,
  ),
);
