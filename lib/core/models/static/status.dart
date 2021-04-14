import 'package:consulta_marcada/ui/styles/my_colors.dart';
import 'package:flutter/material.dart';

List<String> status = ["Realizada", "Em andamento", "Não realizada"];

Color getStatusColor(String status) {
  switch (status) {
    case "Realizada":
      return Colors.green;
    case "Em andamento":
      return Colors.amber;
    case "Não realizada":
      return Colors.red;
  }
  return MyColors.appColors["dark-blue"];
}

IconData getStatusIcon(String status) {
  switch (status) {
    case "Realizada":
      return Icons.check_circle;
    case "Em andamento":
      return Icons.alarm;
    case "Não realizada":
      return Icons.error;
  }

  return Icons.error_outline;
}
