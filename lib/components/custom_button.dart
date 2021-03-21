import 'package:flutter/material.dart';
import 'package:consulta_marcada/ui/styles/my_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  CustomButton({@required this.title});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      child: RaisedButton(
        color: MyColors.appColors["blue"],
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}
