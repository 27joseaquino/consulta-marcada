import 'package:flutter/material.dart';

push(BuildContext context, Widget page, {bool replace = false}) {
  if (replace) {
    Navigator.of(context).popUntil((route) => route.isFirst);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return page;
        },
      ),
    );
  } else {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return page;
        },
      ),
    );
  }
}
