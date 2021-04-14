import 'package:consulta_marcada/data/data.dart';
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
  return Container(
    padding: EdgeInsets.only(top: 16, left: 10, right: 10),
    child: ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: patients.length,
      itemBuilder: (context, index) {
        return PatientCard(patients[index]);
      },
    ),
  );
}
