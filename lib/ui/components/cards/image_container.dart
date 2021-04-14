import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final String url;
  ImageContainer({this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      child: Image.network(url, fit: BoxFit.cover),
    );
  }
}
