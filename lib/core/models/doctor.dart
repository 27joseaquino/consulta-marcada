import 'package:uuid/uuid.dart';

class Doctor {
  String _id;
  String _name;
  String _genre;
  String _specialty;
  bool _isActive;

  Doctor(
    this._name,
    this._genre,
    this._specialty,
    this._isActive, {
    String id,
  }) : _id = id ?? Uuid().v4();

  String get id => _id;
  String get name => _name;
  String get genre => _genre;
  String get specialty => _specialty;
  bool get isActive => _isActive;
}
