import 'package:uuid/uuid.dart';

class Address {
  String _id;
  String _patientCPF;
  String _cep;
  String _street;
  String _district;
  String _city;
  String _uf;

  Address(
    this._patientCPF,
    this._cep,
    this._street,
    this._district,
    this._city,
    this._uf, {
    String id,
  }) : _id = id ?? Uuid().v4();

  String get cep => _cep;
  String get street => _street;
  String get district => _district;
  String get city => _city;
  String get uf => _uf;
  String get id => _id;
  String get patientCPF => _patientCPF;

  Address.fromJson(Map<String, dynamic> json) {
    this._patientCPF = json['cpf_patient_fk'];
    this._id = json['id'];
    this._cep = json['cep'];
    this._street = json['street'];
    this._district = json['district'];
    this._city = json['city'];
    this._uf = json['uf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['cpf_patient_fk'] = this._patientCPF;
    data['cep'] = this._cep;
    data['street'] = this._street;
    data['district'] = this._district;
    data['city'] = this._city;
    data['uf'] = this._uf;
    return data;
  }
}
