import 'package:consulta_marcada/core/models/room.dart';
import 'package:consulta_marcada/ui/components/cards/text_line.dart';
import 'package:consulta_marcada/ui/components/cards/lateral_bar.dart';
import 'package:flutter/material.dart';

class RoomCard extends StatelessWidget {
  final Room room;
  RoomCard(this.room);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          LateralBar(
            color: room.isAvailable ? Colors.green : Colors.red,
            height: 110,
          ),
          buildContent(),
        ],
      ),
    );
  }

  Expanded buildContent() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 16, top: 10, bottom: 10),
        child: Column(
          children: [
            TextLine(title: room.localization, content: " - Nº ${room.number}"),
            TextLine(title: "Tipo", content: room.type),
            TextLine(
              title: "Status",
              content: room.isAvailable ? "Disponível" : "Indisponível",
            ),
          ],
        ),
      ),
    );
  }
}
