import 'package:flutter/material.dart';
import 'package:ppkd_b_2/meet_12/meet_12_c.dart';
import 'package:ppkd_b_2/tugas_2_flutter/tugas_2_flutter.dart';
import 'package:ppkd_b_2/tugas_3_flutter/tugas_3_flutter.dart';

class MeetDuaBelasB extends StatefulWidget {
  const MeetDuaBelasB({super.key});

  @override
  State<MeetDuaBelasB> createState() => _MeetDuaBelasBState();
}

class _MeetDuaBelasBState extends State<MeetDuaBelasB> {
  int selectedIndex = 0;
  List<Widget> _screen = [MeetDuaBelasC(), TugasDua(), TugasTiga()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        iconSize: 24,
        currentIndex: selectedIndex,
        showSelectedLabels: true,
        selectedItemColor: Colors.teal,
        unselectedFontSize: 12,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
