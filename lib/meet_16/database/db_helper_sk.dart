import 'package:path/path.dart';
import 'package:ppkd_b_2/meet_16/models/siswa_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Future<Database> initDB() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'list_siswa.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE siswa(id INTEGER PRIMARY KEY AUTOINCREMENT, nama TEXT, umur INTEGER)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insertSiswa(SiswaModel siswa) async {
    final db = await DatabaseHelper.initDB();
    await db.insert(
      'siswa',
      siswa.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<SiswaModel>> getAllSiswa() async {
    final db = await DatabaseHelper.initDB();
    final List<Map<String, dynamic>> listData = await db.query('siswa');

    return List.generate(
      listData.length,
      (index) => SiswaModel.fromMap(listData[index]),
    );
  }
}
