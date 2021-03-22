import 'package:consulta_marcada/styles/custom_text.dart';
import 'package:consulta_marcada/styles/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class QuickAccessButton extends StatelessWidget {
  final String title;
  final Function function;
  final IconData icon;
  final double width;
  final double height;

  QuickAccessButton({
    @required this.title,
    @required this.function,
    @required this.icon,
    @required this.width,
    @required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
          primary: MyColors.appColors["dark-blue"],
        ),
        child: Container(
          alignment: Alignment(-.9, .4),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Visibility(
                  visible: icon != Icons.wb_incandescent,
                  replacement: _iconRotate(icon),
                  child: Icon(icon, color: Colors.white, size: 25),
                ),
                Container(
                  child: CustomText(
                    text: title,
                    fontSize: height * 0.15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    textAlign: TextAlign.start,
                    maxlines: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _iconRotate(IconData icon) {
    return Transform.rotate(
      angle: pi,
      child: Icon(icon, color: Colors.white, size: 25),
    );
  }
}
