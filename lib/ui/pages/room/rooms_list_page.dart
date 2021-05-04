import 'package:consulta_marcada/core/utils/navigator.dart';
import 'package:consulta_marcada/data/static/data.dart';
import 'package:consulta_marcada/ui/components/buttons/custom_floating_button.dart';
import 'package:consulta_marcada/ui/components/cards/room_card.dart';
import 'package:consulta_marcada/ui/pages/room/rooms_register_page.dart';
import 'package:flutter/material.dart';

class RoomsListPage extends StatefulWidget {
  @override
  _RoomsListPageState createState() => _RoomsListPageState();
}

class _RoomsListPageState extends State<RoomsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildListview(),
      floatingActionButton: CustomFloatingButton(
        onPressed: () => push(context, RoomsRegisterPage()),
      ),
    );
  }

  Container buildListview() {
    return Container(
      padding: EdgeInsets.only(top: 16, left: 10, right: 10),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: rooms.length,
        itemBuilder: (context, index) {
          return RoomCard(rooms[index]);
        },
      ),
    );
  }
}
