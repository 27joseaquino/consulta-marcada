import 'package:consulta_marcada/core/utils/navigator.dart';
import 'package:consulta_marcada/data/data.dart';
import 'package:consulta_marcada/ui/components/buttons/custom_floating_button.dart';
import 'package:consulta_marcada/ui/components/cards/patient_card.dart';
import 'package:consulta_marcada/ui/pages/patient/patients_register_page.dart';
import 'package:flutter/material.dart';

class PatientsListPage extends StatefulWidget {
  @override
  _PatientsListPageState createState() => _PatientsListPageState();
}

class _PatientsListPageState extends State<PatientsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildListview(),
      floatingActionButton: CustomFloatingButton(
        onPressed: () {
          push(context, PatientsRegisterPage());
        },
      ),
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
