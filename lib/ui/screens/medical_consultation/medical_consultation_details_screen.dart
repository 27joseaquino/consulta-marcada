import 'package:consulta_marcada/core/models/medical_consultation.dart';
import 'package:consulta_marcada/ui/widgets/app_text.dart';
import 'package:consulta_marcada/ui/widgets/fields/app_field.dart';
import 'package:flutter/material.dart';

class MedicalConsultationDetailsScreen extends StatefulWidget {
  final MedicalConsultation consultation;

  MedicalConsultationDetailsScreen(this.consultation);

  _MedicalConsultationDetailsScreenState createState() =>
      _MedicalConsultationDetailsScreenState();
}

class _MedicalConsultationDetailsScreenState
    extends State<MedicalConsultationDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes da Consulta", style: TextStyle(fontSize: 23)),
      ),
      body: buildBody(),
    );
  }

  Container buildBody() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppText(
              text: 'Paciente',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            AppField(text: widget.consultation.patient.name),
            AppText(
              text: 'Medico',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            AppField(text: widget.consultation.doctor.name),
            AppText(
              text: 'Sala',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            AppField(
                text:
                    "Nº ${widget.consultation.room.number} - ${widget.consultation.room.name}"),
            AppText(
              text: 'Horário da Consulta ',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            AppField(text: widget.consultation.date),
            AppText(
              text: 'Horário de Chegada',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            AppField(
              text: widget.consultation.arrivalTime ?? "Ainda não chegou",
            ),
            AppText(
              text: 'Status',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            AppField(text: widget.consultation.status),
          ],
        ),
      ),
    );
  }
}
