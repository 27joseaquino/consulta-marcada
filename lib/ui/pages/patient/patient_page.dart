import 'package:consulta_marcada/core/models/patient.dart';
import 'package:consulta_marcada/ui/components/buttons/custom_floating_button.dart';
import 'package:consulta_marcada/ui/components/cards/patient_card.dart';
import 'package:flutter/material.dart';

class PatientPage extends StatefulWidget {
  @override
  _PatientPageState createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildListview(),
      floatingActionButton: CustomFloatingButton(onPressed: () {}),
    );
  }
}

Container buildListview() {
  Patient patient1 = Patient(
    "123.456.789-00",
    "José Ronaldo de Oliveira",
    "13/03/2000",
    "Masculino",
    "Brasileiro",
    "Maria de Oliveira",
    "https://images.pexels.com/photos/6822288/pexels-photo-6822288.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    true,
  );

  Patient patient2 = Patient(
    "143.456.789-00",
    "João da Silva Santos",
    "13/03/2000",
    "Masculino",
    "Brasileiro",
    "Maria dos Santos",
    "https://images.pexels.com/photos/6822288/pexels-photo-6822288.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    false,
  );

  return Container(
    padding: EdgeInsets.only(top: 16, left: 10, right: 10),
    child: ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        PatientCard(patient: patient1),
        PatientCard(patient: patient2),
        PatientCard(patient: patient1),
        PatientCard(patient: patient2),
      ],
    ),
  );
}
