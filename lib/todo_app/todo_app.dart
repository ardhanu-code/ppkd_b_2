import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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
  // Controllers for textfields
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do Apps'),
        backgroundColor: Colors.amber,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Center(
                    child: Container(
                      height: 300,
                      width: 400,
                      margin: EdgeInsets.all(21),
                      decoration: BoxDecoration(
                        color: Colors.amber[200],
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                TextField(
                                  controller: _titleController,
                                  decoration: InputDecoration(
                                    labelText: 'Title',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(height: 12),
                                TextField(
                                  controller: _descriptionController,
                                  decoration: InputDecoration(
                                    labelText: 'Description',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        // Handle cancel action
                                        Navigator.pop(context);
                                      },
                                      child: Text('Cancel'),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        // Handle save action
                                        String title = _titleController.text;
                                        String description =
                                            _descriptionController.text;
                                        print(
                                          "Title: $title, Description: $description",
                                        );

                                        // Optionally, you can add logic to save this data

                                        Navigator.pop(context); // Close dialog
                                      },
                                      child: Text('Save'),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            icon: Icon(Icons.add_task),
          ),
        ],
      ),
      body: Column(
        children: [
          // You can add your list of tasks or content here
        ],
      ),
    );
  }
}
