import 'package:consulta_marcada/ui/styles/my_colors.dart';
import 'package:flutter/material.dart';

class CustomCircularProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 5,
        backgroundColor: MyColors.appColors["light-blue"],
        valueColor: AlwaysStoppedAnimation<Color>(
          MyColors.appColors["dark-bluee"],
        ),
      ),
    );
  }
}
