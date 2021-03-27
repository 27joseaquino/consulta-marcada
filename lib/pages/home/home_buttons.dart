import 'package:consulta_marcada/components/quick_access_button.dart';
import 'package:consulta_marcada/styles/custom_text.dart';
import 'package:flutter/material.dart';

class HomeButtons extends StatefulWidget {
  @override
  _HomeButtonsState createState() => _HomeButtonsState();
}

class _HomeButtonsState extends State<HomeButtons> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 14, left: 5),
                child: CustomText(
                  text: "Acesso Rápido",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                ),
              ),
              quickAccess(
                height: size.height > 412
                    ? constraints.maxHeight * .5
                    : constraints.maxHeight * .75,
                width: constraints.maxWidth,
              ),
            ],
          );
        },
      ),
    );
  }

  Container quickAccess({double height, double width}) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      height: height,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              QuickAccessButton(
                title: "Marcar Consulta",
                icon: Icons.support_agent,
                function: () {},
                width: width * .5,
                height: height * .5,
              ),
              QuickAccessButton(
                title: "Cadastrar Paciente",
                icon: Icons.person_add,
                function: () {},
                width: width * .5,
                height: height * .5,
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              QuickAccessButton(
                title: "Cadastrar Médico",
                icon: Icons.medical_services,
                function: () {},
                width: width * .5,
                height: height * .5,
              ),
              QuickAccessButton(
                title: "Enviar Sugestões",
                icon: Icons.lightbulb,
                function: () {},
                width: width * .5,
                height: height * .5,
              ),
            ],
          )
        ],
      ),
    );
  }
}
