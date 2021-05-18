import 'package:consulta_marcada/core/models/patient.dart';
import 'package:consulta_marcada/ui/widgets/app_text.dart';
import 'package:consulta_marcada/ui/widgets/fields/app_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PatientDetailsScreen extends StatefulWidget {
  final Patient patient;
  PatientDetailsScreen(this.patient);

  @override
  _PatientDetailsScreenState createState() => _PatientDetailsScreenState();
}

class _PatientDetailsScreenState extends State<PatientDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detalhes do Paciente")),
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
              text: "Status",
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            AppField(
              text: widget.patient.isActive == 1 ? "Ativo" : "Inativo",
            ),
            AppText(
              text: "CPF",
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            AppField(text: widget.patient.cpf),
            AppText(
              text: "Data de nascimento",
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            AppField(text: widget.patient.dateOfBirth),
            AppText(
              text: "Nome",
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            AppField(text: widget.patient.name),
            AppText(
              text: "Gênero",
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            AppField(text: widget.patient.genre),
            AppText(
              text: "Nacionalidade",
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            AppField(text: widget.patient.nationality),
            AppText(
              text: "Nome da mãe",
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            AppField(text: widget.patient.motherName),
            AppText(
              text: "Endereço",
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            AppField(
              text: widget.patient.address != null
                  ? "CEP: ${widget.patient.address.cep}\n" +
                      "Logradouro: ${widget.patient.address.street}\n" +
                      "Bairro: ${widget.patient.address.district}\n" +
                      "Cidade: ${widget.patient.address.city} " +
                      "- ${widget.patient.address.uf}"
                  : "Não foi informado",
            ),
          ],
        ),
      ),
    );
  }
}
