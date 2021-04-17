import 'package:consulta_marcada/ui/components/custom_text.dart';
import 'package:flutter/material.dart';

class CustomFilter extends StatefulWidget {
  final Color color;
  final IconData icon;
  final String title;
  final dynamic addStatus;
  final dynamic removeStatus;

  CustomFilter({
    this.title,
    this.color,
    this.icon,
    this.addStatus,
    this.removeStatus,
  });

  @override
  _CustomFilterState createState() => _CustomFilterState();
}

class _CustomFilterState extends State<CustomFilter> {
  Color fillColor;
  Color color;
  bool selected = false;

  @override
  initState() {
    super.initState();
    fillColor = Colors.white;
    color = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: TextButton.icon(
        label: CustomText(
          text: widget.title ?? "",
          fontSize: 14,
          color: color,
          fontWeight: FontWeight.bold,
        ),
        icon: Icon(widget.icon, color: color),
        style: TextButton.styleFrom(
          backgroundColor: fillColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          setState(() {
            Color deposit = fillColor;
            fillColor = color;
            color = deposit;
            selected = !selected;
          });

          if (selected) {
            widget.addStatus(widget.title);
          } else {
            widget.removeStatus(widget.title);
          }
        },
      ),
    );
  }
}
