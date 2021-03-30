import 'package:consulta_marcada/ui/styles/custom_text.dart';
import 'package:flutter/material.dart';

class TextLine extends StatelessWidget {
  final String title;
  final String content;
  TextLine({@required this.title, @required this.content});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(
          text: title,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        CustomText(text: content, fontSize: 18)
      ],
    );
  }
}
