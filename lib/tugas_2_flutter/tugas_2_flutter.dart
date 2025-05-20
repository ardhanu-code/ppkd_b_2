import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TugasDua extends StatelessWidget {
  TugasDua({super.key});

  String deksripsi =
      'Nama saya adalah Sakti Ardhanu, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting ';

  String url =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjxHJ3r3qpBUtm_dfdEbG3EyvhG3QhszFHTpEWC7O28yCNiukY5u2bX9s0m5_81Dcob4Q&usqp=CAU";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          'Profil Lengkap',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          CircleAvatar(radius: 80, backgroundImage: NetworkImage(url)),
          SizedBox(height: 20),
          Center(child: Text('Sakti Ardhanu', style: TextStyle(fontSize: 24))),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.amber,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.email),
                    SizedBox(width: 8),
                    Text('saktiardhanu2nd@gmail.com'),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Row(
              children: [Icon(Icons.phone), Spacer(), Text('0813-1503-6537')],
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(14),
                  height: 50,
                  width: 100,
                  color: Colors.blue,
                  child: Text(
                    'Postingan',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(14),
                  height: 50,
                  width: 100,
                  color: Colors.redAccent,
                  child: Text(
                    'Followers',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 150,
            width: 400,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(deksripsi, textAlign: TextAlign.justify),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    width: 350,
                    decoration: BoxDecoration(color: Colors.indigo),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.instagram,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        Text(
                          '@______ardhanu',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    width: 350,
                    decoration: BoxDecoration(color: Colors.blueAccent),
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Icon(Icons.location_on, color: Colors.white, size: 18),
                        SizedBox(width: 8),
                        Text(
                          'Jakarta Pusat',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
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
