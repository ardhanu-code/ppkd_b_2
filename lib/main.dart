import 'package:flutter/material.dart';
import 'package:ppkd_b_2/meet_16/login_screen.dart';
import 'package:ppkd_b_2/tugas_14_flutter/pages/tugas_14_home.dart';
import 'package:ppkd_b_2/tugas_6_flutter/tugas_6_flutter.dart';
import 'package:ppkd_b_2/tugas_7_8_flutter/tugas_7-8_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white,  ),
      ),
      debugShowCheckedModeBanner: false,
      home: TugasEmpatBelas(),
      routes: {
        //'/qr_code': (context) => IsengNih(),
        '/login': (context) => TugasEnam(),
        '/home_screen': (context) => TugasTujuh(),
        LoginScreen.id: (context) => LoginScreen(),
      },
    );
  }
}
