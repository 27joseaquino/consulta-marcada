import 'package:uuid/uuid.dart';

class User {
  String _id;
  String _name;
  String _email;
  String _password;

  User(
    this._name,
    this._email, {
    String id,
  }) : _id = id ?? Uuid().v4();

  String get cpf => _id;
  String get name => _name;
  String get email => _email;
  String get password => _password;

  User.fromJson(Map<String, dynamic> json) {
    this._id = json['id'];
    this._name = json['name'];
    this._email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['email'] = this._email;
    return data;
  }
}
