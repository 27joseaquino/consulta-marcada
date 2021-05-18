import 'package:consulta_marcada/ui/styles/app_colors.dart';
import 'package:flutter/material.dart';

const List<String> status = ["Realizada", "Em andamento", "Não realizada"];

Color getStatusColor(String status) {
  switch (status) {
    case "Realizada":
      return Colors.green;
    case "Em andamento":
      return Colors.amber;
    case "Não realizada":
      return Colors.red;
  }
  return AppColors.darkBlue;
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
