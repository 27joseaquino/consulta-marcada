import 'package:consulta_marcada/data/database/database.dart';
import 'package:consulta_marcada/data/storage/abstraction/user_abstract_storage.dart';
import 'package:sqflite/sqflite.dart';

class UserStorage extends UserAbstractStorage {
  @override
  Future<List<Map>> signInWithEmailAndPassword({
    String email,
    String password,
  }) async {
    final String _tableName = 'user';
    final List<String> columns = [
      'id',
      'name',
      'email',
    ];

    Database db = await ConsultaMarcadaDB().database;

    List<Map> response = await db.query(
      _tableName,
      columns: columns,
      where: "email = ? AND password = ?",
      whereArgs: [email, password],
    );

    db.close();

    print(response);

    return response;
  }
}
