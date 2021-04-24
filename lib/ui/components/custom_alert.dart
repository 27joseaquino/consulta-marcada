import 'package:consulta_marcada/ui/components/buttons/custom_button.dart';
import 'package:consulta_marcada/ui/components/custom_text.dart';
import 'package:flutter/material.dart';

class CustomAlert {
  static Future<void> alert({
    BuildContext context,
    String title,
    String message,
    Function function,
  }) {
    return showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: CustomText(
            text: title,
            fontSize: 18,
            textAlign: TextAlign.justify,
            fontWeight: FontWeight.bold,
            maxlines: 2,
          ),
          content: CustomText(
            text: message,
            fontSize: 18,
            maxlines: 5,
            textAlign: TextAlign.justify,
          ),
          actions: [
            CustomButton(
              title: "Ok, entendi",
              onPressed: function ?? () => Navigator.pop(context),
              height: 50,
              width: double.infinity,
              fontSize: 18,
            ),
          ],
        );
      },
    );
  }

  static Future<void> dialog({
    BuildContext context,
    String title,
    String message,
    String firstButtonTitle,
    String secondButtonTitle,
    Function function,
  }) {
    return showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: CustomText(
            text: title,
            fontSize: 18,
            maxlines: 2,
            textAlign: TextAlign.justify,
            fontWeight: FontWeight.bold,
          ),
          content: CustomText(
            text: message,
            fontSize: 18,
            maxlines: 5,
            textAlign: TextAlign.start,
          ),
          actions: <Widget>[
            CustomButton(
              onPressed: () => Navigator.pop(context),
              title: firstButtonTitle,
              fontSize: 18,
              height: 50,
              width: 100,
              hasBorder: true,
            ),
            CustomButton(
              onPressed: function,
              title: secondButtonTitle,
              fontSize: 18,
              height: 50,
              width: 100,
            ),
          ],
        );
      },
    );
  }
}
