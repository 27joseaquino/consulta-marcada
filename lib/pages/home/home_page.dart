import 'package:consulta_marcada/components/menu.dart';
import 'package:consulta_marcada/pages/home/home_buttons.dart';
import 'package:consulta_marcada/pages/medical_consultation/list_page.dart';
import 'package:consulta_marcada/pages/patient/patient_page.dart';
import 'package:consulta_marcada/styles/my_colors.dart';
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
      ListPage(),
      PatientPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        title: Text(
          "Consulta Marcada",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
      ),
      body: _screenOptions.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        elevation: 20,
        backgroundColor: MyColors.appColors["blue"],
        selectedItemColor: Colors.white,
        unselectedItemColor: MyColors.appColors["grey"],
        currentIndex: selectedIndex,
        unselectedFontSize: 14,
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
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
