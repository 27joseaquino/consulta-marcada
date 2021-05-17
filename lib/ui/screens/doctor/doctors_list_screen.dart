import 'package:consulta_marcada/core/utils/navigator.dart';
import 'package:consulta_marcada/data/static/data.dart';
import 'package:consulta_marcada/ui/screens/doctor/doctors_register_screen.dart';
import 'package:consulta_marcada/ui/widgets/buttons/app_floating_button.dart';
import 'package:consulta_marcada/ui/widgets/cards/doctor_card.dart';
import 'package:flutter/material.dart';

class DoctorsListScreen extends StatefulWidget {
  @override
  _DoctorsListScreenState createState() => _DoctorsListScreenState();
}

class _DoctorsListScreenState extends State<DoctorsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildListview(),
      floatingActionButton: AppFloatingButton(
        onPressed: () => push(context, DoctorsRegisterScreen()),
      ),
    );
  }
}

Container buildListview() {
  return Container(
    padding: EdgeInsets.only(top: 16, left: 10, right: 10),
    child: ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        return DoctorCard(doctors[index]);
      },
    ),
  );
}
