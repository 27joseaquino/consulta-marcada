import 'package:consulta_marcada/core/models/static/status.dart';
import 'package:consulta_marcada/data/data.dart';
import 'package:consulta_marcada/ui/components/buttons/custom_floating_button.dart';
import 'package:consulta_marcada/ui/components/cards/medical_consultation_card.dart';
import 'package:consulta_marcada/ui/components/custom_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MedicalConsultationPage extends StatefulWidget {
  @override
  _MedicalConsultationPageState createState() =>
      _MedicalConsultationPageState();
}

class _MedicalConsultationPageState extends State<MedicalConsultationPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: size.height,
        width: size.width,
        child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              filter(
                height: constraints.maxHeight * .1,
                width: constraints.maxWidth,
              ),
              buildListview(
                height: constraints.maxHeight * .9,
                width: constraints.maxWidth,
              ),
            ],
          );
        }),
      ),
      floatingActionButton: CustomFloatingButton(onPressed: () {}),
    );
  }

  Container filter({double height, double width}) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      height: height,
      width: width,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: status.length,
        itemBuilder: (context, index) {
          return Visibility(
            visible: status[index] != "Realizada",
            child: CustomFilter(
              title: status[index],
              color: getStatusColor(status[index]),
              icon: getStatusIcon(status[index]),
            ),
          );
        },
      ),
    );
  }
}

Container buildListview({double height, double width}) {
  return Container(
    height: height,
    width: width,
    padding: EdgeInsets.only(top: 16),
    child: ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: consultations.length,
      itemBuilder: (context, index) {
        return MedicalConsultationCard(consultations[index]);
      },
    ),
  );
}
