import 'package:consulta_marcada/ui/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppFloatingButton extends StatelessWidget {
  final Function onPressed;
  AppFloatingButton({@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add, color: Colors.white),
      onPressed: onPressed,
      backgroundColor: AppColors.darkBlue,
    );
  }
}
