import 'package:consulta_marcada/core/models/patient.dart';
import 'package:consulta_marcada/data/storage/patient_storage.dart';
import 'package:consulta_marcada/services/abstraction/patient_abstract_service.dart';
import 'package:consulta_marcada/services/service_response.dart';

class PatientService extends PatientAbstractService {
  Future<ServiceResponse<bool>> addPatient({Patient patient}) async {
    ServiceResponse<bool> result = ServiceResponse<bool>();
    try {
      int response = await PatientStorage().addPatient(patient: patient);

      result.setData = response != null;
    } catch (e) {
      result.setError = "Ocorreu um erro.";
    }

    return result;
  }

  Future<ServiceResponse<List<Patient>>> fetchPatients() async {
    ServiceResponse<List<Patient>> result = ServiceResponse<List<Patient>>();
    try {
      List<Map> response = await PatientStorage().fetchPatients();

      result.setData = this.responseToObjectList(response);
    } catch (e) {
      result.setError = "Ocorreu um erro.";
    }

    return result;
  }
}
