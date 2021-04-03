import 'package:consulta_marcada/core/utils/navigator.dart';
import 'package:consulta_marcada/ui/components/buttons/custom_button.dart';
import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  final double width;
  CancelButton({@required this.width});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: "Cancelar",
      height: 50,
      width: width,
      hasBorder: true,
      fontSize: 20,
      onPressed: () => pop(context),
    );
  }
}
