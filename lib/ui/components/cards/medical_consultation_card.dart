import 'package:consulta_marcada/core/models/medical_consultation.dart';
import 'package:consulta_marcada/ui/components/cards/lateral_bar.dart';
import 'package:consulta_marcada/ui/components/cards/text_line.dart';
import 'package:consulta_marcada/ui/styles/my_colors.dart';
import 'package:flutter/material.dart';

class MedicalConsultationCard extends StatelessWidget {
  final MedicalConsultation consultation;

  MedicalConsultationCard({@required this.consultation});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          LateralBar(color: MyColors.appColors["dark-blue"], height: 110),
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
          children: [
            TextLine(title: "Paciente: ", content: consultation.patient.name),
            TextLine(title: "Médico: ", content: consultation.doctor.name),
            TextLine(title: "Data e hora: ", content: consultation.date),
          ],
        ),
      ),
    );
  }
}
