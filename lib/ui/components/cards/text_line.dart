import 'package:consulta_marcada/ui/styles/custom_text.dart';
import 'package:flutter/material.dart';

class TextLine extends StatelessWidget {
  final String title;
  final String content;
  final Color color;
  TextLine({this.title, this.content, this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Visibility(
          visible: title != null,
          child: CustomText(
              text: '$title: ', fontSize: 16, fontWeight: FontWeight.bold),
          replacement: Text(" "),
        ),
        Visibility(
          visible: content != null,
          child: Expanded(
            child: Container(
              child: CustomText(
                text: content,
                fontSize: 16,
                color: color != null ? color : null,
                fontWeight: color != null ? FontWeight.bold : null,
                textOverFlowEllipsis: true,
                maxlines: 1,
              ),
            ),
          ),
          replacement: Text(" "),
        ),
      ],
    );
  }
}
