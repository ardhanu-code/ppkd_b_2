import 'package:flutter/material.dart';

class TugasSembilanListOfMap extends StatelessWidget {
  TugasSembilanListOfMap({super.key});

  // List<String> kategori = [
  //   'Sapu',
  //   'Kemoceng',
  //   'Kain pel',
  //   'Pisau',
  //   'Sendok',
  //   'Garpu',
  // ];

  List<Map<String, dynamic>> kategori = [
    {'nama': 'Sapu Ijuk', 'icon': Icons.cleaning_services},
    {'nama': 'Serbet Warteg', 'icon': Icons.clean_hands},
    {'nama': 'Pisau', 'icon': Icons.kebab_dining},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tugas 9 List of Map'),
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: kategori.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('${kategori[index]['nama']}'),
            leading: Icon(kategori[index]['icon']),
          );
        },
      ),
    );
  }
}
