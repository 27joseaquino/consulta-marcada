import 'package:consulta_marcada/core/models/doctor.dart';
import 'package:consulta_marcada/ui/components/cards/text_line.dart';
import 'package:consulta_marcada/ui/styles/custom_text.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final Doctor doctor;
  DoctorCard({@required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          imageContainer(),
          buildContent(),
        ],
      ),
    );
  }

  Container imageContainer() {
    return Container(
      height: 100,
      width: double.infinity,
      child: Image.network(doctor.image, fit: BoxFit.cover),
    );
  }

  Container buildContent() {
    return Container(
      margin: EdgeInsets.only(left: 16, top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomText(
            text: doctor.name,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            textOverFlowEllipsis: true,
          ),
          TextLine(title: "Especialidade: ", content: doctor.specialty),
        ],
      ),
    );
  }
}
