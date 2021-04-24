import 'package:consulta_marcada/core/models/patient.dart';
import 'package:consulta_marcada/data/storage/database.dart';
import 'package:sqflite/sqflite.dart';

class PatientStorage {
  final String _tableName = 'patient';
  final List<String> columns = [
    'cpf',
    'name',
    'genre',
    'date_of_birth',
    'nationality',
    'mother_name',
    'is_active'
  ];

  Future<List<Map>> fetchPatients() async {
    Database db = await ConsultaMarcadaDB().database;

    List<Map> response = await db.query(_tableName, columns: columns);

    print(response);

    return response;
  }

  Future<int> addPatient({Patient patient}) async {
    Database db = await ConsultaMarcadaDB().database;

    int response = await db.insert(_tableName, patient.toJson());

    return response;
  }
}
