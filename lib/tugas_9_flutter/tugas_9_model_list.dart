import 'package:flutter/material.dart';
import 'package:ppkd_b_2/tugas_9_flutter/models/tugas_9_model.dart';

class TugasSembilanModel extends StatefulWidget {
  const TugasSembilanModel({super.key});

  @override
  State<TugasSembilanModel> createState() => _TugasSembilanModelState();
}

class _TugasSembilanModelState extends State<TugasSembilanModel> {
  List<Perabotan> dataPerabotan = [
    Perabotan(
      id: '1',
      namaBarang: 'Sapu Ijuk',
      hargaBarang: '17000',
      imageUrl:
          'https://gratisongkir-storage.com/products/900x900/9GRJB36i0bhj.jpg',
    ),
    Perabotan(
      id: '2',
      namaBarang: 'Kain pel',
      hargaBarang: '19000',
      imageUrl:
          'https://image.mopindo.com/s3/productimages/webp/co2126/p672918/w600-h600/3e7478d0-fab1-4366-9478-d1a5fb0b3b94.png',
    ),
    Perabotan(
      id: '3',
      namaBarang: 'Taplak Meja',
      hargaBarang: '12300',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9GJJbFvLbXOAa3xXdTnFMgTnG8ZYrd57q9A&s',
    ),
    Perabotan(
      id: '4',
      namaBarang: 'Kemoceng',
      hargaBarang: '27000',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRr2gnAld5ewfQ5UBCWGufmtudiU3a727oH9w&s',
    ),
    Perabotan(
      id: '5',
      namaBarang: 'Kucing',
      hargaBarang: '435000',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShXXhXi8tSqF37UM6mMdib-eHb_qb8onTzKA&s',
    ),
    Perabotan(
      id: '6',
      namaBarang: 'Pisau',
      hargaBarang: '25000',
      imageUrl:
          'https://down-id.img.susercontent.com/file/id-11134207-7r990-lwmd3qvq67pme3',
    ),
    Perabotan(
      id: '7',
      namaBarang: 'Sendok',
      hargaBarang: '5000',
      imageUrl:
          'https://down-id.img.susercontent.com/file/08daf9a77dd9657fdd2e7c2bd2f76070',
    ),
    Perabotan(
      id: '8',
      namaBarang: 'Garpu',
      hargaBarang: '5000',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5y44G_aCKU0Zzo0_tivvJm0tuzrtA3_ObXg&s',
    ),
    Perabotan(
      id: '9',
      namaBarang: 'Ember',
      hargaBarang: '16000',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCECr28Mhi5cMUHfBW1EGNu3xbNtKjrsvVrg&s',
    ),
    Perabotan(
      id: '10',
      namaBarang: 'Bak Mandi',
      hargaBarang: '14000',
      imageUrl:
          'https://img.id.my-best.com/product_images/02e7862bd384843ed4f64a8da118d21f.jpeg?ixlib=rails-4.3.1&q=70&lossless=0&w=800&h=800&fit=clip&s=7397dcb3324812248f135da76d7af1c3',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tugas 9 Model'),
        backgroundColor: Colors.greenAccent,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: dataPerabotan.length,
        itemBuilder: (BuildContext context, int index) {
          final perabotan = dataPerabotan[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(perabotan.imageUrl),
            ),
            title: Text('${perabotan.namaBarang}'),
            subtitle: Text('Rp. ${perabotan.hargaBarang}'),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  perabotan.isFavorite = !perabotan.isFavorite;
                });
              },
              icon: Icon(
                perabotan.isFavorite ? Icons.favorite : Icons.favorite_outline,
                color: perabotan.isFavorite ? Colors.red : null,
              ),
            ),
          );
        },
      ),
    );
  }
}
