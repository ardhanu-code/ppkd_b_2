import 'package:flutter/material.dart';
import 'package:ppkd_b_2/tugas_10_flutter/terimakasih_page.dart';

class TugasSepuluh extends StatefulWidget {
  const TugasSepuluh({super.key});

  @override
  State<TugasSepuluh> createState() => _TugasSepuluhState();
}

class _TugasSepuluhState extends State<TugasSepuluh> {
  final _formKey = GlobalKey<FormState>();
  final _namaLengkapController = TextEditingController();
  final _emailController = TextEditingController();
  final _noHpController = TextEditingController();
  final _kotaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tugas Sepuluh'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _namaLengkapController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama harus diisi';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Nama Lengkap',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 14),
              TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email harus diisi';
                  } else if (!value.contains('@')) {
                    return 'Email tidak valid';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 14),
              TextFormField(
                controller: _noHpController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'No. Handphone',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 14),
              TextFormField(
                controller: _kotaController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kota Domisili harus diisi';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Kota Domisili',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Konfirmasi'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Nama: ${_namaLengkapController.text}'),
                              Text('Email: ${_emailController.text}'),
                              Text('No. Hp: ${_noHpController.text}'),
                              Text('Kota Domisili: ${_kotaController.text}'),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => Terimakasih(
                                          nama: _namaLengkapController.text,
                                          kota: _kotaController.text,
                                        ),
                                  ),
                                );
                              },
                              child: Text(
                                'Lanjut',
                                style: TextStyle(color: Colors.indigo),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text('Daftar'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 48),
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
