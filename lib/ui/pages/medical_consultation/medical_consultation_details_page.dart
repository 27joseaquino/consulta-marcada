import 'package:consulta_marcada/core/models/medical_consultation.dart';
import 'package:consulta_marcada/ui/components/custom_text.dart';
import 'package:consulta_marcada/ui/components/form/custom_field.dart';
import 'package:flutter/material.dart';

class MedicalConsultationDetailsPage extends StatefulWidget {
  final MedicalConsultation consultation;

  MedicalConsultationDetailsPage(this.consultation);

  _MedicalConsultationDetailsPageState createState() =>
      _MedicalConsultationDetailsPageState();
}

class _MedicalConsultationDetailsPageState
    extends State<MedicalConsultationDetailsPage> {
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
            CustomText(
              text: 'Paciente',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            CustomField(text: widget.consultation.patient.name),
            CustomText(
              text: 'Medico',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            CustomField(text: widget.consultation.doctor.name),
            CustomText(
              text: 'Sala',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            CustomField(
                text:
                    "Nº ${widget.consultation.room.number} - ${widget.consultation.room.name}"),
            CustomText(
              text: 'Horário da Consulta ',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            CustomField(text: widget.consultation.date),
            CustomText(
              text: 'Horário de Chegada',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            CustomField(
              text: widget.consultation.arrivalTime ?? "Ainda não chegou",
            ),
            CustomText(
              text: 'Status',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            CustomField(text: widget.consultation.status),
          ],
        ),
      ),
    );
  }
}
