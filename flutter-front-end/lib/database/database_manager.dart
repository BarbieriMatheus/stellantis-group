import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  Future<Database> getDatabase() async {
    final path = join(await getDatabasesPath(), 'stellantiss.db');
    return openDatabase(path, version: 1, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
    await db.execute(_maintenance);
  }

  String get _maintenance => '''
    CREATE TABLE IF NOT EXISTS maintenance (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT,
      description TEXT,
      value REAL,
      data INTEGER,
      checked INTEGER
    );
  ''';
}
