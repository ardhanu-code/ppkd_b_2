import 'package:flutter/material.dart';

class TugasDua extends StatefulWidget {
  TugasDua({super.key});

  @override
  State<TugasDua> createState() => _TugasDuaState();
}

class _TugasDuaState extends State<TugasDua> {
  int postingan = 0;
  int followers = 0;

  final String deksripsi =
      'Nama saya adalah Sakti Ardhanu, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting ';

  final String url =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjxHJ3r3qpBUtm_dfdEbG3EyvhG3QhszFHTpEWC7O28yCNiukY5u2bX9s0m5_81Dcob4Q&usqp=CAU";

  void _incrementFollowers() {
    followers = followers + 5;
    if (followers >= 100) {
      followers = 0;
    }
  }

  // void _decrementFollowers() {
  //   followers = followers - 5;
  //   if (followers <= 0) {
  //     followers = 0;
  //   }
  // }

  void _incrementPostingan() {
    postingan = postingan + 5;
    if (postingan >= 100) {
      postingan = 0;
    }
  }

  // void _decrementPostingan() {
  //   postingan = postingan - 5;
  //   if (postingan <= 0) {
  //     postingan = 0;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff222831),
        title: Text(
          'Profil Lengkap',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            CircleAvatar(radius: 80, backgroundImage: NetworkImage(url)),
            SizedBox(height: 20),
            Center(
              child: Text('Sakti Ardhanu', style: TextStyle(fontSize: 24)),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xff393E46),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.email, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        'saktiardhanu2nd@gmail.com',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              width: 350,
              decoration: BoxDecoration(
                color: Color(0xff393E46),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 20),
                child: Row(
                  children: [
                    Icon(Icons.phone, color: Colors.white),
                    Spacer(),
                    Text(
                      '0813-1503-6537',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 32),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(14),
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Color(0xffDFD0B8),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Postingan: $postingan',
                      style: TextStyle(fontSize: 16, color: Color(0xff222831)),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Color(0xffDFD0B8),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    height: 50,
                    width: 100,
                    child: Text(
                      'Followers: $followers',
                      style: TextStyle(fontSize: 16, color: Color(0xff222831)),
                    ),
                  ),
                ),
                SizedBox(width: 30),
              ],
            ),
            SizedBox(
              height: 120,
              width: 400,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Text(deksripsi, textAlign: TextAlign.justify),
                ),
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
                      child: Row(
                        children: [
                          SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _incrementPostingan();
                              });
                            },
                            child: Text(
                              'Tambah Postingan',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff948979),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      width: 350,
                      child: Row(
                        children: [
                          SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _incrementFollowers();
                              });
                            },
                            child: Text(
                              'Tambah Followers',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff948979),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
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
      ),
    );
  }
}
