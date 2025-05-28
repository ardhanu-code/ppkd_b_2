import 'package:flutter/material.dart';

class TugasTujuhA extends StatefulWidget {
  const TugasTujuhA({super.key});

  @override
  State<TugasTujuhA> createState() => _TugasTujuhAState();
}

class _TugasTujuhAState extends State<TugasTujuhA> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Checkbox(
                activeColor: Colors.blueAccent,
                overlayColor: WidgetStatePropertyAll(Colors.blueAccent),
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
              Text('Saya menyetujui semua persyaratan yang berlaku'),
            ],
          ),
          Text(
            isChecked
                ? 'Lanjutkan pendaftaran diperbolehkan'
                : 'Anda belum bisa melanjutkan',
          ),
        ],
      ),
    );
  }
}
