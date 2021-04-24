import 'package:uuid/uuid.dart';

class Address {
  String _id;
  String _cep;
  String _street;
  String _district;
  String _city;
  String _uf;

  Address(
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cep'] = this._cep;
    data['logradouro'] = this._street;
    data['bairro'] = this._district;
    data['localidade'] = this._city;
    data['uf'] = this._uf;
    return data;
  }
}
