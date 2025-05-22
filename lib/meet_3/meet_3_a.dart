import 'package:flutter/material.dart';

void main() {
  runApp(MeetTigaA());
}

class MeetTigaA extends StatelessWidget {
  const MeetTigaA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Pertemuan 3',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                buildStack(),
                buildStack(),
                buildStack(),
                buildStack(),
                buildStack(),
                buildStack(),
                buildStack(),
                buildStack(),
                buildStack(),
                buildStack(),
                buildStack(),
                buildStack(),
                buildStack(),
                buildStack(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Stack buildStack() {
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(color: Colors.red),
      ),
      Container(
        height: 90,
        width: 90,
        decoration: BoxDecoration(color: Colors.amber),
      ),
      Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(color: Colors.green),
      ),
      Text('Horizontal'),
    ],
  );
}
