import 'package:consulta_marcada/core/models/patient.dart';
import 'package:consulta_marcada/core/utils/navigator.dart';
import 'package:consulta_marcada/ui/bloc/patient_bloc.dart';
import 'package:consulta_marcada/ui/components/buttons/custom_floating_button.dart';
import 'package:consulta_marcada/ui/components/cards/patient_card.dart';
import 'package:consulta_marcada/ui/components/custom_circular_progress.dart';
import 'package:consulta_marcada/ui/components/error_message_container.dart';
import 'package:consulta_marcada/ui/pages/patient/patients_register_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatientsListPage extends StatefulWidget {
  @override
  _PatientsListPageState createState() => _PatientsListPageState();
}

class _PatientsListPageState extends State<PatientsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      floatingActionButton: CustomFloatingButton(
        onPressed: () {
          push(context, PatientsRegisterPage());
        },
      ),
    );
  }
}

Consumer<PatientBloc> buildBody() {
  return Consumer<PatientBloc>(
    builder: (context, patientBloc, child) {
      if (patientBloc.error != null) {
        return ErrorMessageContainer(
          icon: Icons.error,
          text: "Ocorreu um erro ao tentar\nrecuperar a lista de pacientes",
        );
      }

      if (!patientBloc.isProcessing && patientBloc.patients == null) {
        patientBloc.fetchPatients();

        return CustomCircularProgress();
      } else if (patientBloc.isProcessing) {
        return CustomCircularProgress();
      }

      return Visibility(
        visible: patientBloc.patients.isNotEmpty,
        child: buildListView(patientBloc.patients),
        replacement: ErrorMessageContainer(
          text: 'Nenhum paciente cadastrado',
          icon: Icons.cancel,
        ),
      );
    },
  );
}

Container buildListView(List<Patient> patients) {
  return Container(
    padding: EdgeInsets.only(top: 16, left: 10, right: 10),
    child: ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: patients.length,
      itemBuilder: (context, index) {
        return PatientCard(patients[index]);
      },
    ),
  );
}
