import 'package:consulta_marcada/ui/styles/custom_text.dart';
import 'package:consulta_marcada/ui/styles/my_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final double height;
  final double width;
  final Function onPressed;

  CustomButton({
    @required this.title,
    @required this.height,
    @required this.width,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      height: height,
      width: width,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: MyColors.appColors["blue"],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: CustomText(
          text: title,
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
