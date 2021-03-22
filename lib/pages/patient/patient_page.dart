import 'package:consulta_marcada/styles/custom_text.dart';
import 'package:flutter/material.dart';

class PatientPage extends StatefulWidget {
  @override
  _PatientPageState createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CustomText(
          text: "Página de Pacientes",
          fontSize: 20,
        ),
      ),
    );
  }
}
