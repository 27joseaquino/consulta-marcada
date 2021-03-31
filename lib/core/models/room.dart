import 'package:uuid/uuid.dart';

class Room {
  String _id;
  int _number;
  String _type;
  String _localization;
  bool _isAvailable;

  Room(
    this._number,
    this._type,
    this._localization,
    this._isAvailable, {
    String id,
  }) : _id = id ?? Uuid().v4();

  get id => _id;
  get number => _number;
  get type => _type;
  get isAvailable => _isAvailable;
  get localization => _localization;
}
