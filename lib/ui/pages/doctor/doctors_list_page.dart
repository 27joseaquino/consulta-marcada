import 'package:consulta_marcada/core/utils/navigator.dart';
import 'package:consulta_marcada/data/data.dart';
import 'package:consulta_marcada/ui/components/buttons/custom_floating_button.dart';
import 'package:consulta_marcada/ui/components/cards/doctor_card.dart';
import 'package:consulta_marcada/ui/pages/doctor/doctors_register_page.dart';
import 'package:flutter/material.dart';

class DoctorsListPage extends StatefulWidget {
  @override
  _DoctorsListPageState createState() => _DoctorsListPageState();
}

class _DoctorsListPageState extends State<DoctorsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildListview(),
      floatingActionButton: CustomFloatingButton(
        onPressed: () => push(context, DoctorsRegisterPage()),
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
