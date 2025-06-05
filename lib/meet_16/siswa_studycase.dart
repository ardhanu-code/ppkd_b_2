import 'package:flutter/material.dart';
import 'package:ppkd_b_2/meet_16/database/db_helper_sk.dart';
import 'package:ppkd_b_2/meet_16/models/siswa_model.dart';

class SiswaApp extends StatefulWidget {
  const SiswaApp({super.key});

  @override
  State<SiswaApp> createState() => _SiswaAppState();
}

class _SiswaAppState extends State<SiswaApp> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _umurController = TextEditingController();

  List<SiswaModel> daftarSiswa = [];

  @override
  void initState() {
    muatData();
    super.initState();
  }

  Future<void> muatData() async {
    final data = await DatabaseHelper.getAllSiswa();
    setState(() {
      daftarSiswa = data;
    });
  }

  Future<void> simpanData() async {
    final nama = _namaController.text;
    final umur = int.tryParse(_umurController.text) ?? 0;

    if (nama.isNotEmpty && umur > 0) {
      await DatabaseHelper.insertSiswa(SiswaModel(nama: nama, umur: umur));
      _namaController.clear();
      _umurController.clear();
      muatData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Siswa App'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _namaController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _umurController,
              decoration: InputDecoration(labelText: 'Umur'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                simpanData();
              },
              child: Text('Simpan'),
            ),
            Divider(height: 32),
            Expanded(
              child: ListView.builder(
                itemCount: daftarSiswa.length,
                itemBuilder: (BuildContext context, int index) {
                  final siswa = daftarSiswa[index];
                  return ListTile(
                    leading: CircleAvatar(child: Text('${siswa.id}')),
                    title: Text('${siswa.nama}'),
                    subtitle: Text('Umur: ${siswa.umur}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
