import 'package:consulta_marcada/core/models/room.dart';
import 'package:consulta_marcada/ui/components/form/custom_field.dart';
import 'package:consulta_marcada/ui/components/custom_text.dart';
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
            CustomText(
              text: 'Status',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            CustomField(
              text: widget.room.isAvailable ? "Disponível" : "Indisponível",
            ),
            CustomText(
              text: 'Tipo de Sala',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            CustomField(text: widget.room.name),
            CustomText(
              text: 'Localização',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            CustomField(
              text: "${widget.room.localization} - Nº ${widget.room.number}",
            ),
          ],
        ),
      ),
    );
  }
}
