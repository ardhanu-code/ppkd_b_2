import 'package:flutter/material.dart';

class TugasLima extends StatefulWidget {
  TugasLima({super.key});

  @override
  State<TugasLima> createState() => _TugasLimaState();
}

class _TugasLimaState extends State<TugasLima> {
  int countLike = 0;
  bool isFavorited = false;
  bool isShowText = false;
  String namaUser = '';
  String deskripsi = '';

  void _addLikeCount() {
    setState(() {
      if (countLike >= 500) {
        countLike = 0;
      } else {
        countLike = countLike + 5;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Instagram',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.telegram, size: 35, color: Colors.white),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: 410,
              width: 400,
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18, top: 12),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 14,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.person, color: Colors.grey),
                        ),
                        SizedBox(width: 8),
                        Text(
                          '$namaUser',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  Center(
                    child: InkWell(
                      onTap: () {
                        print('Kotak disentuh');
                        setState(() {
                          namaUser = '';
                          deskripsi = '';
                          countLike = 0;
                        });
                      },
                      child: Container(
                        height: 200,
                        width: 345,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/me.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isFavorited = !isFavorited;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  isFavorited ? 'Disukai' : 'Batal disukai',
                                ),
                                duration: Duration(seconds: 1),
                              ),
                            );
                          },
                          icon: Icon(
                            isFavorited
                                ? Icons.favorite
                                : Icons.favorite_outline,
                            color:
                                isFavorited ? Colors.redAccent : Colors.white,
                            size: 24,
                          ),
                        ),
                        Text(
                          '$countLike',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Row(
                      children: [
                        Text(
                          '_____ardhanu ',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              deskripsi =
                                  'Menjadi keren adalah sesuatu yang sulit, karna harus jadi aku dulu. hehe.';
                            });
                          },
                          child: Text(
                            'Lihat selengkapnya...',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Text(
                      '$deskripsi',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  namaUser = '_____ardhanu';
                });
              },
              child: Text(
                'Tampilkan Nama',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(350, 50),
                shape: RoundedRectangleBorder(),
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                print('Ditekan sekali');
              },
              onDoubleTap: () {
                print('Ditekan dua kali');
              },
              onLongPress: () {
                print('Tahan lama');
              },
              child: Text('Tekan aku!', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addLikeCount();
        },
        backgroundColor: Colors.white,
        child: Icon(Icons.favorite, color: Colors.black),
      ),
    );
  }
}
