import 'package:flutter/material.dart';

class IsengNih extends StatelessWidget {
  IsengNih({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          'Eh kamu udah bisa kesini aja',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'HAYO KM PASTI NGIRA INI SCAN BARCODE',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
