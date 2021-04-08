import 'package:flutter/material.dart';

class LateralBar extends StatelessWidget {
  final Color color;
  final double height;
  LateralBar({@required this.color, @required this.height});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        padding: EdgeInsets.all(0),
        color: color,
        width: 10,
        height: height,
      ),
    );
  }
}
