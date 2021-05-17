import 'package:consulta_marcada/core/utils/navigator.dart';
import 'package:consulta_marcada/ui/components/line.dart';
import 'package:consulta_marcada/ui/components/menu/header_menu.dart';
import 'package:consulta_marcada/ui/components/custom_text.dart';
import 'package:consulta_marcada/ui/screens/doctor/doctors_register_screen.dart';
import 'package:consulta_marcada/ui/screens/home/home_screen.dart';
import 'package:consulta_marcada/ui/screens/patient/patients_register_screen.dart';
import 'package:consulta_marcada/ui/screens/room/rooms_register_screen.dart';
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
              push(context, HomeScreen(selectedIndex: 1), replace: true);
            },
          ),
          buildListTile(
            icon: Icon(Icons.list_alt),
            title: "Lista de Atendimento",
            onTap: () {
              Navigator.pop(context);
              push(context, HomeScreen(selectedIndex: 1), replace: true);
            },
          ),
          Line(),
          buildListTile(
            icon: Icon(Icons.person_add),
            title: "Cadastrar Paciente",
            onTap: () {
              Navigator.pop(context);
              push(context, PatientsRegisterScreen());
            },
          ),
          buildListTile(
            icon: Icon(Icons.people_alt),
            title: "Lista de Pacientes",
            onTap: () {
              Navigator.pop(context);
              push(context, HomeScreen(selectedIndex: 2), replace: true);
            },
          ),
          Line(),
          buildListTile(
            icon: Icon(Icons.medical_services_rounded),
            title: "Cadastrar Médico",
            onTap: () {
              Navigator.pop(context);
              push(context, DoctorsRegisterScreen());
            },
          ),
          buildListTile(
            icon: Icon(Icons.view_list),
            title: "Lista de Médicos",
            onTap: () {
              Navigator.pop(context);
              push(context, HomeScreen(selectedIndex: 3), replace: true);
            },
          ),
          Line(),
          buildListTile(
            icon: Icon(Icons.meeting_room),
            title: "Cadastrar Sala",
            onTap: () {
              Navigator.pop(context);
              push(context, RoomsRegisterScreen());
            },
          ),
          buildListTile(
            icon: Icon(Icons.list),
            title: "Lista de Salas",
            onTap: () {
              Navigator.pop(context);
              push(context, HomeScreen(selectedIndex: 4), replace: true);
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
