import 'package:consulta_marcada/core/models/patient.dart';
import 'package:consulta_marcada/core/utils/navigator.dart';
import 'package:consulta_marcada/ui/components/cards/lateral_bar.dart';
import 'package:consulta_marcada/ui/components/cards/text_line.dart';
import 'package:consulta_marcada/ui/screens/patient/patient_details_screen.dart';
import 'package:flutter/material.dart';

class PatientCard extends StatelessWidget {
  final Patient patient;
  PatientCard(this.patient);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        splashColor: patient.isActive == 1
            ? Colors.green.withOpacity(0.5)
            : Colors.red.withOpacity(0.5),
        onTap: () => push(context, PatientDetailsScreen(patient)),
        child: Row(
          children: [
            LateralBar(
              color: patient.isActive == 1 ? Colors.green : Colors.red,
              height: 110,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextLine(title: "Nome", content: patient.name),
            TextLine(title: "CPF", content: patient.cpf),
            TextLine(title: "Gênero", content: patient.genre),
          ],
        ),
      ),
    );
  }
}
