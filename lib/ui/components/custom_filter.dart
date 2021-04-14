import 'package:consulta_marcada/ui/styles/custom_text.dart';
import 'package:flutter/material.dart';

class CustomFilter extends StatefulWidget {
  final Color color;
  final IconData icon;
  final String title;

  CustomFilter({this.title, this.color, this.icon});
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
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: FilterChip(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        label: CustomText(
          text: widget.title ?? "",
          fontSize: 14,
          color: color,
          fontWeight: FontWeight.bold,
        ),
        avatar: Icon(widget.icon, color: color),
        backgroundColor: fillColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onSelected: (bool value) {
          setState(() {
            Color deposit = fillColor;
            fillColor = color;
            color = deposit;
            selected = !selected;
          });
        },
      ),
    );
  }
}
