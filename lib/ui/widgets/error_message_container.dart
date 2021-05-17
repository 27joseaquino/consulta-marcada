import 'package:consulta_marcada/ui/widgets/app_text.dart';
import 'package:flutter/material.dart';

class ErrorMessageContainer extends StatelessWidget {
  final String text;
  final IconData icon;

  ErrorMessageContainer({this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.grey[500],
            size: 26,
          ),
          AppText(
            text: text,
            fontSize: 18,
            color: Colors.grey,
            maxlines: 2,
          ),
        ],
      ),
    );
  }
}
