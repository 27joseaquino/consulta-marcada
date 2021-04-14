import 'package:consulta_marcada/data/data.dart';
import 'package:consulta_marcada/ui/components/buttons/custom_floating_button.dart';
import 'package:consulta_marcada/ui/components/cards/medical_consultation_card.dart';
import 'package:flutter/material.dart';

class MedicalConsultationPage extends StatefulWidget {
  @override
  _MedicalConsultationPageState createState() =>
      _MedicalConsultationPageState();
}

class _MedicalConsultationPageState extends State<MedicalConsultationPage> {
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
      itemCount: consultations.length,
      itemBuilder: (context, index) {
        return MedicalConsultationCard(consultations[index]);
      },
    ),
  );
}
