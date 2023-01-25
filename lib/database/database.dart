import 'package:learning_flutter/models/task.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static Database? _dataBase;
  static const int version = 1;
  static const String tableName = 'tasks';

  static Future<void> initDb() async {
    if (_dataBase != null) {
      return Future.value();
    }
    try {
      String path = '${await getDatabasesPath()}tasks.db';
      _dataBase =
          await openDatabase(path, version: version, onCreate: (db, version) {
        print('Creating new task');
        return db.execute('''
          CREATE TABLE $tableName(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            description TEXT,
            isCompleted INTEGER,
            date STRING,
            startDate STRING,
            endDate STRING,
            color INTEGER,
            remind INTEGER,
            repeat TEXT
          )
        ''');
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insertTask(Task? task) async {
    print('Inserting a task: ');
    return await _dataBase?.insert(tableName, task!.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    print('Querying all tasks');
    return await _dataBase?.query(tableName) ?? [];
  }
}
