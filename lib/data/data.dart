import 'package:consulta_marcada/core/models/medical_consultation.dart';
import 'package:consulta_marcada/core/models/patient.dart';
import 'package:consulta_marcada/core/models/room.dart';
import 'package:consulta_marcada/core/models/doctor.dart';

Room room1 = Room(110, "Cirurgia", "1º Andar", true);
Room room2 = Room(256, "Cirurgia", "2º Andar", false);

Doctor doctor1 = Doctor(
  "Dra. Renata Oliveira",
  "Feminino",
  "Cirurgiã",
  true,
);
Doctor doctor2 = Doctor(
  "Dra. Júlia Quentino",
  "Feminino",
  "Cardiologista",
  false,
);

Patient patient1 = Patient(
  "123.456.789-00",
  "José Ronaldo de Oliveira",
  "13/03/2000",
  "Masculino",
  "Brasileiro",
  "Maria de Oliveira",
  true,
);

Patient patient2 = Patient(
  "143.456.789-00",
  "João da Silva Santos",
  "13/03/2000",
  "Masculino",
  "Brasileiro",
  "Maria dos Santos",
  false,
);

MedicalConsultation consultation1 = MedicalConsultation(
  "11/05/2021 às 15:00",
  "15:30",
  "Em andamento",
  patient: patient1,
  doctor: doctor1,
  room: room1,
);

MedicalConsultation consultation2 = MedicalConsultation(
  "11/05/2021 às 16:30",
  "16:30",
  "Realizada",
  patient: patient2,
  doctor: doctor2,
  room: room2,
);

List<Room> rooms = [room1, room2];
List<Doctor> doctors = [doctor1, doctor2];
List<Patient> patients = [patient1, patient2];
List<MedicalConsultation> consultations = [consultation1, consultation2];
