import 'package:e_pkk/views/Laporan/Pokja1/gotong_royong.dart';
import 'package:e_pkk/views/Laporan/Upload%20_Gambar/UploadGaleri.dart';
import 'package:e_pkk/views/Laporan/Upload_Laporan/BidangKelestarianHidup.dart';
import 'package:e_pkk/views/Laporan/Upload_Laporan/BidangKesehatan.dart';
import 'package:e_pkk/views/Laporan/Upload_Laporan/BidangPerencananSehat.dart';
import 'package:e_pkk/views/Laporan/Upload_Laporan/MenuLaporan.dart';
import 'package:e_pkk/views/Login/login_screen.dart';
import 'package:e_pkk/views/Riwayat/page_detail_riwayat.dart';
import 'package:e_pkk/views/Riwayat/riwayat_page.dart';
import 'package:e_pkk/views/Welcome/welcome_screen.dart';
import 'package:e_pkk/views/navbar_view.dart';
import 'package:flutter/material.dart';
import 'package:e_pkk/utils/constants.dart';
//import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  runApp(MainApp());
  // ErrorWidget.builder = (FlutterErrorDetails details) {
  //   bool inDebug = false;
  //   assert(() {
  //     inDebug = true;
  //     return true;
  //   }());
  //   // In debug mode, use the normal error widget which shows
  //   // the error message:
  //   if (inDebug) return ErrorWidget(details.exception);
  //   // In release builds, show a yellow-on-blue message instead:
  //   return Container(
  //     alignment: Alignment.center,
  //     child: Text(
  //       'Error! ${details.exception}',
  //       style: TextStyle(color: Colors.yellow),
  //       textDirection: TextDirection.ltr,
  //     ),
  //   );
  // };
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
      //initialRoute: '/splash',
      routes: {
        //'/splash': (context) => SplashScreen(),
        navbarView.route.toString(): (context) => navbarView(),
        LoginScreen.route.toString(): (context) => LoginScreen(),
        PageLaporanMenu.route.toString(): (context) => PageLaporanMenu(),
        PageBidangKesehatan.route.toString(): (context) =>
            PageBidangKesehatan(),
        PageLingkunganHidup.route.toString(): (context) =>
            PageLingkunganHidup(),
        PageDetailRiwayat.route.toString(): (context) => PageDetailRiwayat(),
        RiwayatPage.route.toString(): (context) => RiwayatPage(),
        PagePerencaanSehat.route.toString(): (context) => PagePerencaanSehat(),
        PageGaleri.route.toString(): (context) => PageGaleri(),
        PageGotongRoyong.route.toString(): (context) => PageGotongRoyong(),
      },
    );
  }
}
