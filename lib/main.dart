import 'package:flutter/material.dart';
import 'package:ppkd_b_2/meet_26/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'PPKD B-2 App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
          ),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: LoginPage());
  }
}
