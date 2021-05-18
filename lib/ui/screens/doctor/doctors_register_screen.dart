import 'package:consulta_marcada/core/models/doctor.dart';
import 'package:consulta_marcada/ui/widgets/app_text.dart';
import 'package:consulta_marcada/ui/widgets/buttons/app_button.dart';
import 'package:consulta_marcada/ui/widgets/buttons/cancel_button.dart';
import 'package:consulta_marcada/ui/widgets/fields/app_text_field.dart';
import 'package:flutter/material.dart';

class DoctorsRegisterScreen extends StatefulWidget {
  @override
  _DoctorsRegisterScreenState createState() => _DoctorsRegisterScreenState();
}

class _DoctorsRegisterScreenState extends State<DoctorsRegisterScreen> {
  final GlobalKey<FormState> _registerDoctorFormKey = GlobalKey();
  final _name = TextEditingController();
  final _specialty = TextEditingController();
  final _genre = TextEditingController();
  final _crm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar Médico(a)", style: TextStyle(fontSize: 23)),
      ),
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
            height: constraints.maxHeight * .15,
            width: constraints.maxWidth,
          ),
          replacement: SizedBox(),
        ),
        registerDoctorForm(
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

  Column horizontalScreen(BoxConstraints constraints) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        registerDoctorForm(
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
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      height: height,
      width: width,
      child: AppText(
        text: "Cadastre aqui um novo médico(a).",
        fontSize: 18,
        maxlines: 2,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Container registerDoctorForm({double height, double width}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      height: height,
      width: width,
      child: Form(
        key: _registerDoctorFormKey,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              AppTextField(
                hintText: "CRM",
                controller: _crm,
                maxLength: 100,
                textInputType: TextInputType.number,
              ),
              AppTextField(
                hintText: "Nome",
                controller: _name,
                maxLength: 100,
              ),
              AppTextField(
                hintText: "Gênero",
                controller: _genre,
                maxLength: 10,
              ),
              AppTextField(
                hintText: "Especialidade",
                controller: _specialty,
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
          AppButton(
            title: "Cadastrar",
            height: 50,
            fontSize: 20,
            width: width * .4,
            onPressed: _onClickRegisterDoctor,
          )
        ],
      ),
    );
  }

  _onClickRegisterDoctor() {
    if (!_registerDoctorFormKey.currentState.validate()) return;

    int crm = int.parse(_crm.text);
    String name = _name.text;
    String specialty = _specialty.text;
    String genre = _genre.text;

    Doctor doctor = Doctor(crm, name, genre, specialty, 1);

    _name.text = "";
    _specialty.text = "";
    _genre.text = "";

    print("Nome: ${doctor.name}");
    print("Especialidade: ${doctor.specialty}");
    print("Gênero: ${doctor.genre}");
    print("Status: ${doctor.isActive}");
  }
}
