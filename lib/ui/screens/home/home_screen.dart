import 'package:consulta_marcada/core/utils/navigator.dart';
import 'package:consulta_marcada/ui/providers/user_provider.dart';
import 'package:consulta_marcada/ui/screens/doctor/doctors_list_screen.dart';
import 'package:consulta_marcada/ui/screens/home/home_buttons.dart';
import 'package:consulta_marcada/ui/screens/medical_consultation/medical_consultations_list_screen.dart';
import 'package:consulta_marcada/ui/screens/patient/patients_list_screen.dart';
import 'package:consulta_marcada/ui/screens/room/rooms_list_screen.dart';
import 'package:consulta_marcada/ui/screens/user/login_screen.dart';
import 'package:consulta_marcada/ui/widgets/app_alert.dart';
import 'package:consulta_marcada/ui/widgets/menu/menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final int selectedIndex;
  HomeScreen({this.selectedIndex = 0});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> _screenOptions;
  int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
    _screenOptions = <Widget>[
      HomeButtons(),
      MedicalConsultationsListScreen(),
      PatientsListScreen(),
      DoctorsListScreen(),
      RoomsListScreen(),
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
        AppAlert.dialog(
          context: context,
          title: "Sair do APP?",
          message: "Deseja mesmo sair do aplicativo consulta marcada?",
          firstButtonTitle: "Não",
          secondButtonTitle: "Sim",
          function: () {
            UserProvider userProvider =
                Provider.of<UserProvider>(context, listen: false);

            userProvider.signOut();

            push(context, LoginScreen(), replace: true);
          },
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
