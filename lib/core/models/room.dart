import 'package:uuid/uuid.dart';

class Room {
  String _id;
  int _number;
  String _name;
  String _localization;
  bool _isAvailable;

  Room(
    this._number,
    this._name,
    this._localization,
    this._isAvailable, {
    String id,
  }) : _id = id ?? Uuid().v4();

  String get id => _id;
  int get number => _number;
  String get name => _name;
  bool get isAvailable => _isAvailable;
  String get localization => _localization;
}
