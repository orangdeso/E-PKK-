import 'package:e_pkk/login_view.dart';
import 'package:e_pkk/views/Laporan/Upload_Laporan/BidangKelestarianHidup.dart';
import 'package:e_pkk/views/Laporan/Upload_Laporan/BidangKesehatan.dart';
import 'package:e_pkk/views/Laporan/Upload_Laporan/BidangPerencananSehat.dart';
import 'package:e_pkk/views/Laporan/Upload_Laporan/MenuLaporan.dart';
import 'package:e_pkk/views/Login/login_screen.dart';
import 'package:e_pkk/views/LupaPassword/lupa_password_screen.dart';
import 'package:e_pkk/views/Riwayat/page_detail_riwayat.dart';

import 'package:e_pkk/views/Riwayat/riwayat_page.dart';
import 'package:e_pkk/views/Welcome/welcome_screen.dart';
import 'package:e_pkk/views/navbar_view.dart';
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
      home: LoginScreen(),
      routes: {
        // 'lupa_password_screen': (context) => const lupaPassword(),
        // 'welcome_screen': (context) => const WelcomeScreen(),
        navbarView.route.toString(): (context) => navbarView(),
        LoginScreen.route.toString(): (context) => LoginScreen(),
        PageLaporanMenu.route.toString(): (context) => PageLaporanMenu(),
        PageBidangKesehatan.route.toString(): (context) =>
            PageBidangKesehatan(),
        PageLingkunganHidup.route.toString(): (context) =>
            PageLingkunganHidup(),
        PageDetailRiwayat.route.toString(): (context) => PageDetailRiwayat(),
        RiwayatPage.route.toString(): (context) => RiwayatPage(),
        PagePerencaanSehat.route.toString(): (context) => PagePerencaanSehat()
      },
    );
  }
}
