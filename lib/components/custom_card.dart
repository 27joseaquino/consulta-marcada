import 'package:consulta_marcada/styles/custom_text.dart';
import 'package:consulta_marcada/styles/my_colors.dart';
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
      child: Row(
        children: [
          buildLateralBar(),
          buildContent(),
        ],
      ),
    );
  }

  FittedBox buildLateralBar() {
    return FittedBox(
      child: Container(
        padding: EdgeInsets.all(0),
        color: MyColors.appColors["dark-blue"],
        width: 10,
        height: 110,
      ),
    );
  }

  Expanded buildContent() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 16, top: 10, bottom: 10),
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
