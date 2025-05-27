import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Task {
  String title;
  String description;

  Task({required this.title, required this.description});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ToDoApp());
  }
}

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<ToDoApp> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  List<Task> tugas = [];

  void _tambahTugas() {
    if (_titleController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          content: Row(
            children: [
              Icon(Icons.warning, color: Colors.white),
              SizedBox(width: 8),
              Text('Nama dan Deskripsi tidak boleh kosong!'),
            ],
          ),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    setState(() {
      tugas.add(
        Task(
          title: _titleController.text,
          description: _descriptionController.text,
        ),
      );

      _titleController.clear();
      _descriptionController.clear();
    });
  }

  void _hapusTugas(int index) {
    setState(() {
      tugas.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do Apps'),
        backgroundColor: Colors.amber,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Nama Tugas',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Deskripsi Tugas',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _tambahTugas,
              child: Text('Tambahkan Tugas'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 16),
            Divider(thickness: 1.5),
            Expanded(
              child: ListView.builder(
                itemCount: tugas.length,
                itemBuilder: (BuildContext context, int index) {
                  final task = tugas[index];
                  return Column(
                    children: [
                      SizedBox(height: 8),
                      Card(
                        child: ListTile(
                          trailing: IconButton(
                            onPressed: () {
                              _hapusTugas(index);
                            },
                            icon: Icon(Icons.delete),
                          ),
                          title: Text(task.title),
                          subtitle: Text(task.description),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
