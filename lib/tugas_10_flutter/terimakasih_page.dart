import 'package:flutter/material.dart';

class Terimakasih extends StatelessWidget {
  final String? nama;
  final String? kota;
  const Terimakasih({super.key, required this.nama, required this.kota});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue),
      body: Center(
        child: Text('Terima kasih, $nama dari $kota telah mendaftar'),
      ),
    );
  }
}
