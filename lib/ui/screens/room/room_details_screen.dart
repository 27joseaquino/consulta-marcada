import 'package:consulta_marcada/core/models/room.dart';
import 'package:consulta_marcada/ui/widgets/app_text.dart';
import 'package:consulta_marcada/ui/widgets/fields/app_field.dart';
import 'package:flutter/material.dart';

class RoomDetailsScreen extends StatefulWidget {
  final Room room;
  RoomDetailsScreen(this.room);

  @override
  _RoomDetailsScreenState createState() => _RoomDetailsScreenState();
}

class _RoomDetailsScreenState extends State<RoomDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detalhes da Sala")),
      body: buildBody(),
    );
  }

  Container buildBody() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppText(
              text: 'Status',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            AppField(
              text: widget.room.isAvailable ? "Disponível" : "Indisponível",
            ),
            AppText(
              text: 'Tipo de Sala',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            AppField(text: widget.room.name),
            AppText(
              text: 'Localização',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            AppField(
              text: "${widget.room.localization} - Nº ${widget.room.number}",
            ),
          ],
        ),
      ),
    );
  }
}
