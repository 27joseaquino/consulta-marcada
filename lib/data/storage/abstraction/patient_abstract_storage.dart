import 'package:consulta_marcada/core/models/patient.dart';

abstract class PatientAbstractStorage {
  Future<int> addPatient({Patient patient});
  Future<List<Map>> fetchPatients();
}
