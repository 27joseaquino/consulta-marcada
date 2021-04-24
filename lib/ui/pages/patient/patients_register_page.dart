import 'package:consulta_marcada/core/models/patient.dart';
import 'package:consulta_marcada/core/utils/navigator.dart';
import 'package:consulta_marcada/ui/bloc/patient_bloc.dart';
import 'package:consulta_marcada/ui/components/buttons/cancel_button.dart';
import 'package:consulta_marcada/ui/components/buttons/progress_button.dart';
import 'package:consulta_marcada/ui/components/custom_alert.dart';
import 'package:consulta_marcada/ui/components/form/custom_text_field.dart';
import 'package:consulta_marcada/ui/components/custom_text.dart';
import 'package:consulta_marcada/ui/pages/home/home_page.dart';
import 'package:consulta_marcada/ui/styles/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                maxLength: 11,
              ),
              CustomTextField(
                hintText: "Nome",
                controller: _name,
                maxLength: 100,
              ),
              CustomTextField(
                hintText: "Data de nascimento",
                controller: _dateOfBirth,
                maxLength: 10,
              ),
              CustomTextField(
                hintText: "Gênero",
                controller: _genre,
                maxLength: 10,
              ),
              CustomTextField(
                hintText: "Nacionalidade",
                controller: _nationality,
                maxLength: 20,
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
          patientRegisterButton(width: width * .4),
        ],
      ),
    );
  }

  Consumer<PatientBloc> patientRegisterButton({double width}) {
    return Consumer<PatientBloc>(
      builder: (context, patientBloc, child) {
        if (patientBloc.error != null) {
          String errorMessage = patientBloc.error;
          patientBloc.clearError();

          Future.delayed(Duration.zero, () {
            CustomAlert.alert(
              context: context,
              title: "Erro ao cadastrar o paciente",
              message: errorMessage,
            );
          });
        }

        return ProgressButton(
          height: 50,
          width: width,
          content: CustomText(
            text: "Cadastrar",
            fontSize: 18,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
            color: Colors.white,
          ),
          color: MyColors.appColors["blue"],
          function: _onClickAddPatient,
          showProgress: patientBloc.isProcessing,
        );
      },
    );
  }

  _onClickAddPatient() async {
    if (!_registerPatientFormKey.currentState.validate()) return;

    PatientBloc patientBloc = Provider.of<PatientBloc>(context, listen: false);

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
      1,
    );

    bool success = await patientBloc.addPatient(patient: patient);

    if (success) {
      CustomAlert.alert(
        context: context,
        title: "Sucesso!",
        message: "O cadastro do paciente foi realizado com sucesso!",
        function: () {
          _cpf.text = "";
          _name.text = "";
          _dateOfBirth.text = "";
          _genre.text = "";
          _nationality.text = "";
          _motherName.text = "";

          push(context, HomePage(selectedIndex: 2), replace: true);
        },
      );
    }
  }
}
