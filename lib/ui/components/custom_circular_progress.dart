import 'package:consulta_marcada/ui/styles/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCircularProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 5,
        backgroundColor: AppColors.lightBlue,
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkBlue),
      ),
    );
  }
}
