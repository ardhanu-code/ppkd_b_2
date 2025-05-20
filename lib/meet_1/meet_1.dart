import 'package:flutter/material.dart';

class MeetSatu extends StatelessWidget {
  const MeetSatu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          'Pertemuan 1',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              SizedBox(height: 30),
              CircleAvatar(
                maxRadius: 80,
                backgroundColor: Colors.grey[300],
                child: Icon(Icons.person, size: 80, color: Colors.grey),
              ),
              SizedBox(height: 20),
              ListTile(
                title: Text(
                  'Nama Lengkap',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Sakti Ardhanu'),
                leading: Icon(Icons.person),
              ),
              ListTile(
                title: Text(
                  'Kelas',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Mobile Programming'),
                leading: Icon(Icons.book),
              ),
              ListTile(
                title: Text(
                  'Instruktur',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Andrea Surya Habibie'),
                leading: Icon(Icons.person_4),
              ),
              ListTile(
                title: Text(
                  'Tempat tinggal',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Jakarta Pusat'),
                leading: Icon(Icons.location_city),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Pertemuan 1',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            'PPKD B 2',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          Text(
            'Kelas Mobile Programming',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
          ),
          Text(
            'Nama Toko',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Gambar 1',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text('Gambar 2')],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Text('Gambar 3')],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text('Gambar 4')],
          ),
          Text.rich(
            TextSpan(
              text: 'Toko saya bernama ',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: '@afuk_store',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          Text('Gambar 6'),
          Text(
            'Gambar 1 Gambar 2 Gambar 3 Gambar 4 Gambar 5 Gambar 6 Gambar 1 Gambar 2 Gambar 3 Gambar 4 Gambar 5 Gambar 6 Gambar 1 Gambar 2 Gambar 3 Gambar 4 Gambar 5 Gambar 6',
            maxLines: 2,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.email),
              Text.rich(
                TextSpan(
                  text: 'Email: ',
                  children: [
                    TextSpan(
                      text: 'apayainiemailny@gmail.com',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/qr_code');
        },
        child: Icon(Icons.qr_code_rounded),
        backgroundColor: Colors.amber,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
