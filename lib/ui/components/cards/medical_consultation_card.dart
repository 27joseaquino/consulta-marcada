import 'package:consulta_marcada/core/models/medical_consultation.dart';
import 'package:consulta_marcada/core/models/static/status.dart';
import 'package:consulta_marcada/core/utils/navigator.dart';
import 'package:consulta_marcada/ui/components/cards/lateral_bar.dart';
import 'package:consulta_marcada/ui/components/cards/text_line.dart';
import 'package:consulta_marcada/ui/pages/medical_consultation/medical_consultation_details_page.dart';
import 'package:flutter/material.dart';

class MedicalConsultationCard extends StatelessWidget {
  final MedicalConsultation consultation;
  MedicalConsultationCard(this.consultation);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          push(context, MedicalConsultationDetailsPage(consultation));
        },
        splashColor: getStatusColor(consultation.status).withOpacity(0.5),
        child: Row(
          children: [
            LateralBar(
              color: getStatusColor(consultation.status),
              height: 120,
            ),
            buildContent(),
          ],
        ),
      ),
    );
  }

  Expanded buildContent() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 16, top: 10, bottom: 10),
        child: Column(
          children: [
            TextLine(
              title: "Paciente",
              content: consultation.patient.name,
            ),
            TextLine(
              title: "Médico",
              content: consultation.doctor.name,
            ),
            TextLine(
              title: "Sala",
              content:
                  "${consultation.room.number} - ${consultation.room.name}",
            ),
            TextLine(
              title: "Data e hora",
              content: consultation.date,
            ),
          ],
        ),
      ),
    );
  }
}
