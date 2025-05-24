import 'package:flutter/material.dart';

class MeetLimaA extends StatefulWidget {
  const MeetLimaA({super.key});

  @override
  State<MeetLimaA> createState() => _MeetLimaAState();
}

class _MeetLimaAState extends State<MeetLimaA> {
  int nilaiTambah = 0;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pertemuan 5A'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  nilaiTambah--;
                });
              },
              child: Text('$nilaiTambah'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                nilaiTambah++;
              });
            },
            icon: Icon(Icons.add),
          ),

          TextButton(
            onPressed: () {
              setState(() {
                if (isLoading == false) {
                  CircularProgressIndicator();
                  isLoading = !isLoading;
                }
              });
            },
            child: Text('Tekan aku!'),
          ),
          InkWell(
            splashColor: Colors.redAccent,
            onTap: () {
              print('Tekan Sekali');
            },
            onLongPress: () {
              print('Tekan Lama');
            },
            onDoubleTap: () {
              print('Tekan Dua Kali');
            },
            child: Image.asset(
              'assets/images/cat.jpg',
              width: 100,
              height: 100,
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              print('FAB ditekan');
            },
            child: Icon(Icons.add),
            tooltip: 'FAB nih ehehe',
          ),
        ],
      ),
    );
  }
}
