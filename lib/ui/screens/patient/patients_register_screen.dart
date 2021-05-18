import 'package:consulta_marcada/core/models/patient.dart';
import 'package:consulta_marcada/core/utils/navigator.dart';
import 'package:consulta_marcada/ui/providers/address_provider.dart';
import 'package:consulta_marcada/ui/providers/patient_provider.dart';
import 'package:consulta_marcada/ui/screens/home/home_screen.dart';
import 'package:consulta_marcada/ui/styles/app_colors.dart';
import 'package:consulta_marcada/ui/widgets/app_alert.dart';
import 'package:consulta_marcada/ui/widgets/app_text.dart';
import 'package:consulta_marcada/ui/widgets/buttons/cancel_button.dart';
import 'package:consulta_marcada/ui/widgets/buttons/progress_button.dart';
import 'package:consulta_marcada/ui/widgets/fields/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatientsRegisterScreen extends StatefulWidget {
  @override
  _PatientsRegisterScreenState createState() => _PatientsRegisterScreenState();
}

class _PatientsRegisterScreenState extends State<PatientsRegisterScreen> {
  final GlobalKey<FormState> _registerPatientFormKey = GlobalKey();
  final _cpf = TextEditingController();
  final _name = TextEditingController();
  final _dateOfBirth = TextEditingController();
  final _genre = TextEditingController();
  final _nationality = TextEditingController();
  final _motherName = TextEditingController();
  final _cep = TextEditingController();

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
      child: AppText(
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
              AppTextField(
                hintText: "CPF",
                controller: _cpf,
                maxLength: 11,
              ),
              AppTextField(
                hintText: "Nome",
                controller: _name,
                maxLength: 100,
              ),
              AppTextField(
                hintText: "Data de nascimento",
                controller: _dateOfBirth,
                maxLength: 10,
              ),
              AppTextField(
                hintText: "Gênero",
                controller: _genre,
                maxLength: 10,
              ),
              AppTextField(
                hintText: "Nacionalidade",
                controller: _nationality,
                maxLength: 20,
              ),
              AppTextField(
                hintText: "Nome da mãe",
                controller: _motherName,
                maxLength: 100,
              ),
              AppTextField(
                hintText: "CEP",
                controller: _cep,
                textInputType: TextInputType.number,
                maxLength: 50,
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

  Consumer2<PatientProvider, AddressProvider> patientRegisterButton(
      {double width}) {
    return Consumer2<PatientProvider, AddressProvider>(
      builder: (context, patientProvider, addressProvider, child) {
        if (patientProvider.error != null) {
          String errorMessage = patientProvider.error;
          patientProvider.clearError();

          Future.delayed(Duration.zero, () {
            AppAlert.alert(
              context: context,
              title: "Erro ao cadastrar o paciente",
              message: errorMessage,
            );
          });
        } else if (addressProvider.error != null) {
          String errorMessage = addressProvider.error;
          addressProvider.clearError();

          Future.delayed(Duration.zero, () {
            AppAlert.alert(
              context: context,
              title: "Erro ao cadastrar o paciente",
              message: errorMessage,
            );
          });
        }

        return ProgressButton(
          height: 50,
          width: width,
          content: AppText(
            text: "Cadastrar",
            fontSize: 18,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
            color: Colors.white,
          ),
          color: AppColors.blue,
          function: _onClickAddPatient,
          showProgress: !patientProvider.isProcessing
              ? addressProvider.isProcessing
              : patientProvider.isProcessing,
        );
      },
    );
  }

  _onClickAddPatient() async {
    if (!_registerPatientFormKey.currentState.validate()) return;

    PatientProvider patientProvider =
        Provider.of<PatientProvider>(context, listen: false);

    AddressProvider addressProvider =
        Provider.of<AddressProvider>(context, listen: false);

    String cpf = _cpf.text;
    String name = _name.text;
    String dateOfBirth = _dateOfBirth.text;
    String genre = _genre.text;
    String nationality = _nationality.text;
    String motherName = _motherName.text;
    int cep = int.parse(_cep.text);

    bool hasAddress =
        await addressProvider.addAddress(patientCPF: cpf, cep: cep);

    if (hasAddress) {
      Patient patient = Patient(
        cpf,
        name,
        dateOfBirth,
        genre,
        nationality,
        motherName,
        1,
      );

      bool success = await patientProvider.addPatient(patient: patient);

      if (success) {
        AppAlert.alert(
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

            push(context, HomeScreen(selectedIndex: 2), replace: true);
          },
        );
      }
    }
  }
}
