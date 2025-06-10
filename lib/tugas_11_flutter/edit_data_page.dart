import 'package:flutter/material.dart';
import 'package:ppkd_b_2/tugas_11_flutter/database/db_helper.dart';
import 'package:ppkd_b_2/tugas_11_flutter/models/siswa_model.dart';

class EditDataPage extends StatefulWidget {
  final SiswaModelTgs siswa;
  const EditDataPage({required this.siswa});

  @override
  State<EditDataPage> createState() => _EditDataPageState();
}

class _EditDataPageState extends State<EditDataPage> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _umurController = TextEditingController();
  final TextEditingController _nilaiController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _namaController.text = widget.siswa.nama;
    _umurController.text = widget.siswa.umur;
    _nilaiController.text = widget.siswa.nilai_akhir;
    _phoneController.text = widget.siswa.phone;
  }

  void updateData() async {
    final updated = SiswaModelTgs(
      id: widget.siswa.id,
      nama: _namaController.text,
      umur: _umurController.text,
      nilai_akhir: _nilaiController.text,
      phone: _phoneController.text,
    );
    await DBHelper.updateSiswa(updated);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Data Siswa',
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
              'Form Edit Data',
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
                        updateData();
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
          ],
        ),
      ),
    );
  }
}
