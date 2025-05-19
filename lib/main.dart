import 'package:flutter/material.dart';
import 'package:ppkd_b_2/meet_1/meet_1.dart';
import 'package:ppkd_b_2/meet_1/page_iseng.dart';
import 'package:ppkd_b_2/meet_1/tugas_1_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TugasSatu(),
      routes: {'/qr_code': (context) => IsengNih()},
    );
  }
}
