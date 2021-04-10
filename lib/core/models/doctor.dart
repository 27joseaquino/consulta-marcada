import 'package:uuid/uuid.dart';

class Doctor {
  String _id;
  String _name;
  String _genre;
  String _specialty;
  String _image;
  bool _isActive;

  Doctor(
    this._name,
    this._genre,
    this._specialty,
    this._image,
    this._isActive {
    String id,
  }) : _id = id ?? Uuid().v4();

  String get id => _id;
  String get name => _name;
  String get genre => _genre;
  String get specialty => _specialty;
  String get image => _image;
  bool get isActive => _isActive;
}