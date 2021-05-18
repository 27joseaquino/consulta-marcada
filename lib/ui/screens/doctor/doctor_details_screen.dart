import 'package:consulta_marcada/core/models/doctor.dart';
import 'package:consulta_marcada/ui/widgets/app_text.dart';
import 'package:consulta_marcada/ui/widgets/fields/app_field.dart';
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
            AppText(
              text: 'Status',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            AppField(
              text: widget.doctor.isActive == 1 ? "Ativo" : "Inativo",
            ),
            AppText(
              text: 'Nome',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            AppField(text: widget.doctor.name),
            AppText(
              text: 'Gênero',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            AppField(text: widget.doctor.genre),
            AppText(
              text: 'Especialidade',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            AppField(text: widget.doctor.specialty),
          ],
        ),
      ),
    );
  }
}
