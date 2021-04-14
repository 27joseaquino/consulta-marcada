import 'package:consulta_marcada/core/utils/navigator.dart';
import 'package:consulta_marcada/ui/components/custom_alert.dart';
import 'package:consulta_marcada/ui/components/menu.dart';
import 'package:consulta_marcada/ui/pages/doctor/doctor_page.dart';
import 'package:consulta_marcada/ui/pages/home/home_buttons.dart';
import 'package:consulta_marcada/ui/pages/medical_consultation/medical_consultation_page.dart';
import 'package:consulta_marcada/ui/pages/patient/patient_page.dart';
import 'package:consulta_marcada/ui/pages/room/room_page.dart';
import 'package:consulta_marcada/ui/pages/user/login_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final int selectedIndex;
  HomePage({this.selectedIndex = 0});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _screenOptions;
  int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
    _screenOptions = <Widget>[
      HomeButtons(),
      MedicalConsultationPage(),
      PatientPage(),
      DoctorPage(),
      RoomPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        title: Text("Consulta Marcada", style: TextStyle(fontSize: 20)),
        centerTitle: true,
        actions: [exitButton(context)],
      ),
      body: _screenOptions.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support_agent),
            label: "Consultas",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt),
            label: "Pacientes",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services),
            label: "Médicos",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.meeting_room_outlined),
            label: "Salas",
          ),
        ],
      ),
    );
  }

  IconButton exitButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        CustomAlert().dialog(
          context: context,
          title: "Sair do APP?",
          message: "Deseja mesmo sair do aplicativo consulta marcada?",
          firstButtonTitle: "Não",
          secondButtonTitle: "Sim",
          function: () => push(context, LoginPage(), replace: true),
        );
      },
      icon: Icon(Icons.logout),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
