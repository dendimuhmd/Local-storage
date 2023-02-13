import 'package:local_storage/app/data/model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();
  static late Database _database;
  static String _tableName = 'notes';
// static String _tableName = 'notes';

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  Future<Database> _initializeDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/resto.db';
    var db = await openDatabase(
      databasePath,
      version: 1,
      onCreate: _onCreate,
    );
    return db;
  }

  Future<void> updateNote(Notes note) async {
    final db = await database;

    await db.update(
      _tableName,
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
CREATE TABLE $_tableName (
  id INTEGER PRIMARY KEY,
  title TEXT, description TEXT
);
''');
  }

  Future<List<Notes>> insertNote(Notes notes) async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.query(_tableName);
// log('sukses');
    print('Data saved');

    return result.map((e) => Notes.fromMap(e)).toList();
  }

  Future<List<Notes>> getNotes() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    return result.map((e) => Notes.fromMap(e)).toList();
  }

  Future<Notes> getNoteById(int id) async {
    final db = await database;
    List<Map<String, dynamic>> results = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );

    return results.map((res) => Notes.fromMap(res)).first;
  }

  Future<int> removeFavList(int id) async {
    final db = await database;
    return await db.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }
}
