import 'package:consulta_marcada/core/utils/navigator.dart';
import 'package:consulta_marcada/ui/components/line.dart';
import 'package:consulta_marcada/ui/components/menu/header_menu.dart';
import 'package:consulta_marcada/ui/pages/doctor/doctors_register_page.dart';
import 'package:consulta_marcada/ui/pages/home/home_page.dart';
import 'package:consulta_marcada/ui/pages/patient/patients_register_page.dart';
import 'package:consulta_marcada/ui/pages/room/rooms_register_page.dart';
import 'package:consulta_marcada/ui/components/custom_text.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          HeaderMenu(),
          buildListTile(
            icon: Icon(Icons.support_agent_outlined),
            title: "Marcar Consulta",
            onTap: () {
              Navigator.pop(context);
              push(context, HomePage(selectedIndex: 1), replace: true);
            },
          ),
          buildListTile(
            icon: Icon(Icons.list_alt),
            title: "Lista de Atendimento",
            onTap: () {
              Navigator.pop(context);
              push(context, HomePage(selectedIndex: 1), replace: true);
            },
          ),
          Line(),
          buildListTile(
            icon: Icon(Icons.person_add),
            title: "Cadastrar Paciente",
            onTap: () {
              Navigator.pop(context);
              push(context, PatientsRegisterPage());
            },
          ),
          buildListTile(
            icon: Icon(Icons.people_alt),
            title: "Lista de Pacientes",
            onTap: () {
              Navigator.pop(context);
              push(context, HomePage(selectedIndex: 2), replace: true);
            },
          ),
          Line(),
          buildListTile(
            icon: Icon(Icons.medical_services_rounded),
            title: "Cadastrar Médico",
            onTap: () {
              Navigator.pop(context);
              push(context, DoctorsRegisterPage());
            },
          ),
          buildListTile(
            icon: Icon(Icons.view_list),
            title: "Lista de Médicos",
            onTap: () {
              Navigator.pop(context);
              push(context, HomePage(selectedIndex: 3), replace: true);
            },
          ),
          Line(),
          buildListTile(
            icon: Icon(Icons.meeting_room),
            title: "Cadastrar Sala",
            onTap: () {
              Navigator.pop(context);
              push(context, RoomsRegisterPage());
            },
          ),
          buildListTile(
            icon: Icon(Icons.list),
            title: "Lista de Salas",
            onTap: () {
              Navigator.pop(context);
              push(context, HomePage(selectedIndex: 4), replace: true);
            },
          ),
        ],
      ),
    );
  }

  ListTile buildListTile({Icon icon, String title, Function onTap}) {
    return ListTile(
      leading: icon,
      title: CustomText(text: title, fontSize: 14),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}
