import 'package:consulta_marcada/ui/styles/my_colors.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final bool textOverFlowEllipsis;
  final int maxlines;

  CustomText({
    @required this.text,
    @required this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.textOverFlowEllipsis = false,
    this.maxlines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: fontSize,
        color: color ?? MyColors.appColors["grey"],
      ),
      maxLines: maxlines,
      overflow: _overFlow(),
    );
  }

  _overFlow() {
    if (textOverFlowEllipsis) return TextOverflow.ellipsis;
    return null;
  }
}
