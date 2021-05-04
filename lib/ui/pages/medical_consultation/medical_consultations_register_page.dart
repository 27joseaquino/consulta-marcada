import 'package:consulta_marcada/core/models/doctor.dart';
import 'package:consulta_marcada/core/models/medical_consultation.dart';
import 'package:consulta_marcada/core/models/patient.dart';
import 'package:consulta_marcada/core/models/room.dart';
import 'package:consulta_marcada/data/static/data.dart';
import 'package:consulta_marcada/ui/components/buttons/cancel_button.dart';
import 'package:consulta_marcada/ui/components/buttons/custom_button.dart';
import 'package:consulta_marcada/ui/components/custom_alert.dart';
import 'package:consulta_marcada/ui/components/custom_text.dart';
import 'package:consulta_marcada/ui/components/form/custom_dropdown.dart';
import 'package:consulta_marcada/ui/components/form/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MedicalConsultationsRegisterPage extends StatefulWidget {
  @override
  _MedicalConsultationsRegisterPageState createState() =>
      _MedicalConsultationsRegisterPageState();
}

class _MedicalConsultationsRegisterPageState
    extends State<MedicalConsultationsRegisterPage> {
  final GlobalKey<FormState> _medicalConsultationRegisterFormKey = GlobalKey();
  final _date = TextEditingController();
  Patient _patient;
  Doctor _doctor;
  Room _room;

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Marcar Consulta")),
      body: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: LayoutBuilder(builder: (context, constraints) {
          return Visibility(
            visible: constraints.maxWidth <= 380,
            child: verticalScreen(constraints),
            replacement: horizontalScreen(constraints),
          );
        }),
      ),
    );
  }

  verticalScreen(BoxConstraints constraints) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: constraints.maxHeight >= 560,
          child: textContainer(
            height: constraints.maxHeight * .15,
            width: constraints.maxWidth,
          ),
          replacement: SizedBox(),
        ),
        registerConsultationForm(
          height: constraints.maxHeight < 560
              ? constraints.maxHeight * .95
              : constraints.maxHeight * .6,
          width: constraints.maxWidth,
        ),
        Visibility(
          visible: constraints.maxHeight >= 560,
          child: buttons(
            height: constraints.maxHeight * .25,
            width: constraints.maxWidth,
          ),
          replacement: SizedBox(),
        ),
      ],
    );
  }

  horizontalScreen(BoxConstraints constraints) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        registerConsultationForm(
          height: constraints.maxHeight >= 280
              ? constraints.maxHeight * .8
              : constraints.maxHeight * .9,
          width: constraints.maxWidth,
        ),
        Visibility(
          visible: constraints.maxHeight >= 280,
          child: buttons(
            height: constraints.maxHeight * .2,
            width: constraints.maxWidth,
          ),
          replacement: SizedBox(),
        ),
      ],
    );
  }

  textContainer({double height, double width}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      height: height,
      width: width,
      child: CustomText(
        text: "Marque aqui uma nova consulta.",
        fontSize: 18,
        maxlines: 2,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Container registerConsultationForm({double height, double width}) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: _medicalConsultationRegisterFormKey,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              CustomDropdown(
                hint: "Paciente",
                items: patients,
                callback: _selectPatient,
              ),
              CustomDropdown(
                hint: "Médico(a)",
                items: doctors,
                callback: _selectDoctor,
              ),
              CustomDropdown(
                hint: "Sala",
                items: rooms,
                callback: _selectRoom,
              ),
              CustomTextField(
                hintText: "Data da consulta",
                textInputType: TextInputType.text,
                controller: _date,
              ),
            ],
          ),
        ),
      ),
    );
  }

  buttons({double height, double width}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: height,
      width: width,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CancelButton(width: width * .4),
          CustomButton(
            title: "Marcar",
            height: 50,
            fontSize: 20,
            width: width * .4,
            onPressed: _onClickRegister,
          )
        ],
      ),
    );
  }

  _onClickRegister() {
    if (!_medicalConsultationRegisterFormKey.currentState.validate()) return;

    if (_patient == null || _doctor == null || _room == null) {
      CustomAlert.alert(
        context: context,
        title: "Campos vazios",
        message: "Você precisa preencher todos os campos!",
      );
    } else {
      String date = _date.text;
      _date.text = "";

      MedicalConsultation consultation = MedicalConsultation(
        _patient,
        _doctor,
        _room,
        date,
        "Não realizada",
      );

      print("Paciente: ${consultation.patient}");
      print("Médico: ${consultation.doctor}");
      print("Sala: ${consultation.room}");
      print("Data: ${consultation.date}");
      print("Status: ${consultation.status}");
    }
  }

  void _selectPatient(Patient patient) => _patient = patient;
  void _selectDoctor(Doctor doctor) => _doctor = doctor;
  void _selectRoom(Room room) => _room = room;
}
