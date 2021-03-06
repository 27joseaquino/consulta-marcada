import 'package:consulta_marcada/core/models/doctor.dart';
import 'package:consulta_marcada/core/utils/navigator.dart';
import 'package:consulta_marcada/ui/screens/doctor/doctor_details_screen.dart';
import 'package:consulta_marcada/ui/widgets/cards/lateral_bar.dart';
import 'package:consulta_marcada/ui/widgets/cards/text_line.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final Doctor doctor;
  DoctorCard(this.doctor);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        splashColor: doctor.isActive == 1
            ? Colors.green.withOpacity(0.5)
            : Colors.red.withOpacity(0.5),
        onTap: () => push(context, DoctorDetailsScreen(doctor)),
        child: Row(
          children: [
            LateralBar(
              color: doctor.isActive == 1 ? Colors.green : Colors.red,
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
            TextLine(title: "Médico(a)", content: doctor.name),
            TextLine(title: "Especialidade", content: doctor.specialty),
          ],
        ),
      ),
    );
  }
}
