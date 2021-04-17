import 'package:consulta_marcada/ui/components/custom_text.dart';
import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String text;
  CustomField({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey[200], blurRadius: 2)],
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: EdgeInsets.only(left: 16, top: 10, right: 5, bottom: 10),
        child: CustomText(
          text: text,
          fontSize: 18,
          maxlines: 10,
        ),
      ),
    );
  }
}
