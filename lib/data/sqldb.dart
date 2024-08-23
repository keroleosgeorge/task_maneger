import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Sqldb {
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initialDatabase();
    return _database;
  }

  //? Create Database
  initialDatabase() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath + 'todo.db');
    Database database = await openDatabase(path,
        onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);

    return database;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
              CREATE TABLE "tasks" (
              "id" INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
              "task" TEXT,
              )
               ''');
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) {
    
  }
  //! Select Data

  readData() async {
    Database? mydb = await database;
    List<Map> response = await mydb!.rawQuery(
        'SELECT * FROM tasks'); //rawQuery used to select data from database
    return response;
  }
  //! Insert Data

  insertData(String task) async {
    Database? mydb = await database;
    int response = await mydb!.rawInsert(
        'INSERT INTO tasks(task) VALUES("$task")'); //rawInsert used to insert data
    return response;
  }
  //! Delete Data

  deleteData(int id) async {
    Database? mydb = await database;
    int response = await mydb!.rawDelete(
        'DELETE FROM tasks WHERE id = ?', [id]); //rawDelete used to delete data
    return response;
  }
  //! Update Data

  updateData(int id, String tasks) async {
    Database? mydb = await database;
    int response = await mydb!.rawUpdate(
        'UPDATE tasks SET task = ? WHERE id = ?',
        [tasks, id]); //rawUpdate used to update data
    return response;
  }
}
