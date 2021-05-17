import 'package:consulta_marcada/ui/widgets/app_text.dart';
import 'package:flutter/material.dart';

class AppDropdown extends StatefulWidget {
  final List<dynamic> items;
  final String firstItem;
  final String hint;
  final dynamic callback;

  AppDropdown({this.items, this.callback, this.hint, this.firstItem});

  @override
  _AppDropdownState createState() => _AppDropdownState();
}

class _AppDropdownState extends State<AppDropdown> {
  dynamic dropdownValue;

  @override
  initState() {
    super.initState();

    if (widget.firstItem != null) {
      dropdownValue = widget.firstItem;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey[200], blurRadius: 2)],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<dynamic>(
          hint: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: AppText(
              text: widget.hint,
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
          isExpanded: true,
          isDense: true,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 40,
          elevation: 50,
          value: dropdownValue,
          items: widget.items.map<DropdownMenuItem<dynamic>>((dynamic value) {
            return DropdownMenuItem<dynamic>(
              value: value,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  value.name,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            );
          }).toList(),
          onChanged: (dynamic newValue) {
            setState(() {
              dropdownValue = newValue;
              print(dropdownValue);
              widget.callback(dropdownValue);
            });
          },
        ),
      ),
    );
  }
}
