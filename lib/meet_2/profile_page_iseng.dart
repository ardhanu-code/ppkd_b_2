import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Whatsapp Profile', style: TextStyle(color: Colors.white)),
        leading: Icon(Icons.arrow_back, color: Colors.white),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            //color: Colors.blue,
            child: Center(
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Colors.grey[300],
                child: Icon(Icons.person, size: 120, color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.person_2_outlined),
                  title: Text('Name'),
                  subtitle: Text(
                    'Sakti Ardhanu',
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.info_outline),
                  title: Text('About'),
                  subtitle: Text(
                    'emergency calls only',
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.call_outlined),
                  title: Text('Phone'),
                  subtitle: Text(
                    '0813-1503-6537',
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.link_outlined),
                  title: Text('Links'),
                  subtitle: Text.rich(
                    TextSpan(
                      text: 'Add links',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    '® Copyright ardhanu 2025',
                    style: TextStyle(color: Colors.grey[500]),
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
