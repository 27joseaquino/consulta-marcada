import 'package:consulta_marcada/components/custom_card.dart';
import 'package:consulta_marcada/styles/my_colors.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildListview(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {},
        backgroundColor: MyColors.appColors["blue"],
      ),
    );
  }
}

buildListview() {
  return Container(
    padding: EdgeInsets.only(top: 16, left: 10, right: 10),
    child: ListView(
      children: <Widget>[
        CustomCard(
          patient: "Sabrinna",
          doctor: "Dhiana",
          date: "21/03/2021 às 15h",
        ),
        CustomCard(
          patient: "Sofia",
          doctor: "Dhiana",
          date: "21/03/2021 às 15h",
        ),
        CustomCard(
          patient: "Júlia",
          doctor: "Tarsis",
          date: "21/03/2021 às 15h",
        ),
        CustomCard(
          patient: "Matheus",
          doctor: "Tarsis",
          date: "21/03/2021 às 15h",
        ),
        CustomCard(
          patient: "Bia",
          doctor: "Dhiana",
          date: "21/03/2021 às 15h",
        ),
      ],
    ),
  );
}
