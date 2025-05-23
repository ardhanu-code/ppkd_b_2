import 'package:flutter/material.dart';

class MeetEmpatA extends StatelessWidget {
  const MeetEmpatA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pertemuan 4',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xff0E2148),
      ),
      body: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            color: index % 2 == 0 ? Colors.amber : Colors.blue,
            child: Text(
              index.toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        },
      ),
    );
  }
}
