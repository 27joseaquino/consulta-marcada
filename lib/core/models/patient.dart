import 'package:consulta_marcada/core/models/address.dart';

class Patient {
  String _cpf;
  String _name;
  String _dateOfBirth;
  String _genre;
  String _nationality;
  String _motherName;
  Address _address;
  bool _isActive;

  Patient(
    this._cpf,
    this._name,
    this._dateOfBirth,
    this._genre,
    this._nationality,
    this._motherName,
  );

  String get cpf => _cpf;
  String get name => _name;
  String get dateOfBirth => _dateOfBirth;
  String get genre => _genre;
  String get nationality => _nationality;
  String get motherName => _motherName;
  Address get address => _address;
  bool get isActive => _isActive;

  Patient.fromJson(Map<String, dynamic> json) {
    this._cpf = json['cpf'];
    this._name = json['name'];
    this._genre = json['genre'];
    this._dateOfBirth = json['date_of_birth'];
    this._nationality = json['nationality'];
    this._motherName = json['mother_name'];
    this._isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cpf'] = this._cpf;
    data['name'] = this._name;
    data['genre'] = this._genre;
    data['date_of_birth'] = this._dateOfBirth;
    data['nationality'] = this._nationality;
    data['mother_name'] = this._motherName;
    return data;
  }
}
