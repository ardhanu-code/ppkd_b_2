import 'package:flutter/material.dart';

class MeetEmpatBelasA extends StatelessWidget {
  const MeetEmpatBelasA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: () {}, child: Text('List')),
          ElevatedButton(onPressed: () {}, child: Text('List')),
          ElevatedButton(onPressed: () {}, child: Text('List')),
        ],
      ),
    );
  }
}
