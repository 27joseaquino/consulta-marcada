import 'package:consulta_marcada/ui/components/buttons/cancel_button.dart';
import 'package:consulta_marcada/ui/components/buttons/custom_button.dart';
import 'package:consulta_marcada/ui/components/form/custom_text_field.dart';
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
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              registerRoomForm(
                height: constraints.maxHeight * .5,
                width: constraints.maxWidth,
              ),
              buttons(
                height: constraints.maxHeight * .3,
                width: constraints.maxWidth,
              ),
            ],
          );
        }),
      ),
    );
  }

  Container registerRoomForm({double height, double width}) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: _registerRoomFormKey,
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
              lines: 3,
            ),
          ],
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

    String number = _number.text;
    String type = _type.text;
    String localization = _localization.text;

    print(number);
    print(type);
    print(localization);
  }
}
