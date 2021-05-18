import 'package:consulta_marcada/core/models/patient.dart';
import 'package:consulta_marcada/data/database/database.dart';
import 'package:consulta_marcada/data/storage/abstraction/patient_abstract_storage.dart';
import 'package:sqflite/sqflite.dart';

class PatientStorage extends PatientAbstractStorage {
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

  @override
  Future<List<Map>> fetchPatients() async {
    Database db = await ConsultaMarcadaDB().database;

    List<Map> response = await db.query(_tableName, columns: columns);

    db.close();

    print(response);

    return response;
  }

  @override
  Future<int> addPatient({Patient patient}) async {
    Database db = await ConsultaMarcadaDB().database;

    int response = await db.insert(_tableName, patient.toJson());

    db.close();

    return response;
  }
}
