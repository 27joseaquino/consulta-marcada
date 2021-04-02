import 'package:consulta_marcada/ui/components/form/text_line.dart';
import 'package:consulta_marcada/ui/styles/custom_text.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          imageContainer(),
          buildContent(),
        ],
      ),
    );
  }

  Container imageContainer() {
    return Container(
      height: 100,
      width: double.infinity,
      child: Image.network(
        "https://images.pexels.com/photos/4173239/pexels-photo-4173239.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        fit: BoxFit.cover,
      ),
    );
  }

  Container buildContent() {
    return Container(
      margin: EdgeInsets.only(left: 16, top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomText(
            text: "Nome do Médico",
            fontSize: 18,
            fontWeight: FontWeight.bold,
            textOverFlowEllipsis: true,
          ),
          TextLine(title: "Especialidade: ", content: "Clínico Geral"),
          TextLine(title: "Gênero: ", content: "Masculino"),
          TextLine(title: "Status: ", content: "Ativo", color: Colors.green),
        ],
      ),
    );
  }
}
