import 'package:e_pkk/utils/constants.dart';
import 'package:flutter/material.dart';

class HubungiKamiPage extends StatefulWidget {
  const HubungiKamiPage({super.key});

  @override
  State<HubungiKamiPage> createState() => _HubungiKamiPageState();
}

class _HubungiKamiPageState extends State<HubungiKamiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hubungi Kami"),
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
                  'assets/images/Hubungi kami.jpg', // Ganti dengan path gambar Anda
                  width: 200,
                  height: 200,
                ),
                SizedBox(height: 20),
                Text(
                  'Hubungi Kami Mealui nomor ini!',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  ' +62 821-4256-8403',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
