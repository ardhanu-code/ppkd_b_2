import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class MeetTigaC extends StatelessWidget {
  MeetTigaC({super.key});

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
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return Divider();
        },
        physics: BouncingScrollPhysics(),
        itemCount: 50,
        padding: EdgeInsets.all(16),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                'https://i.pravatar.cc/150?img=${faker.randomGenerator.integer(70)}',
              ),
            ),
            title: Text('Nama'),
            subtitle: Text('Bayu ngantuk'),
          );
        },
      ),
    );
  }
}
