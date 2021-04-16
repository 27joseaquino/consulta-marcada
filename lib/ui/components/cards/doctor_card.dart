import 'package:consulta_marcada/core/models/doctor.dart';
import 'package:consulta_marcada/ui/components/cards/lateral_bar.dart';
import 'package:consulta_marcada/ui/components/cards/text_line.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final Doctor doctor;
  DoctorCard(this.doctor);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          LateralBar(
            color: doctor.isActive ? Colors.green : Colors.red,
            height: 110,
          ),
          buildContent(),
        ],
      ),
    );
  }

  Expanded buildContent() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 16, top: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextLine(title: "Médico(a)", content: doctor.name),
            TextLine(title: "Especialidade", content: doctor.specialty),
          ],
        ),
      ),
    );
  }
}
