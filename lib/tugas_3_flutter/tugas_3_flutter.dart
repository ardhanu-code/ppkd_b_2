import 'package:faker/faker.dart';
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
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
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
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://i.pravatar.cc/150?img=${faker.randomGenerator.integer(70)}',
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              width: 15,
                              height: 15,
                              color: Colors.white,
                              child: Center(
                                child: Text(
                                  '1',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://i.pravatar.cc/150?img=${faker.randomGenerator.integer(70)}',
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              width: 15,
                              height: 15,
                              color: Colors.white,
                              child: Center(
                                child: Text(
                                  '2',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://i.pravatar.cc/150?img=${faker.randomGenerator.integer(70)}',
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              width: 15,
                              height: 15,
                              color: Colors.white,
                              child: Center(
                                child: Text(
                                  '3',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://i.pravatar.cc/150?img=${faker.randomGenerator.integer(70)}',
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              width: 15,
                              height: 15,
                              color: Colors.white,
                              child: Center(
                                child: Text(
                                  '4',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://i.pravatar.cc/150?img=${faker.randomGenerator.integer(70)}',
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              width: 15,
                              height: 15,
                              color: Colors.white,
                              child: Center(
                                child: Text(
                                  '5',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://i.pravatar.cc/150?img=${faker.randomGenerator.integer(70)}',
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              width: 15,
                              height: 15,
                              color: Colors.white,
                              child: Center(
                                child: Text(
                                  '6',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
