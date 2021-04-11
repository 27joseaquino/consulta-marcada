import 'package:consulta_marcada/core/models/doctor.dart';
import 'package:consulta_marcada/ui/components/buttons/custom_floating_button.dart';
import 'package:consulta_marcada/ui/components/cards/doctor_card.dart';
import 'package:flutter/material.dart';

class DoctorPage extends StatefulWidget {
  @override
  _DoctorPageState createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
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
  Doctor doctor2 = Doctor(
    "Dra. Júlia Quentino",
    "Feminino",
    "Cardiologista",
    "https://cdn.pixabay.com/photo/2017/03/14/03/20/nurse-2141808_960_720.jpg",
    false,
  );

  return Container(
    padding: EdgeInsets.only(top: 16, left: 10, right: 10),
    child: ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        DoctorCard(doctor: doctor1),
        DoctorCard(doctor: doctor2),
        DoctorCard(doctor: doctor1),
        DoctorCard(doctor: doctor2),
      ],
    ),
  );
}
