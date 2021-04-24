import 'package:consulta_marcada/core/models/patient.dart';
import 'package:consulta_marcada/ui/components/custom_text.dart';
import 'package:consulta_marcada/ui/components/form/custom_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PatientDetailsPage extends StatefulWidget {
  final Patient patient;
  PatientDetailsPage(this.patient);

  @override
  _PatientDetailsPageState createState() => _PatientDetailsPageState();
}

class _PatientDetailsPageState extends State<PatientDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detalhes do Paciente")),
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
              text: 'Status',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            CustomField(
              text: widget.patient.isActive == 1 ? "Ativo" : "Inativo",
            ),
            CustomText(
              text: 'CPF',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            CustomField(text: widget.patient.cpf),
            CustomText(
              text: 'Data de nascimento',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            CustomField(text: widget.patient.dateOfBirth),
            CustomText(
              text: 'Nome',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            CustomField(text: widget.patient.name),
            CustomText(
              text: 'Gênero',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            CustomField(text: widget.patient.genre),
            CustomText(
              text: 'Nacionalidade',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            CustomField(text: widget.patient.nationality),
            CustomText(
              text: 'Nome da mãe',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            CustomField(text: widget.patient.motherName),
          ],
        ),
      ),
    );
  }
}
