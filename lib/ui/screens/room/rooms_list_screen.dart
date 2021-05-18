import 'package:consulta_marcada/core/utils/navigator.dart';
import 'package:consulta_marcada/data/static/data.dart';
import 'package:consulta_marcada/ui/screens/room/rooms_register_screen.dart';
import 'package:consulta_marcada/ui/widgets/buttons/app_floating_button.dart';
import 'package:consulta_marcada/ui/widgets/cards/room_card.dart';
import 'package:flutter/material.dart';

class RoomsListScreen extends StatefulWidget {
  @override
  _RoomsListScreenState createState() => _RoomsListScreenState();
}

class _RoomsListScreenState extends State<RoomsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildListview(),
      floatingActionButton: AppFloatingButton(
        onPressed: () => push(context, RoomsRegisterScreen()),
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
