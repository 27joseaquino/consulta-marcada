import 'package:consulta_marcada/ui/styles/app_colors.dart';
import 'package:consulta_marcada/ui/widgets/app_text.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  final double fontSize;
  final double height;
  final double width;
  final bool hasBorder;
  final Function onPressed;

  AppButton({
    @required this.title,
    @required this.onPressed,
    this.height,
    this.width,
    this.fontSize = 25,
    this.hasBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      height: height,
      width: width,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: hasBorder ? Colors.grey[200] : AppColors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: AppColors.blue, width: 2),
          ),
        ),
        child: AppText(
          text: title,
          color: hasBorder ? AppColors.blue : Colors.white,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
