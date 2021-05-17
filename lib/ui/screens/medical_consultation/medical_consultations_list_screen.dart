import 'package:consulta_marcada/core/models/medical_consultation.dart';
import 'package:consulta_marcada/data/static/status.dart';
import 'package:consulta_marcada/core/utils/navigator.dart';
import 'package:consulta_marcada/data/static/data.dart';
import 'package:consulta_marcada/ui/screens/medical_consultation/medical_consultations_register_screen.dart';
import 'package:consulta_marcada/ui/widgets/app_filter.dart';
import 'package:consulta_marcada/ui/widgets/buttons/app_floating_button.dart';
import 'package:consulta_marcada/ui/widgets/cards/medical_consultation_card.dart';
import 'package:consulta_marcada/ui/widgets/error_message_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MedicalConsultationsListScreen extends StatefulWidget {
  @override
  _MedicalConsultationsListScreenState createState() =>
      _MedicalConsultationsListScreenState();
}

class _MedicalConsultationsListScreenState
    extends State<MedicalConsultationsListScreen> {
  List<String> _status = [];
  List<MedicalConsultation> list = [];

  @override
  void initState() {
    super.initState();
    list = consultations;
  }

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
              filterContainer(
                height: constraints.maxHeight > 360
                    ? constraints.maxHeight * .1
                    : constraints.maxHeight * .25,
                width: constraints.maxWidth,
              ),
              buildListview(
                height: constraints.maxHeight > 360
                    ? constraints.maxHeight * .9
                    : constraints.maxHeight * .75,
                width: constraints.maxWidth,
              ),
            ],
          );
        }),
      ),
      floatingActionButton: AppFloatingButton(
        onPressed: () => push(context, MedicalConsultationsRegisterScreen()),
      ),
    );
  }

  Container filterContainer({double height, double width}) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      height: height,
      width: width >= 620 ? width * .55 : width,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: status.length,
        itemBuilder: (context, index) {
          return Visibility(
            visible: status[index] != "Realizada",
            child: AppFilter(
              title: status[index],
              color: getStatusColor(status[index]),
              icon: getStatusIcon(status[index]),
              addStatus: _addStatus,
              removeStatus: _removeStatus,
            ),
          );
        },
      ),
    );
  }

  Container buildListview({double height, double width}) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.only(top: 16),
      child: Visibility(
        visible: list.isNotEmpty,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return MedicalConsultationCard(list[index]);
          },
        ),
        replacement: ErrorMessageContainer(
          icon: Icons.error,
          text: "Não há nenhuma consulta marcada",
        ),
      ),
    );
  }

  void _addStatus(String status) {
    setState(() {
      _status.add(status);

      print(_status);

      if (_status.isNotEmpty) {
        list = consultations.where((consultation) {
          return _status.contains(consultation.status);
        }).toList();
      } else {
        list = consultations;
      }
    });
  }

  void _removeStatus(String status) {
    setState(() {
      _status.remove(status);

      if (_status.isNotEmpty) {
        list = consultations.where((consultation) {
          return _status.contains(consultation.status);
        }).toList();
      } else {
        list = consultations;
      }
    });
  }
}
