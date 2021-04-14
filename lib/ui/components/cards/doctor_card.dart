import 'package:consulta_marcada/core/models/doctor.dart';
import 'package:consulta_marcada/ui/components/cards/image_container.dart';
import 'package:consulta_marcada/ui/components/cards/text_line.dart';
import 'package:consulta_marcada/ui/styles/custom_text.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final Doctor doctor;
  DoctorCard(this.doctor);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ImageContainer(url: doctor.image),
          buildContent(),
        ],
      ),
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
          TextLine(title: "Especialidade", content: doctor.specialty),
        ],
      ),
    );
  }
}
