import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final FormFieldValidator<String> validator;
  final TextEditingController controller;
  final TextInputType textInputType;
  final String hintText;
  final bool isObscure;
  final int maxLength;
  final int lines;

  AppTextField({
    this.textInputType = TextInputType.text,
    this.isObscure = false,
    this.maxLength = 200,
    this.lines = 1,
    this.controller,
    this.validator,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        validator: validator ??
            (String text) {
              if (text.isEmpty) {
                return "Preencha este campo!";
              } else if (text.length > maxLength) {
                return "Você ultrapassou o limite de caracteres!";
              }
              return null;
            },
        maxLines: lines,
        keyboardType: textInputType,
        controller: controller,
        obscureText: isObscure,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
        ),
        style: TextStyle(fontSize: 18, color: Colors.grey[700]),
      ),
    );
  }
}
