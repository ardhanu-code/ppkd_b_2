import 'package:flutter/material.dart';
import 'package:ppkd_b_2/constant/text.dart' as loremIpsum;

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Syarat & Ketentuan',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 6),
            Container(
              height: 350,
              width: double.infinity,
              // color: Colors.blue,
              child: SingleChildScrollView(
                child: loremIpsum.LoremIpsum.sampleText,
              ),
            ),
            SizedBox(height: 16),
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
                Text(
                  'Saya menyetujui semua persyaratan yang berlaku',
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: isChecked ? () {} : null,
              child: Text(
                isChecked
                    ? 'Lanjutkan pendaftaran diperbolehkan'
                    : 'Anda belum bisa melanjutkan',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: Size(double.infinity, 45),
              ),
            ),
            // Text(
            //   isChecked
            //       ? 'Lanjutkan pendaftaran diperbolehkan'
            //       : 'Anda belum bisa melanjutkan',
            // ),
          ],
        ),
      ),
    );
  }
}
