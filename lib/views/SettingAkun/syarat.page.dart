import 'package:e_pkk/utils/constants.dart';
import 'package:flutter/material.dart';

class SyaratKetentuanPage extends StatelessWidget {
  const SyaratKetentuanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Syarat dan Ketentuan'),
        backgroundColor: ktextColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/syarat.jpg', // Ganti dengan path gambar Anda
            width: 200,
            height: 200,
          ),
          SizedBox(height: 20),
          Text(
            'Syarat dan Ketentuan Aplikasi E-PKK',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 10),
          Container( margin: EdgeInsets.all(15),
            child: Text(
              '1. Aplikasi ini dikhususkan untuk kader pkk tingkat kecamatan ',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ),
          Container( margin: EdgeInsets.all(15),
            child: Text(
              '2. Aplikasi ini berfungsi untuk mengunggah bidang laporan pokja 4 dan unggah galeri kegiatan',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ),
          Container( margin: EdgeInsets.all(15),
            child: Text(
              '3. Segala hal terkait informasi pengguna dalam aplikasi bersifat krusial, sehingga koreksi lebih lanjut agar mendapatkan pelayanan optimal',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
   
  }
}