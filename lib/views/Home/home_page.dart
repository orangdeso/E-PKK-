import 'package:e_pkk/views/Laporan/Upload_Gambar/UploadGaleri.dart';
import 'package:e_pkk/views/Laporan/Upload_Laporan/MenuLaporan.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool no_whatsapp = false;

  void _initCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('no_whatsapp') != null) {
      setState(() {
        no_whatsapp = prefs.getBool('no_whatsapp')!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 150,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, PageLaporanMenu.route.toString());
                },
                child: Text("Upload Laporan 2")),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: 150,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, PageGaleri.route.toString());
                },
                child: Text("Upload Gallery")),
          )
        ],
      )),
    );
  }
}
