import 'package:flutter/material.dart';

class TugasTujuhC extends StatefulWidget {
  const TugasTujuhC({super.key});

  @override
  State<TugasTujuhC> createState() => _TugasTujuhCState();
}

class _TugasTujuhCState extends State<TugasTujuhC> {
  String? isSelected;
  final List<String> _kategori = [
    "Elektronik",
    "Pakaian",
    "Makanan",
    "Lainnya",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DropdownButton(
            value: isSelected,
            hint: Text('Pilih Kategori Produk'),
            items:
                _kategori.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
            onChanged: (value) {
              setState(() {
                isSelected = value;
              });
            },
          ),
          Row(
            children: [
              Text('Anda memilih kategori: '),
              Text(isSelected ?? '-'),
            ],
          ),
        ],
      ),
    );
  }
}
