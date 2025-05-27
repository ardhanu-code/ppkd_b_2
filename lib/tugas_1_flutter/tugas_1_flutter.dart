import 'package:flutter/material.dart';

class TugasSatu extends StatelessWidget {
  const TugasSatu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Saya', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.indigoAccent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Nama: Sakti Ardhanu', style: TextStyle(fontSize: 20)),
          Row(
            children: [
              Icon(Icons.location_on),
              Text('Jakarta', style: TextStyle(fontSize: 18)),
            ],
          ),
          Text(
            'Seorang pelajar tampan yang sedang belajar Flutter dengan teman-teman',
          ),
        ],
      ),
    );
  }
}
