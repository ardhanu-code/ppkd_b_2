import 'package:flutter/material.dart';
import 'package:ppkd_b_2/tugas_7_flutter/tugas_7_a.dart';
import 'package:ppkd_b_2/tugas_7_flutter/tugas_7_b.dart';
import 'package:ppkd_b_2/tugas_7_flutter/tugas_7_c.dart';
import 'package:ppkd_b_2/tugas_7_flutter/tugas_7_d.dart';
import 'package:ppkd_b_2/tugas_7_flutter/tugas_7_e.dart';

class TugasTujuh extends StatefulWidget {
  const TugasTujuh({super.key});

  @override
  State<TugasTujuh> createState() => _TugasTujuhState();
}

class _TugasTujuhState extends State<TugasTujuh> {
  int _bottomNavIndex = 0;
  int _selectedDrawerIndex = 0;

  final List<Widget> drawerScreens = [
    TugasTujuhA(),
    TugasTujuhB(),
    TugasTujuhC(),
    TugasTujuhD(),
    TugasTujuhE(),
  ];

  final aboutScreen = const Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tentang Aplikasi',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        Text('Aplikasi ini dibuat sebagai latihan pengembangan UI di Flutter.'),
        SizedBox(height: 8),
        Text('Nama Pembuat: Shaun Murphy'),
        Text('Versi: 1.0.0'),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    final isHomeTab = _bottomNavIndex == 0;
    final screenContent =
        isHomeTab ? drawerScreens[_selectedDrawerIndex] : aboutScreen;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _bottomNavIndex == 0 ? 'Tugas 7' : 'About',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      drawer:
          isHomeTab
              ? Drawer(
                child: ListView(
                  children: [
                    const DrawerHeader(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage('assets/images/me.jpg'),
                          ),
                          SizedBox(height: 14),
                          Text(
                            'Dr. Shaun Murphy',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'shaunmurphy@gmail.com',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.info_outline),
                      title: const Text('Syarat & Ketentuan'),
                      onTap: () {
                        setState(() => _selectedDrawerIndex = 0);
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.dark_mode_outlined),
                      title: const Text('Mode Gelap'),
                      onTap: () {
                        setState(() => _selectedDrawerIndex = 1);
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.shop_2_outlined),
                      title: const Text('Pilih Kategori Produk'),
                      onTap: () {
                        setState(() => _selectedDrawerIndex = 2);
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.date_range_outlined),
                      title: const Text('Pilih Tanggal Lahir'),
                      onTap: () {
                        setState(() => _selectedDrawerIndex = 3);
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.timer_outlined),
                      title: const Text('Atur Pengingat'),
                      onTap: () {
                        setState(() => _selectedDrawerIndex = 4);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              )
              : null,
      body: Padding(padding: const EdgeInsets.all(12.0), child: screenContent),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        onTap: (index) {
          setState(() => _bottomNavIndex = index);
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'Tentang Aplikasi',
          ),
        ],
      ),
    );
  }
}
