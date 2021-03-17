import 'package:consulta_marcada/ui/styles/custom_text.dart';
import 'package:flutter/material.dart';

class MedicalConsultationPage extends StatefulWidget {
  @override
  _MedicalConsultationPageState createState() =>
      _MedicalConsultationPageState();
}

class _MedicalConsultationPageState extends State<MedicalConsultationPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CustomText(
          text: "Página de Consultas",
          fontSize: 20,
        ),
      ),
    );
  }
}
