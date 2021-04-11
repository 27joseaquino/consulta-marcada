import 'package:consulta_marcada/core/models/room.dart';
import 'package:consulta_marcada/core/utils/navigator.dart';
import 'package:consulta_marcada/ui/components/buttons/custom_floating_button.dart';
import 'package:consulta_marcada/ui/components/cards/room_card.dart';
import 'package:consulta_marcada/ui/pages/room/register_room_page.dart';
import 'package:flutter/material.dart';

class RoomPage extends StatefulWidget {
  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildListview(),
      floatingActionButton: CustomFloatingButton(
        onPressed: () => push(context, RegisterRoomPage()),
      ),
    );
  }

  buildListview() {
    Room room1 = Room(110, "Cirurgia", "1º Andar", true);
    Room room2 = Room(256, "Cirurgia", "2º Andar", false);

    return Container(
      padding: EdgeInsets.only(top: 16, left: 10, right: 10),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          RoomCard(room: room1),
          RoomCard(room: room2),
          RoomCard(room: room1),
          RoomCard(room: room2),
        ],
      ),
    );
  }
}
