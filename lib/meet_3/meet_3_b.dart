import 'package:flutter/material.dart';

class MeetTigaB extends StatelessWidget {
  const MeetTigaB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Pertemuan 3',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        //scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: ListTile(
              leading: Image.asset('assets/images/cat.jpg'),
              title: Text('Nama'),
              subtitle: Text('Kocheng Oren'),
              tileColor: Colors.blue[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              onTap: () {
                print('Tile 1');
              },
            ),
          ),
        ],
      ),
    );
  }
}
