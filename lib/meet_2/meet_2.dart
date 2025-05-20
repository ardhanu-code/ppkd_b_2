import 'package:flutter/material.dart';

class MeetDua extends StatelessWidget {
  const MeetDua({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          'Pertemuan 2',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(
            'PPKD B 2',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Kelas Mobile Programming')],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Angkatan 2'),
              SizedBox(width: 20),
              Text('Kereeeen'),
            ],
          ),

          //Penggunaan padding
          Padding(
            padding: const EdgeInsets.all(40),
            child: Row(
              children: [
                Text(
                  'Yanto: Aku akan menguasai dunia dan seisinya, \nkau akan menjadi bawahanku anak sialan. \nlihat saja!',
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Row(
              children: [
                Text(
                  'Azril: Tidak yanto, kau salah.\naku bukan orang yang seperti itu!',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Row(
              children: [
                Text(
                  'Ikbal: AWAS GEROBAK!!!!!!!\n\n(Yanto dan Azril ketabrak gerobak,\nikbal makan bakso.)',
                ),
              ],
            ),
          ),
          Container(
            height: 40,
            width: 250,
            decoration: BoxDecoration(
              color: Colors.amberAccent,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 1.5),
              gradient: LinearGradient(
                colors: [Colors.red, Colors.amber],
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
              ),
            ),
            child: Center(
              child: Text(
                'Ini adalah Container',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          //Expanded
          Row(
            children: [
              Expanded(child: Container(height: 40, color: Colors.red)),
              Spacer(),
              Expanded(child: Container(height: 40, color: Colors.yellow)),
              Expanded(child: Container(height: 40, color: Colors.green)),
            ],
          ),
          Expanded(child: Container(color: Colors.blueGrey)),
        ],
      ),
    );
  }
}
