import 'package:flutter/material.dart';
import 'package:ppkd_b_2/meet_1/page_iseng.dart';
import 'package:ppkd_b_2/tugas_9_flutter/home_tugas_9.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TugasSembilan(),
      routes: {'/qr_code': (context) => IsengNih()},
    );
  }
}
