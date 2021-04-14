import 'package:consulta_marcada/core/models/doctor.dart';
import 'package:consulta_marcada/core/models/medical_consultation.dart';
import 'package:consulta_marcada/core/models/patient.dart';
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
  Doctor doctor1 = Doctor(
    "Dra. Renata Oliveira",
    "Feminino",
    "Cirurgiã",
    "https://cdn.pixabay.com/photo/2017/03/14/03/20/nurse-2141808_960_720.jpg",
    true,
  );

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
  MedicalConsultation consultation1 = MedicalConsultation(
    patient1,
    doctor1,
    "11/05/2021",
    "15:30",
    "Em Andamento",
  );

  return Container(
    padding: EdgeInsets.only(top: 16, left: 10, right: 10),
    child: ListView(
      children: <Widget>[
        MedicalConsultationCard(
          consultation: consultation1,
        ),
        MedicalConsultationCard(
          consultation: consultation1,
        ),
        MedicalConsultationCard(
          consultation: consultation1,
        ),
        MedicalConsultationCard(
          consultation: consultation1,
        ),
        MedicalConsultationCard(
          consultation: consultation1,
        ),
      ],
    ),
  );
}
