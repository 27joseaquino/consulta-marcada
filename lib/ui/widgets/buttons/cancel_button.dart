import 'package:consulta_marcada/ui/widgets/buttons/app_button.dart';
import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  final double width;
  CancelButton({@required this.width});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      title: "Cancelar",
      height: 50,
      width: width,
      hasBorder: true,
      fontSize: 20,
      onPressed: () => Navigator.pop(context),
    );
  }
}
