import 'package:consulta_marcada/core/models/patient.dart';
import 'package:consulta_marcada/core/utils/navigator.dart';
import 'package:consulta_marcada/ui/providers/address_provider.dart';
import 'package:consulta_marcada/ui/providers/patient_provider.dart';
import 'package:consulta_marcada/ui/screens/patient/patients_register_screen.dart';
import 'package:consulta_marcada/ui/widgets/app_circular_progress.dart';
import 'package:consulta_marcada/ui/widgets/buttons/app_floating_button.dart';
import 'package:consulta_marcada/ui/widgets/cards/patient_card.dart';
import 'package:consulta_marcada/ui/widgets/error_message_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatientsListScreen extends StatefulWidget {
  @override
  _PatientsListScreenState createState() => _PatientsListScreenState();
}

class _PatientsListScreenState extends State<PatientsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      floatingActionButton: AppFloatingButton(
        onPressed: () {
          push(context, PatientsRegisterScreen());
        },
      ),
    );
  }
}

Consumer2<PatientProvider, AddressProvider> buildBody() {
  return Consumer2<PatientProvider, AddressProvider>(
    builder: (context, patientProvider, addressProvider, child) {
      if (patientProvider.error != null) {
        return ErrorMessageContainer(
          icon: Icons.error,
          text: "Ocorreu um erro ao tentar\nrecuperar a lista de pacientes",
        );
      }

      if (!addressProvider.isProcessing &&
          addressProvider.addressList == null) {
        addressProvider.fetchAddressList();

        return AppCircularProgress();
      } else if (!patientProvider.isProcessing &&
          patientProvider.patients == null) {
        patientProvider.fetchPatients(addressList: addressProvider.addressList);

        return AppCircularProgress();
      } else if (patientProvider.isProcessing) {
        return AppCircularProgress();
      }

      return Visibility(
        visible: patientProvider.patients.isNotEmpty,
        child: buildListView(patientProvider.patients),
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
