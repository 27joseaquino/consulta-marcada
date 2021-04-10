import 'package:consulta_marcada/ui/styles/custom_text.dart';
import 'package:consulta_marcada/components/custom_card.dart';
import 'package:consulta_marcada/styles/my_colors.dart';
import 'package:flutter/material.dart';


class DoctorPage extends StatefulWidget {
  @override
  _DoctorPageState createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildListview(),
      floatingActionButton: CustomFloatingButton(
        onPressed: () {}
      ),
    );
  }
}

Container buildListview() {
  Doctor doctor1 = Doctor("Dhiana", "Feminino", "Cirurgiã", "https://blog.ipog.edu.br/wp-content/uploads/2017/10/m%C3%A9dico.jpg", true);
  Doctor doctor2 = Doctor("Júlia", "Feminino", "Cardiologista", "https://blog.ipog.edu.br/wp-content/uploads/2017/10/m%C3%A9dico.jpg", false);
  
  return Container(
    padding: EdgeInsets.only(top: 16, left: 10, right: 10),
    child: ListView(
      children: <Widget>[
        DoctorCard( 
          doctor: doctor1,
        ),
        DoctorCard( 
          doctor: doctor2,
        ),
        DoctorCard( 
          doctor: doctor1,
        ),
        DoctorCard( 
          doctor: doctor2,
        ),
      ],
    ),
  );
}
