import 'package:consulta_marcada/core/models/room.dart';
import 'package:consulta_marcada/ui/components/buttons/cancel_button.dart';
import 'package:consulta_marcada/ui/components/buttons/custom_button.dart';
import 'package:consulta_marcada/ui/components/form/custom_text_field.dart';
import 'package:consulta_marcada/ui/styles/custom_text.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _registerRoomFormKey = GlobalKey();
  final _number = TextEditingController();
  final _type = TextEditingController();
  final _localization = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Cadastrar Sala")),
      body: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: LayoutBuilder(builder: (context, constraints) {
          return Visibility(
            visible: constraints.maxWidth <= 380,
            child: verticalScreen(constraints),
            replacement: horizontalScreen(constraints),
          );
        }),
      ),
    );
  }

  Column verticalScreen(BoxConstraints constraints) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: constraints.maxHeight >= 560,
          child: textContainer(
            height: constraints.maxHeight * .15,
            width: constraints.maxWidth,
          ),
          replacement: SizedBox(),
        ),
        registerRoomForm(
          height: constraints.maxHeight < 560
              ? constraints.maxHeight * .95
              : constraints.maxHeight * .6,
          width: constraints.maxWidth,
        ),
        Visibility(
          visible: constraints.maxHeight >= 560,
          child: buttons(
            height: constraints.maxHeight * .25,
            width: constraints.maxWidth,
          ),
          replacement: SizedBox(),
        ),
      ],
    );
  }

  Column horizontalScreen(BoxConstraints constraints) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        registerRoomForm(
          height: constraints.maxHeight >= 280
              ? constraints.maxHeight * .8
              : constraints.maxHeight * .9,
          width: constraints.maxWidth,
        ),
        Visibility(
          visible: constraints.maxHeight >= 280,
          child: buttons(
            height: constraints.maxHeight * .2,
            width: constraints.maxWidth,
          ),
          replacement: SizedBox(),
        ),
      ],
    );
  }

  Container textContainer({double height, double width}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      height: height,
      width: width,
      child: CustomText(
        text: "Cadastre aqui uma nova sala da unidade de saúde.",
        fontSize: 18,
        maxlines: 2,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Container registerRoomForm({double height, double width}) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Form(
        key: _registerRoomFormKey,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              CustomTextField(
                hintText: "Número",
                textInputType: TextInputType.number,
                controller: _number,
                maxLength: 50,
              ),
              CustomTextField(
                hintText: "Tipo",
                controller: _type,
                maxLength: 50,
              ),
              CustomTextField(
                hintText: "Localização",
                controller: _localization,
                maxLength: 100,
                lines: height >= 336 ? 5 : 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buttons({double height, double width}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: height,
      width: width,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CancelButton(width: width * .4),
          CustomButton(
            title: "Cadastrar",
            height: 50,
            fontSize: 20,
            width: width * .4,
            onPressed: _onClickRegister,
          )
        ],
      ),
    );
  }

  _onClickRegister() {
    if (!_registerRoomFormKey.currentState.validate()) return;

    int number = int.parse(_number.text);
    String type = _type.text;
    String localization = _localization.text;

    Room room = Room(number, type, localization, true);

    _number.text = "";
    _type.text = "";
    _localization.text = "";

    print("ID: ${room.id}");
    print("Número: ${room.number}");
    print("Tipo: ${room.type}");
    print("Localização: ${room.localization}");
    print("Status: ${room.isAvailable}");
  }
}
