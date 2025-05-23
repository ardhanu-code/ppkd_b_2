import 'package:flutter/material.dart';

class TugasEmpat extends StatefulWidget {
  const TugasEmpat({super.key});

  @override
  State<TugasEmpat> createState() => _TugasEmpatState();
}

class _TugasEmpatState extends State<TugasEmpat> {
  TextEditingController _controllerNama = TextEditingController();

  TextEditingController _controllerEmail = TextEditingController();

  TextEditingController _controllerNoHp = TextEditingController();

  TextEditingController _controllerDeskripsi = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tugas Empat Flutter',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[900],
      ),
      body: ListView(
        children: [
          Container(
            height: 460,
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
                    maxLength: 35,
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Product Cart:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                Card(
                  elevation: 4,
                  child: ListTile(
                    leading: Image.asset('assets/images/headset.jpg'),
                    shape: CircleBorder(),
                    title: Text('Headset Gaming'),
                    subtitle: Text('Rp. 470.000'),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Card(
                  elevation: 4,
                  child: ListTile(
                    leading: Image.asset('assets/images/keyboard.jpg'),
                    shape: CircleBorder(),
                    title: Text('Keyboard Gaming'),
                    subtitle: Text('Rp. 842.000'),
                    trailing: Icon(Icons.delete),
                  ),
                ),
                SizedBox(height: 12),
                Card(
                  elevation: 4,
                  child: ListTile(
                    leading: Image.asset('assets/images/monitor.jpg'),
                    shape: CircleBorder(),
                    title: Text('Monitor 24" 144Hz'),
                    subtitle: Text('Rp. 1.999.000'),
                    trailing: Icon(Icons.delete),
                  ),
                ),
                SizedBox(height: 12),
                Card(
                  elevation: 4,
                  child: ListTile(
                    leading: Image.asset('assets/images/mouse.jpg'),
                    shape: CircleBorder(),
                    title: Text('Mouse Gaming'),
                    subtitle: Text('Rp. 972.000'),
                    trailing: Icon(Icons.delete),
                  ),
                ),
                SizedBox(height: 12),
                Card(
                  elevation: 4,
                  child: ListTile(
                    leading: Image.asset('assets/images/cpu.jpg'),
                    shape: CircleBorder(),
                    title: Text('CPU'),
                    subtitle: Text('Rp. 5.750.000'),
                    trailing: Icon(Icons.delete),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
