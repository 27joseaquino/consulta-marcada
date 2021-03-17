import 'package:consulta_marcada/ui/styles/custom_text.dart';
import 'package:flutter/material.dart';

class HomeButtons extends StatefulWidget {
  @override
  _HomeButtonsState createState() => _HomeButtonsState();
}

class _HomeButtonsState extends State<HomeButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CustomText(
          text: "Home",
          fontSize: 20,
        ),
      ),
    );
  }
}
