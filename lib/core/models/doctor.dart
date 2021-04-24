class Doctor {
  int _crm;
  String _name;
  String _genre;
  String _specialty;
  int _isActive;

  Doctor(
    this._crm,
    this._name,
    this._genre,
    this._specialty,
    this._isActive,
  );

  int get crm => _crm;
  String get name => _name;
  String get genre => _genre;
  String get specialty => _specialty;
  int get isActive => _isActive;
}
