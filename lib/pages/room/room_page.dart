import 'package:consulta_marcada/styles/custom_text.dart';
import 'package:flutter/material.dart';

class RoomPage extends StatefulWidget {
  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CustomText(
          text: "Página de Salas",
          fontSize: 20,
        ),
      ),
    );
  }
}
