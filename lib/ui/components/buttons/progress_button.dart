import 'package:consulta_marcada/ui/components/custom_circular_progress.dart';
import 'package:flutter/material.dart';

class ProgressButton extends StatelessWidget {
  final bool showProgress;
  final Function function;
  final Widget content;
  final Color color;
  final double height;
  final double width;

  ProgressButton({
    this.function,
    this.width,
    this.height,
    this.content,
    this.color,
    this.showProgress = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: color),
          ),
          backgroundColor: color,
        ),
        onPressed: function,
        child: showProgress ? CustomCircularProgress() : content,
      ),
    );
  }
}
