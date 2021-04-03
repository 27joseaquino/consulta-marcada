import 'package:consulta_marcada/core/utils/navigator.dart';
import 'package:consulta_marcada/ui/components/line.dart';
import 'package:consulta_marcada/ui/components/logo_consulta_marcada.dart';
import 'package:consulta_marcada/ui/pages/home/home_page.dart';
import 'package:consulta_marcada/ui/styles/custom_text.dart';
import 'package:consulta_marcada/ui/styles/my_colors.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LogoConsultaMarcada(
                    fontSize: 18,
                    height: 100,
                    width: 100,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.settings, color: Colors.white),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(color: MyColors.appColors["blue"]),
          ),
          buildListTile(
            icon: Icon(Icons.support_agent_outlined),
            title: "Marcar Consulta",
            onTap: () {
              pop(context);
              push(context, HomePage(selectedIndex: 1), replace: true);
            },
          ),
          buildListTile(
            icon: Icon(Icons.list_alt),
            title: "Lista de Atendimento",
            onTap: () {
              pop(context);
              push(context, HomePage(selectedIndex: 1), replace: true);
            },
          ),
          Line(),
          buildListTile(
            icon: Icon(Icons.person_add),
            title: "Cadastrar Paciente",
            onTap: () {
              pop(context);
              push(context, HomePage(selectedIndex: 2), replace: true);
            },
          ),
          buildListTile(
            icon: Icon(Icons.people_alt),
            title: "Lista de Pacientes",
            onTap: () {
              pop(context);
              push(context, HomePage(selectedIndex: 2), replace: true);
            },
          ),
          Line(),
          buildListTile(
            icon: Icon(Icons.medical_services_rounded),
            title: "Cadastrar Médico",
            onTap: () {
              pop(context);
              push(context, HomePage(selectedIndex: 3), replace: true);
            },
          ),
          buildListTile(
            icon: Icon(Icons.view_list),
            title: "Lista de Médicos",
            onTap: () {
              pop(context);
              push(context, HomePage(selectedIndex: 3), replace: true);
            },
          ),
          Line(),
          buildListTile(
            icon: Icon(Icons.meeting_room),
            title: "Cadastrar Sala",
            onTap: () {
              pop(context);
              push(context, HomePage(selectedIndex: 4), replace: true);
            },
          ),
          buildListTile(
            icon: Icon(Icons.list),
            title: "Lista de Salas",
            onTap: () {
              pop(context);
              push(context, HomePage(selectedIndex: 4), replace: true);
            },
          ),
        ],
      ),
    );
  }

  ListTile buildListTile({
    @required Icon icon,
    @required String title,
    @required Function onTap,
  }) {
    return ListTile(
      leading: icon,
      title: CustomText(text: title, fontSize: 14),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}