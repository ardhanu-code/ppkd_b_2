import 'package:flutter/material.dart';
import 'package:ppkd_b_2/tugas_11_flutter/database/db_helper.dart';
import 'package:ppkd_b_2/tugas_11_flutter/models/siswa_model.dart';

class TugasBerapaYa extends StatefulWidget {
  const TugasBerapaYa({super.key});

  @override
  State<TugasBerapaYa> createState() => _TugasBerapaYaState();
}

class _TugasBerapaYaState extends State<TugasBerapaYa> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _umurController = TextEditingController();
  final TextEditingController _nilaiController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  List<SiswaModelTgs> daftarSiswa = [];

  @override
  void initState() {
    muatData();
    super.initState();
  }

  Future<void> muatData() async {
    final data = await DBHelper.getAllSiswa();
    setState(() {
      daftarSiswa = data;
    });
  }

  Future<void> simpanData() async {
    final nama = _namaController.text;
    final umur = _umurController.text;
    final nilai = _nilaiController.text;
    final phone = _phoneController.text;

    if (nama.isNotEmpty) {
      await DBHelper.insertSiswa(
        SiswaModelTgs(nama: nama, umur: umur, nilai_akhir: nilai, phone: phone),
      );
      _namaController.clear();
      _umurController.clear();
      _nilaiController.clear();
      _phoneController.clear();
      muatData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pendataan Siswa Baru',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Form Pendataan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    validator:
                        (value) =>
                            (value == null || value.isEmpty)
                                ? 'Wajib harus diisi'
                                : null,
                    controller: _namaController,
                    decoration: InputDecoration(
                      labelText: 'Nama',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    validator:
                        (value) =>
                            (value == null || value.isEmpty)
                                ? 'Wajib harus diisi'
                                : null,
                    controller: _umurController,
                    decoration: InputDecoration(
                      labelText: 'Umur',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    validator:
                        (value) =>
                            (value == null || value.isEmpty)
                                ? 'Wajib harus diisi'
                                : null,
                    controller: _nilaiController,
                    decoration: InputDecoration(
                      labelText: 'Nilai Akhir',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    validator:
                        (value) =>
                            (value == null || value.isEmpty)
                                ? 'Wajib harus diisi'
                                : null,
                    controller: _phoneController,
                    decoration: InputDecoration(
                      labelText: 'No. Handphone',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        simpanData();
                      }
                    },
                    child: Text('Simpan'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 45),
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  Divider(height: 38),
                ],
              ),
            ),
            Text(
              'Daftar Siswa',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                //physics: NeverScrollableScrollPhysics(),
                itemCount: daftarSiswa.length,
                itemBuilder: (BuildContext context, int index) {
                  final siswa = daftarSiswa[index];
                  return Card(
                    child: ListTile(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder:
                              (context) => AlertDialog(
                                title: Text('Details'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Nama: ${siswa.nama}'),
                                    Text('Umur: ${siswa.umur}'),
                                    Text('Nilai Akhir: ${siswa.nilai_akhir}'),
                                    Text('Phone: ${siswa.phone}'),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Tutup'),
                                  ),
                                ],
                              ),
                        );
                      },
                      leading: CircleAvatar(child: Text('${siswa.id}')),
                      title: Text(
                        '${siswa.nama}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text('Umur: ${siswa.umur}')],
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.delete),
                      ),
                    ),
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
