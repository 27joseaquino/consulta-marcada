import 'package:consulta_marcada/core/models/room.dart';
import 'package:consulta_marcada/ui/components/form/custom_field.dart';
import 'package:consulta_marcada/ui/components/custom_text.dart';
import 'package:flutter/material.dart';

class RoomDetailsPage extends StatefulWidget {
  final Room room;
  RoomDetailsPage(this.room);

  @override
  _RoomDetailsPageState createState() => _RoomDetailsPageState();
}

class _RoomDetailsPageState extends State<RoomDetailsPage> {
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
            CustomField(text: widget.room.type),
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
