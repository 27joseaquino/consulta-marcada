import 'package:consulta_marcada/core/models/patient.dart';
import 'package:consulta_marcada/ui/components/buttons/cancel_button.dart';
import 'package:consulta_marcada/ui/components/buttons/custom_button.dart';
import 'package:consulta_marcada/ui/components/form/custom_text_field.dart';
import 'package:consulta_marcada/ui/components/custom_text.dart';
import 'package:flutter/material.dart';

class PatientsRegisterPage extends StatefulWidget {
  @override
  _PatientsRegisterPageState createState() => _PatientsRegisterPageState();
}

class _PatientsRegisterPageState extends State<PatientsRegisterPage> {
  final GlobalKey<FormState> _registerPatientFormKey = GlobalKey();
  final _cpf = TextEditingController();
  final _name = TextEditingController();
  final _dateOfBirth = TextEditingController();
  final _genre = TextEditingController();
  final _nationality = TextEditingController();
  final _motherName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Cadastrar Paciente")),
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

  Column verticalScreen(BoxConstraints constraints) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: constraints.maxHeight >= 560,
          child: textContainer(
            height: constraints.maxHeight * .1,
            width: constraints.maxWidth,
          ),
          replacement: SizedBox(),
        ),
        registerPatientForm(
          height: constraints.maxHeight < 560
              ? constraints.maxHeight * .95
              : constraints.maxHeight * .75,
          width: constraints.maxWidth,
        ),
        Visibility(
          visible: constraints.maxHeight >= 560,
          child: buttons(
            height: constraints.maxHeight * .15,
            width: constraints.maxWidth,
          ),
          replacement: SizedBox(),
        ),
      ],
    );
  }

  Column horizontalScreen(BoxConstraints constraints) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        registerPatientForm(
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

  Container textContainer({double height, double width}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      height: height,
      width: width,
      child: CustomText(
        text: "Cadastre aqui um novo paciente.",
        fontSize: 17.5,
        maxlines: 2,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Container registerPatientForm({double height, double width}) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: _registerPatientFormKey,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              CustomTextField(
                hintText: "CPF",
                controller: _cpf,
                maxLength: 20,
              ),
              CustomTextField(
                hintText: "Nome",
                controller: _name,
                maxLength: 50,
              ),
              CustomTextField(
                hintText: "Data de nascimento",
                controller: _dateOfBirth,
                maxLength: 10,
              ),
              CustomTextField(
                hintText: "Gênero",
                controller: _genre,
                maxLength: 100,
              ),
              CustomTextField(
                hintText: "Nacionalidade",
                controller: _nationality,
                maxLength: 100,
              ),
              CustomTextField(
                hintText: "Nome da mãe",
                controller: _motherName,
                maxLength: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buttons({double height, double width}) {
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
            title: "Cadastrar",
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
    if (!_registerPatientFormKey.currentState.validate()) return;

    String cpf = _cpf.text;
    String name = _name.text;
    String dateOfBirth = _dateOfBirth.text;
    String genre = _genre.text;
    String nationality = _nationality.text;
    String motherName = _motherName.text;

    Patient patient = Patient(
      cpf,
      name,
      dateOfBirth,
      genre,
      nationality,
      motherName,
      true,
    );

    _cpf.text = "";
    _name.text = "";
    _dateOfBirth.text = "";
    _genre.text = "";
    _nationality.text = "";
    _motherName.text = "";

    print("CPF: ${patient.cpf}");
    print("Nome: ${patient.name}");
    print("Data de nascimento : ${patient.dateOfBirth}");
    print("Gênero: ${patient.genre}");
    print("Nacionalidade: ${patient.nationality}");
    print("Nome da mãe: ${patient.motherName}");
    print("Status: ${patient.isActive}");
  }
}
