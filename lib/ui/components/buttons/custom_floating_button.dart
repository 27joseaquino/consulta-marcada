import 'package:consulta_marcada/ui/styles/my_colors.dart';
import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  final Function onPressed;
  CustomFloatingButton({@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add, color: Colors.white),
      onPressed: () {},
      backgroundColor: MyColors.appColors["dark-blue"],
    );
  }
}
