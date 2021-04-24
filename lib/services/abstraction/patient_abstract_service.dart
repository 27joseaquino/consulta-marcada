import 'package:consulta_marcada/core/models/patient.dart';
import 'package:consulta_marcada/services/abstraction/abstract_service.dart';

class PatientAbstractService extends AbstractService {
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
    // ignore: todo
    // TODO: implement responseToObject
    throw UnimplementedError();
  }
}
