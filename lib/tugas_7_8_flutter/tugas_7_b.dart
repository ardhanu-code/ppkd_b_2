import 'package:flutter/material.dart';

class TugasTujuhB extends StatefulWidget {
  const TugasTujuhB({super.key});

  @override
  State<TugasTujuhB> createState() => _TugasTujuhBState();
}

class _TugasTujuhBState extends State<TugasTujuhB> {
  bool isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isSwitchOn ? Colors.black : Colors.white,
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Switch(
                  
                  activeTrackColor: Colors.blueAccent,
                  value: isSwitchOn,
                  onChanged: (value) {
                    setState(() {
                      isSwitchOn = value;
                    });
                  },
                ),
                SizedBox(width: 8),
                Text(
                  'Aktifkan mode gelap',
                  style: TextStyle(
                    fontSize: 18,
                    color: isSwitchOn ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
            Text(
              isSwitchOn ? 'Mode Gelap Aktif' : 'Mode Terang Aktif',
              style: TextStyle(color: isSwitchOn ? Colors.white : Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
