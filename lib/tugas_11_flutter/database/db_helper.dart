import 'package:path/path.dart';
import 'package:ppkd_b_2/tugas_11_flutter/models/siswa_model.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static const String table = 'siswa_baru';
  static const String columnId = 'id'; // ✅ aman
  static const String nama = 'nama';
  static const String umur = 'umur';
  static const String nilai_akhir = 'nilai_akhir';
  static const String phone = 'phone';

  static Future<Database> initDB() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'siswa.db'),
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE $table(
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT, 
            $nama TEXT, 
            $umur TEXT, 
            $nilai_akhir TEXT, 
            $phone TEXT)
        ''');
      },
      version: 1,
    );
  }

  static Future<void> insertSiswa(SiswaModelTgs siswa) async {
    final db = await DBHelper.initDB();
    await db.insert(
      table,
      siswa.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<SiswaModelTgs>> getAllSiswa() async {
    final db = await DBHelper.initDB();
    final List<Map<String, dynamic>> listData = await db.query(table);
    return List.generate(
      listData.length,
      (index) => SiswaModelTgs.fromMap(listData[index]),
    );
  }

  static Future<void> deleteSiswa(int id) async {
    final db = await DBHelper.initDB();
    await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
    print('Menghapus siswa dengan ID: $id');
  }

  static Future<void> updateSiswa(SiswaModelTgs siswa) async {
    final db = await DBHelper.initDB();
    await db.update(
      table,
      siswa.toMap(),
      where: '$columnId = ?',
      whereArgs: [siswa.id],
    );
  }
}
