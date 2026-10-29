import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:sqlite_intro/model/note.dart';

class DatabaseHelper {
  final _databaseName = 'se1902_notemanagement.db';
  static const _noteTableName = 'notes';

  // Singleton pattern
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Thuoc tinh chinh dua ra instance db
  static Database? _database;

  // getter
  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  /**
   * ??= viet tat cua
   * a ??= b
   * a = a ?? b
   */

  Future<Database> _initDatabase() async {
    // For web platform
    if (kIsWeb) {
      databaseFactory = databaseFactoryFfiWeb; // đổi factory qua ffi web
      return openDatabase(_databaseName, version: 1, onCreate: _onCreate);
    }

    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _databaseName);
    return openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_noteTableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        content TEXT NOT NULL
      )
    ''');
  }

  // LIST
  Future<List<Note>> getAll() async {
    final db = await database;
    // ORM
    final List<Map<String, Object?>> maps = await db.query(
      _noteTableName,
      orderBy: 'id DESC',
    ); // ~ select * from notes order by id desc
    /**
     * maps = [
     *  {
     *    'id': 1,
     *    'title': 'Note title',
     *    'content': 'Content'
     *  }
     * ]
     */
    return [
      for (final m in maps) Note.fromJson(m)
    ];
  }

  // CREATE
  Future<int> create(Note note) async {
    final db = await database;
    return db.insert(_noteTableName, note.toJson());
  }

  // UPDATE

  // DELETE
  Future<int> delete(int id) async {
    final db = await database;
    return db.delete(_noteTableName, where: 'id = ?', whereArgs: [id]); // Luu y ve SQL injection
  }
}
