import 'package:e_pkk/utils/constants.dart';
import 'package:flutter/material.dart';

class TentangKamiPage extends StatefulWidget {
  const TentangKamiPage({super.key});

  @override
  State<TentangKamiPage> createState() => _TentangKamiPageState();
}

class _TentangKamiPageState extends State<TentangKamiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tentang Kami"),
          centerTitle: true,
          backgroundColor: ktextColor,
        ),
        body: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/tentangkami.jpg', // Ganti dengan path gambar Anda
                    width: 200,
                    height: 200,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Selamat datang di Aplikasi E-PKK!',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Aplikasi E-PKK adalah layanan untuk mengnggah laporan pkk khusunya pokja 4 dan unggah galeri di PKK Kabupaten Nganjuk. Aplikasi ini dikembangkan oleh kelompok A4 dan B1 untuk memenuhi tugas project akhir',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
