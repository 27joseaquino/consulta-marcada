import 'package:consulta_marcada/core/models/medical_consultation.dart';
import 'package:consulta_marcada/ui/components/custom_text.dart';
import 'package:consulta_marcada/ui/components/form/custom_field.dart';
import 'package:flutter/material.dart';

class MedicalConsultationDetails extends StatefulWidget {
  final MedicalConsultation consultation;
  MedicalConsultationDetails(this.consultation);
  _MedicalConsultationDetailsState createState() =>
      _MedicalConsultationDetailsState();
}

class _MedicalConsultationDetailsState
    extends State<MedicalConsultationDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detalhes da Consulta")),
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
            CustomField(text: "${widget.consultation.room.type} - Nº ${widget.consultation.room.number}"),
            CustomText(
              text: 'Data da Consulta ',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            CustomField(text: widget.consultation.date),
            CustomText(
              text: 'Horário da Consulta',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            CustomField(text: widget.consultation.arrivalTime),
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
