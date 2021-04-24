import 'package:consulta_marcada/core/models/address.dart';
import 'package:consulta_marcada/data/database/database.dart';
import 'package:sqflite/sqflite.dart';

class AddressStorage {
  final String _tableName = 'address';

  final List<String> columns = [
    'cpf_patient_fk',
    'id',
    'cep',
    'street',
    'city',
    'district',
    'uf'
  ];

  Future<List<Map>> fetchAddressList() async {
    Database db = await ConsultaMarcadaDB().database;

    List<Map> response = await db.query(_tableName, columns: columns);

    db.close();

    print(response);

    return response;
  }

  Future<int> addAddress({Address address}) async {
    Database db = await ConsultaMarcadaDB().database;

    int response = await db.insert(_tableName, address.toJson());

    db.close();

    return response;
  }
}
