import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SiswaModelTgs {
  int? id;
  String nama;
  String umur;
  String nilai_akhir;
  String phone;

  SiswaModelTgs({
    this.id,
    required this.nama,
    required this.umur,
    required this.nilai_akhir,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nama': nama,
      'umur': umur,
      'nilai_akhir': nilai_akhir,
      'phone': phone,
    };
  }

  factory SiswaModelTgs.fromMap(Map<String, dynamic> map) {
    return SiswaModelTgs(
      id: map['id'] != null ? map['id'] as int : null,
      nama: map['nama'] as String,
      umur: map['umur'] as String,
      nilai_akhir: map['nilai_akhir'] as String,
      phone: map['phone'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SiswaModelTgs.fromJson(String source) =>
      SiswaModelTgs.fromMap(json.decode(source) as Map<String, dynamic>);
}
