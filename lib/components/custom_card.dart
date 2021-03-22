import 'package:consulta_marcada/styles/custom_text.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String patient;
  final String doctor;
  final String date;

  CustomCard({
    @required this.patient,
    @required this.doctor,
    @required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            buildRow("Paciente: ", patient),
            buildRow("Médico: ", doctor),
            buildRow("Data e hora: ", date),
          ],
        ),
      ),
    );
  }

  Row buildRow(String title, String content) {
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
