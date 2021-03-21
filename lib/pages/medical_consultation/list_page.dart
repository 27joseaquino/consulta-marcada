import 'package:consulta_marcada/components/custom_card.dart';
import 'package:flutter/material.dart';

import '../../ui/styles/my_colors.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de consultas"),
      ),
      body: buildListview(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
        backgroundColor: MyColors.appColors["blue"],
      ),
    );
  }
}

buildListview() {
  return ListView(
    children: <Widget>[
      CustomCard(
          patient: "Sabrinna", doctor: "Dhiana", date: "21/03/2021 às 15h"),
      CustomCard(patient: "Sofia", doctor: "Dhiana", date: "21/03/2021 às 15h"),
      CustomCard(patient: "Júlia", doctor: "Tarsis", date: "21/03/2021 às 15h"),
      CustomCard(
          patient: "Matheus", doctor: "Tarsis", date: "21/03/2021 às 15h"),
      CustomCard(patient: "Bia", doctor: "Dhiana", date: "21/03/2021 às 15h"),
    ],
  );
}
