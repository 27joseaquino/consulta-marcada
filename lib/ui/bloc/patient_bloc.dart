import 'package:consulta_marcada/core/models/patient.dart';
import 'package:consulta_marcada/services/implementation/patient_service.dart';
import 'package:consulta_marcada/services/service_response.dart';
import 'package:consulta_marcada/ui/bloc/abstract_bloc.dart';

class PatientBloc extends AbstractBloc {
  final _patientService = PatientService();
  List<Patient> _patients;

  List<Patient> get patients => _patients;

  void fetchPatients() async {
    setIsProcessing(true);

    ServiceResponse<List<Patient>> result =
        await _patientService.fetchPatients();

    _patients = this.getDataFromService(result);

    setIsProcessing(false);
  }

  Future<bool> addPatient({Patient patient}) async {
    setIsProcessing(true);

    ServiceResponse<bool> result = await _patientService.addPatient(
      patient: patient,
    );

    if (result.error != null) {
      setError(result.error);
    }

    fetchPatients();

    setIsProcessing(false);

    return result.data;
  }
}
