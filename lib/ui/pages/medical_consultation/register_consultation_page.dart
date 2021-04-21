import 'package:consulta_marcada/core/models/medical_consultation.dart';
import 'package:consulta_marcada/ui/components/buttons/cancel_button.dart';
import 'package:consulta_marcada/ui/components/buttons/custom_button.dart';
import 'package:consulta_marcada/ui/components/custom_text.dart';
import 'package:consulta_marcada/ui/components/form/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RegisterConsultation extends StatefulWidget {
  @override
  _RegisterConsultationState createState() => _RegisterConsultationState();
}

class _RegisterConsultationState extends State<RegisterConsultation> {
  final GlobalKey<FormState> _registerconsultationFormKey = GlobalKey();
  final _patient = TextEditingController();
  final _doctor = TextEditingController();
  final _date = TextEditingController();
  final _arrivialTime = TextEditingController();
  final _room = TextEditingController();

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Cadastrar Consulta")),
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
        text: "Cadastre aqui uma nova consulta.",
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
        key: _registerconsultationFormKey,
        child: Column(
          children: [
            CustomTextField(
              hintText: "Paciente",
              textInputType: TextInputType.text,
              controller: _patient,
            ),
            CustomTextField(
              hintText: "Médico",
              textInputType: TextInputType.text,
              controller: _doctor,
            ),
            CustomTextField(
              hintText: "Sala",
              textInputType: TextInputType.text,
              controller: _room,
            ),
            CustomTextField(
              hintText: "Data da consulta",
              textInputType: TextInputType.text,
              controller: _date,
            ),
            CustomTextField(
              hintText: "horário da Consulta",
              textInputType: TextInputType.text,
              controller: _arrivialTime,
            ),
          ],
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
            title: "Marcar Consulta",
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
    if (!_registerconsultationFormKey.currentState.validate()) return;

    String date = _date.text;
    String arrivalTime = _arrivialTime.text;

    MedicalConsultation medicalconsultation =
        MedicalConsultation(date, arrivalTime, "Não realizda");
    _patient.text = "";
    _doctor.text = "";
    _date.text = "";
    _arrivialTime.text = "";

    print("ID: ${medicalconsultation.id}");
    print("Data: ${medicalconsultation.date}");
    print("Horário de chegada: ${medicalconsultation.arrivalTime}");
    print("Status: ${medicalconsultation.status}");
  }
}
