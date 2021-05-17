import 'package:consulta_marcada/core/models/patient.dart';
import 'package:consulta_marcada/core/utils/navigator.dart';
import 'package:consulta_marcada/ui/components/buttons/custom_floating_button.dart';
import 'package:consulta_marcada/ui/components/cards/patient_card.dart';
import 'package:consulta_marcada/ui/components/custom_circular_progress.dart';
import 'package:consulta_marcada/ui/components/error_message_container.dart';
import 'package:consulta_marcada/ui/pages/patient/patients_register_page.dart';
import 'package:consulta_marcada/ui/providers/address_provider.dart';
import 'package:consulta_marcada/ui/providers/patient_provider.dart';
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

        return CustomCircularProgress();
      } else if (!patientProvider.isProcessing &&
          patientProvider.patients == null) {
        patientProvider.fetchPatients(addressList: addressProvider.addressList);

        return CustomCircularProgress();
      } else if (patientProvider.isProcessing) {
        return CustomCircularProgress();
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
