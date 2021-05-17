import 'package:consulta_marcada/core/models/doctor.dart';
import 'package:consulta_marcada/ui/components/form/custom_field.dart';
import 'package:consulta_marcada/ui/components/custom_text.dart';
import 'package:flutter/material.dart';

class DoctorDetailsScreen extends StatefulWidget {
  final Doctor doctor;
  DoctorDetailsScreen(this.doctor);

  @override
  _DoctorDetailsScreenState createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detalhes do Médico(a)")),
      body: buildBody(),
    );
  }

  Container buildBody() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomText(
              text: 'Status',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            CustomField(
              text: widget.doctor.isActive == 1 ? "Ativo" : "Inativo",
            ),
            CustomText(
              text: 'Nome',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            CustomField(text: widget.doctor.name),
            CustomText(
              text: 'Gênero',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            CustomField(text: widget.doctor.genre),
            CustomText(
              text: 'Especialidade',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            CustomField(text: widget.doctor.specialty),
          ],
        ),
      ),
    );
  }
}
