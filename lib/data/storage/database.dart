import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ConsultaMarcadaDB {
  Database _database;

  Future<Database> get database async {
    _database = await _initDB();

    return _database;
  }

  Future<Database> _initDB() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'consulta_marcada.db');

    print("PATH DO BANCO DE DADOS: $path");

    Database db = await openDatabase(path, version: 1, onCreate: _onCreate);

    return db;
  }

  Future<void> _onCreate(Database database, int version) async {
    String sql = "create table user (id VARCHAR(500) PRIMARY KEY, " +
        "name VARCHAR(100), email VARCHAR(100), password VARCHAR(500));";

    await database.execute(sql);

    sql = "create table patient (cpf VARCHAR(11) PRIMARY KEY, " +
        "name VARCHAR(100), genre VARCHAR(10), date_of_birth VARCHAR(10), " +
        "nationality VARCHAR(20), mother_name VARCHAR(100), is_active BOOLEAN DEAFULT true);";

    await database.execute(sql);

    sql = "create table address (id VARCHAR(500) PRIMARY KEY, cpf_patient_fk " +
        "VARCHAR(500), cep VARCHAR(100), street VARCHAR(100), district " +
        "VARCHAR(100), city VARCHAR(100), uf VARCHAR(2), " +
        "FOREIGN KEY(cpf_patient_fk) REFERENCES patient(cpf));";

    await database.execute(sql);

    sql = "INSERT INTO user (id, name, email, password)" +
        "VALUES ('asdjdkjsdjlasj', 'João Márcio', 'joao@gmail.com', '12345678');";

    await database.execute(sql);
  }
}
