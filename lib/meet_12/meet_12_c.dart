import 'package:flutter/material.dart';

class MeetDuaBelasC extends StatefulWidget {
  const MeetDuaBelasC({super.key});

  @override
  State<MeetDuaBelasC> createState() => _MeetDuaBelasCState();
}

class _MeetDuaBelasCState extends State<MeetDuaBelasC> {
  String? isSelected;
  final List<String> _kategori = [
    "Elektronik",
    "Pakaian",
    "Makanan",
    "Lainnya",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Drawer'),
        backgroundColor: Colors.blue[200],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(radius: 35),
                  SizedBox(height: 14),
                  Text(
                    'Dr. Shaun Murphy',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('shaunmurphy@gmail.com', style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
