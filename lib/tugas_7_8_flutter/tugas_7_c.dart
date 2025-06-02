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
          DropdownButtonFormField(
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
          SizedBox(height: 12),
          // Row(
          //   children: [
          //     Text('Anda memilih kategori: '),
          //     Text(isSelected ?? '-'),
          //   ],
          // ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  elevation: 2,
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/me.jpg',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text('Produk ${index + 1}'),
                    subtitle: Text(
                      'Kategori: ${isSelected ?? "Belum dipilih"}',
                    ),
                    trailing: Text('Rp ${(index + 1) * 100000}'),
                    onTap: () {
                      // Aksi ketika item diklik (jika perlu)
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
