import 'package:path/path.dart';
import 'package:ppkd_b_2/tugas_11_flutter/models/siswa_model.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Future<Database> initDB() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'siswa.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE siswa_baru(id INTEGER PRIMARY KEY AUTOINCREMENT, nama TEXT, umur TEXT, nilai_akhir TEXT, phone TEXT)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insertSiswa(SiswaModelTgs siswa) async {
    final db = await DBHelper.initDB();
    await db.insert(
      'siswa_baru',
      siswa.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<SiswaModelTgs>> getAllSiswa() async {
    final db = await DBHelper.initDB();
    final List<Map<String, dynamic>> listData = await db.query('siswa_baru');

    return List.generate(
      listData.length,
      (index) => SiswaModelTgs.fromMap(listData[index]),
    );
  }
}
