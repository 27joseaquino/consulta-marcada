import 'package:consulta_marcada/core/models/doctor.dart';
import 'package:consulta_marcada/core/models/patient.dart';
import 'package:consulta_marcada/core/models/room.dart';
import 'package:uuid/uuid.dart';

class MedicalConsultation {
  String _id;
  Patient _patient;
  Doctor _doctor;
  Room _room;
  String _date;
  String _arrivalTime;
  String _status;

  MedicalConsultation(
    this._patient,
    this._doctor,
    this._room,
    this._date,
    this._status, {
    String id,
  }) : _id = id ?? Uuid().v4();

  String get id => _id;
  Patient get patient => _patient;
  Doctor get doctor => _doctor;
  Room get room => _room;
  String get date => _date;
  String get arrivalTime => _arrivalTime;
  String get status => _status;
}
