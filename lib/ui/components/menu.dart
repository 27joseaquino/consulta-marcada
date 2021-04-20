import 'package:consulta_marcada/core/utils/navigator.dart';
import 'package:consulta_marcada/ui/components/line.dart';
import 'package:consulta_marcada/ui/components/logo_consulta_marcada.dart';
import 'package:consulta_marcada/ui/pages/doctor/register_doctor_page.dart';
import 'package:consulta_marcada/ui/pages/home/home_page.dart';
import 'package:consulta_marcada/ui/pages/patient/register_patient_page.dart';
import 'package:consulta_marcada/ui/pages/room/register_room_page.dart';
import 'package:consulta_marcada/ui/components/custom_text.dart';
import 'package:consulta_marcada/ui/styles/my_colors.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          drawerHeader(),
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
              push(context, RegisterPatientPage());
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
              push(context, RegisterDoctorPage());
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
              push(context, RegisterRoomPage());
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

  DrawerHeader drawerHeader() {
    return DrawerHeader(
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
