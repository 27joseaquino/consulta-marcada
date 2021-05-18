import 'package:consulta_marcada/services/service_response.dart';
import 'package:flutter/material.dart';

abstract class AbstractProvider extends ChangeNotifier {
  bool _isProcessing = false;
  String _error;

  bool get isProcessing => _isProcessing;

  String get error => _error;

  void clearError() => _error = null;

  void setIsProcessing(bool isProcessing) {
    _isProcessing = isProcessing;

    Future.delayed(Duration.zero, () => notifyListeners());
  }

  void setError(String error) {
    _error = error;
    notifyListeners();
  }

  T getDataFromService<T>(ServiceResponse<T> result) {
    T data;

    if (result.data != null) {
      data = result.data;
    } else if (result.error != null) {
      setError(result.error);

      print("Log: ${result.error}");

      return null;
    }

    return data;
  }
}
