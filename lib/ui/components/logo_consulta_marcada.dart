import 'package:consulta_marcada/ui/components/custom_text.dart';
import 'package:flutter/material.dart';

class LogoConsultaMarcada extends StatelessWidget {
  final double height;
  final double width;
  final double fontSize;

  LogoConsultaMarcada({
    @required this.height,
    @required this.width,
    @required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            height: height,
            width: width,
            child: Image.asset("assets/logo.png", fit: BoxFit.contain),
          ),
          CustomText(
            text: "Consulta Marcada",
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            maxlines: 2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
