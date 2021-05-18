import 'package:consulta_marcada/ui/widgets/app_text.dart';
import 'package:consulta_marcada/ui/widgets/buttons/app_button.dart';
import 'package:flutter/material.dart';

class AppAlert {
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
          title: AppText(
            text: title,
            fontSize: 18,
            textAlign: TextAlign.justify,
            fontWeight: FontWeight.bold,
            maxlines: 2,
          ),
          content: AppText(
            text: message,
            fontSize: 18,
            maxlines: 5,
            textAlign: TextAlign.start,
          ),
          actions: [
            AppButton(
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
          title: AppText(
            text: title,
            fontSize: 18,
            maxlines: 2,
            textAlign: TextAlign.justify,
            fontWeight: FontWeight.bold,
          ),
          content: AppText(
            text: message,
            fontSize: 18,
            maxlines: 5,
            textAlign: TextAlign.start,
          ),
          actions: <Widget>[
            AppButton(
              onPressed: () => Navigator.pop(context),
              title: firstButtonTitle,
              fontSize: 18,
              height: 50,
              width: 100,
              hasBorder: true,
            ),
            AppButton(
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
