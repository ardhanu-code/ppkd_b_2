import 'package:flutter/material.dart';

class TugasTiga extends StatefulWidget {
  TugasTiga({super.key});

  @override
  State<TugasTiga> createState() => _TugasTigaState();
}

class _TugasTigaState extends State<TugasTiga> {
  TextEditingController _controllerNama = TextEditingController();

  TextEditingController _controllerEmail = TextEditingController();

  TextEditingController _controllerNoHp = TextEditingController();

  TextEditingController _controllerDeskripsi = TextEditingController();

  // String nama = '';
  // String email = '';
  // String noHp = '';
  // String deskripsi = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tugas Tiga Flutter',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[900],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 435,
              width: double.infinity,
              //color: Colors.blue,
              child: Padding(
                padding: EdgeInsets.all(18),
                child: Column(
                  children: [
                    TextField(
                      controller: _controllerNama,
                      onChanged: (value) {
                        setState(() {
                          _controllerNama.text = value;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Nama',
                        filled: true,
                        fillColor: Colors.blue[50],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    TextField(
                      controller: _controllerEmail,
                      onChanged: (value) {
                        setState(() {
                          _controllerEmail.text = value;
                        });
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.blue[50],
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    TextField(
                      controller: _controllerNoHp,
                      onChanged: (value) {
                        setState(() {
                          _controllerNoHp.text = value;
                        });
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.blue[50],
                        labelText: 'Nomor Hp',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    TextField(
                      controller: _controllerDeskripsi,
                      onChanged: (value) {
                        setState(() {
                          _controllerDeskripsi.text = value;
                        });
                      },
                      maxLines: 2,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.blue[50],
                        labelText: 'Deskripsi',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Nama: ${_controllerNama.text}'),
                                Text('Nomor Hp: ${_controllerNoHp.text}'),
                                Text('Email: ${_controllerEmail.text}'),
                                Text('Deskripsi: ${_controllerDeskripsi.text}'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              'Photos and Videos:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: SizedBox(
                child: GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  crossAxisCount: 3,
                  children: <Widget>[
                    Container(
                      color: Colors.amber,
                      child: Stack(children: [Center(child: Text('Photo 1'))]),
                    ),
                    Container(
                      color: Colors.blue,
                      child: Stack(children: [Center(child: Text('Photo 2'))]),
                    ),
                    Container(
                      color: Colors.redAccent,
                      child: Stack(children: [Center(child: Text('Photo 3'))]),
                    ),
                    Container(
                      color: Colors.redAccent,
                      child: Stack(children: [Center(child: Text('Video 4'))]),
                    ),
                    Container(
                      color: Colors.amber,
                      child: Stack(children: [Center(child: Text('Video 5'))]),
                    ),
                    Container(
                      color: Colors.blue,
                      child: Stack(children: [Center(child: Text('Photo 6'))]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
