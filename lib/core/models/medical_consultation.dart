import 'package:consulta_marcada/core/models/doctor.dart';
import 'package:consulta_marcada/core/models/patient.dart';
import 'package:consulta_marcada/core/models/room.dart';
import 'package:uuid/uuid.dart';

class MedicalConsultation {
  String _id;
  Patient patient;
  Doctor doctor;
  Room room;
  String _date;
  String _arrivalTime;
  String _status;

  MedicalConsultation(
    this._date,
    this._arrivalTime,
    this._status, {
    this.patient,
    this.doctor,
    this.room,
    String id,
  }) : _id = id ?? Uuid().v4();

  String get id => _id;
 // Patient get patient => _patient;
//Doctor get doctor => _doctor;
//Room get room => _room;
  String get date => _date;
  String get arrivalTime => _arrivalTime;
  String get status => _status;
}
