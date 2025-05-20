import 'package:flutter/material.dart';

class MeetDuaA extends StatelessWidget {
  const MeetDuaA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          'Pertemuan 2A',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        height: 500,
        child: Column(
          children: [
            Text('Column'),
            Spacer(),
            Text('Column'),
            Spacer(),
            Text('Column'),
            SizedBox(height: 16),
            Row(
              children: [
                Text('PPKD'),
                Spacer(),
                Text('PPKD'),
                Spacer(),
                Text('PPKD'),
              ],
            ),
            Container(height: 200, width: 200, color: Colors.amber),
          ],
        ),
      ),
    );
  }
}
