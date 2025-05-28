import 'package:flutter/material.dart';
import 'package:ppkd_b_2/meet_1/page_iseng.dart';
import 'package:ppkd_b_2/tugas_7_flutter/tugas_7-8_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TugasTujuh(),
      routes: {'/qr_code': (context) => IsengNih()},
    );
  }
}
