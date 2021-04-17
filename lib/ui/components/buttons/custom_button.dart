import 'package:consulta_marcada/ui/components/custom_text.dart';
import 'package:consulta_marcada/ui/styles/my_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final double fontSize;
  final double height;
  final double width;
  final bool hasBorder;
  final Function onPressed;

  CustomButton({
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
          backgroundColor:
              hasBorder ? Colors.grey[200] : MyColors.appColors["blue"],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: MyColors.appColors["blue"], width: 2),
          ),
        ),
        child: CustomText(
          text: title,
          color: hasBorder ? MyColors.appColors["blue"] : Colors.white,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
