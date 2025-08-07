import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_list/DataFile/Local/userModel.dart';

class DBHelper {
  static Database? _database;

  Future<Database?> get db async {
    if (_database != null) {
      return _database;
    }
    else {
      _database=await _initDatabase();
      return _database!;
    }
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'UserTask.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE task(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    description TEXT
    )
    ''');
  }

  Future<int> insertUserTask(UserTaskModel userTask) async {
    final db = await _database;
    return db!.insert('task', userTask.toMap());
  }

  Future<List<UserTaskModel>> getTask() async {
    final db = await _database;
    final List<Map<String, dynamic>> maps = await db!.query('task');
    return List.generate(
      maps.length,
      (index) => UserTaskModel.formMap(maps[index]),
    );
  }

  Future<int> updateTask(UserTaskModel userTask) async {
    final db = await _database;
    return await db!.update('task', userTask.toMap(),
        where: 'id=?', whereArgs: [userTask.id]);
  }

  Future<int> deleteTask(int id) async {
    final db = await _database;
    return db!.delete('task', where: 'id=?', whereArgs: [id]);
  }
}
