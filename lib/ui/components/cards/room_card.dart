import 'package:consulta_marcada/core/models/room.dart';
import 'package:consulta_marcada/core/utils/navigator.dart';
import 'package:consulta_marcada/ui/components/cards/text_line.dart';
import 'package:consulta_marcada/ui/components/cards/lateral_bar.dart';
import 'package:consulta_marcada/ui/screens/room/room_details_screen.dart';
import 'package:flutter/material.dart';

class RoomCard extends StatelessWidget {
  final Room room;
  RoomCard(this.room);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        splashColor: room.isAvailable
            ? Colors.green.withOpacity(0.5)
            : Colors.red.withOpacity(0.5),
        onTap: () => push(context, RoomDetailsScreen(room)),
        child: Row(
          children: [
            LateralBar(
              color: room.isAvailable ? Colors.green : Colors.red,
              height: 110,
            ),
            buildContent(),
          ],
        ),
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
            TextLine(title: "Tipo", content: room.name),
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
