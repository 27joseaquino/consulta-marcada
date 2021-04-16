import 'package:consulta_marcada/core/utils/navigator.dart';
import 'package:consulta_marcada/ui/components/buttons/custom_button.dart';
import 'package:consulta_marcada/ui/components/form/custom_text_field.dart';
import 'package:consulta_marcada/ui/components/logo_consulta_marcada.dart';
import 'package:consulta_marcada/ui/pages/home/home_page.dart';
import 'package:consulta_marcada/ui/pages/user/login_page.dart';
import 'package:consulta_marcada/ui/styles/custom_text.dart';
import 'package:flutter/material.dart';

class RegisterDoctor extends StatefulWidget {
  @override
  _RegisterDoctorState createState() => _RegisterDoctorState();
}

class _RegisterDoctorState extends State<RegisterDoctor> {
  final GlobalKey<FormState> _registerDoctorFormKey = GlobalKey();
  final _name = TextEditingController();
  final _specialty = TextEditingController();
  final _genre = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        height: size.height,
        width: size.width,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                textContainer(
                  height: constraints.maxHeight > 404
                      ? constraints.maxHeight * .3
                      : constraints.maxHeight * .4,
                  width: constraints.maxWidth,
                ),
                registrationDoctorForm(
                  height: constraints.maxHeight > 404
                      ? constraints.maxHeight * .7
                      : constraints.maxHeight * .6,
                  width: constraints.maxWidth,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Container textContainer({double height, double width}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      height: height,
      width: width,
      child: CustomText(
        text: "Cadastre aqui um novo médico.",
        fontSize: 18,
        maxlines: 2,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Container registrationDoctorForm({double height, double width}) {
    return Container(
      padding: EdgeInsets.only(top: height * .05),
      height: height,
      width: width,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Form(
              key: _registerDoctorFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                    hintText: "Nome",
                    controller: _name,
                    maxLength: 40,
                  ),
                  CustomTextField(
                    hintText: "Gênero",
                    controller: _genre,
                    maxLength: 20,
                  ),
                  CustomTextField(
                    hintText: "Especialidade",
                    controller: _specialty,
                    maxLength: 40,
                  ),
                ],
              ),
            ),
            CustomButton(
              title: "Cadastrar Médico",
              height: 50,
              width: width,
              onPressed: _onClickRegisterDoctor,
            ),
          ],
        ),
      ),
    );
  }

  _onClickRegisterDoctor() {
    if (!_registerDoctorFormKey.currentState.validate()) return;

    String name = _name.text;
    String specialty = _specialty.text;
    String genre = _genre.text;

    Doctor doctor = Doctor(name, genre, specialty, true);

    print("Nome: ${doctor.name}")
    print("Especialidade: ${doctor.specialty}");
    print("Gênero: ${doctor.genre}");
  }
}
