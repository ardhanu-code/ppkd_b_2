import 'package:flutter/material.dart';

void main() {
  runApp(MeetEmpatB());
}

class MeetEmpatB extends StatefulWidget {
  MeetEmpatB({super.key});

  @override
  State<MeetEmpatB> createState() => _MeetEmpatBState();
}

class _MeetEmpatBState extends State<MeetEmpatB> {
  TextEditingController _controllerNama = TextEditingController();
  final String text = '';

  void cetakNama() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pertemuan 4 B'),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text('Textfield Widget'),
                SizedBox(height: 16),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      _controllerNama.text = value;
                    });
                  },
                  maxLines: 1,
                  maxLength: 16,
                  keyboardType: TextInputType.text,
                  controller: _controllerNama,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.blue, width: 5),
                    ),
                    hintText: 'Masukkan nama',
                    hintStyle: TextStyle(fontSize: 16),
                    filled: true,
                    fillColor: Colors.amber[200],
                  ),
                ),
                SizedBox(height: 24),
                TextField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.visibility),
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.blue, width: 5),
                    ),
                    hintText: 'Masukkan password',
                    hintStyle: TextStyle(fontSize: 16),
                    filled: true,
                    fillColor: Colors.amber[200],
                  ),
                ),
                SizedBox(height: 16),
                // ElevatedButton(
                //   onPressed: () {
                //     print(_controllerNama);
                //   },
                //   child: Text('Print'),
                // ),
                Text(_controllerNama.text),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
