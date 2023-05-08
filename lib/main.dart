import 'package:e_pkk/views/Laporan/Upload_Laporan/BidangKelestarianHidup.dart';
import 'package:e_pkk/views/Laporan/Upload_Laporan/BidangKesehatan.dart';
import 'package:e_pkk/views/Laporan/Upload_Laporan/MenuLaporan.dart';
import 'package:e_pkk/views/LupaPassword/lupa_password_screen.dart';
import 'package:e_pkk/views/Welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:e_pkk/utils/constants.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'e_pkk',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
      routes: {
        'lupa_password_screen': (context) => const lupaPassword(),
        'welcome_screen': (context) => const WelcomeScreen(),
        PageLaporanMenu.route.toString():(context) => PageLaporanMenu(),
        PageBidangKesehatan.route.toString():(context) => PageBidangKesehatan(),
        PageLingkunganHidup.route.toString():(context) => PageLingkunganHidup()
      },
    );
  }
}