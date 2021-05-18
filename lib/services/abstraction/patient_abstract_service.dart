import 'package:consulta_marcada/core/models/patient.dart';
import 'package:consulta_marcada/services/abstraction/abstract_service.dart';
import 'package:consulta_marcada/services/service_response.dart';

abstract class PatientAbstractService extends AbstractService {
  Future<ServiceResponse<bool>> addPatient({Patient patient});
  Future<ServiceResponse<List<Patient>>> fetchPatients();

  @override
  List responseToObjectList(List json) {
    List<Patient> patients = [];

    for (int i = 0; i < json.length; i++) {
      patients.add(Patient.fromJson(json[i]));
    }

    return patients;
  }

  @override
  responseToObject(Map json) {
    Patient patient = Patient.fromJson(json);

    return patient;
  }
}
