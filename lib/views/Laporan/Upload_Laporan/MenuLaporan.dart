import 'package:e_pkk/utils/constants.dart';
import 'package:e_pkk/views/Laporan/Laporan%20Umum/laporan_umum.dart';
import 'package:e_pkk/views/Laporan/Pokja1/gotong_royong.dart';
import 'package:e_pkk/views/Laporan/Pokja1/kader_pokja1.dart';
import 'package:e_pkk/views/Laporan/Pokja1/penghayatan_pancasila.dart';
import 'package:e_pkk/views/Laporan/Pokja2/pendidikan_ketrampilan.dart';
import 'package:e_pkk/views/Laporan/Pokja2/pengembangan_kehidupan.dart';
import 'package:e_pkk/views/Laporan/Pokja3/kader_pokja3.dart';
import 'package:e_pkk/views/Laporan/Pokja3/pangan.dart';
import 'package:e_pkk/views/Laporan/Pokja3/perumahan.dart';
import 'package:e_pkk/views/Laporan/Pokja3/sandang.dart';
import 'package:e_pkk/views/Laporan/Upload_Laporan/kader_pokja4.dart';
import 'package:flutter/material.dart';
import 'BidangKelestarianHidup.dart';
import 'BidangKesehatan.dart';
import 'BidangPerencananSehat.dart';

class PageLaporanMenu extends StatefulWidget {
  static String route = '/laporanUtama';
  @override
  State<PageLaporanMenu> createState() => _PageLaporanMenuState();
}

class _PageLaporanMenuState extends State<PageLaporanMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 244, 244),
      appBar: AppBar(
        title: Text(
          "Upload Laporan",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: BackButton(
          color: grey800,
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 54, 151, 186),
                        Color.fromARGB(255, 149, 210, 232)
                      ],
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 25,
                      left: 15,
                      right: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Pokja I - IV",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 28,
                                fontFamily: 'Times New Roman',
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Container(
                                width: 170,
                                child: Text(
                                  "Pilih button sesuai dengan program kerja yang ingin di lakukan upload laporan",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Text(
                                  "Pelajari Selengkapnya",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 58, 153, 188),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 100,
                          height: 200,
                          child: Image(
                            image: AssetImage("assets/images/ketua_pkk1.png"),
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ExpansionTile(
                    title: Text(
                      "Pokja I",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        "Silahkan pilih program kerja",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    tilePadding: EdgeInsets.symmetric(horizontal: 20),
                    collapsedBackgroundColor: whiteColor,
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: whiteColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        width: 1,
                        color: Color.fromARGB(106, 172, 172, 172),
                      ),
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 30,
                          bottom: 20,
                          top: 5,
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                right: 20,
                                top: 5,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(250, 255, 201, 178),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 20,
                                    offset: Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return PageKaderPokja1();
                                        },
                                      ),
                                    );
                                  },
                                  splashColor: grey300,
                                  borderRadius: BorderRadius.circular(10),
                                  child: Align(
                                    alignment: FractionalOffset.centerLeft,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 5,
                                      ),
                                      child: ListTile(
                                        leading: Image.asset(
                                          "assets/images/teamwork.png",
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.cover,
                                        ),
                                        title: Text(
                                          "Kader Pokja I",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        subtitle: Padding(
                                          padding: EdgeInsets.only(top: 7),
                                          child: Text(
                                            "Klik untuk melanjutkan",
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        trailing: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons
                                              .keyboard_arrow_right_outlined),
                                          iconSize: 25,
                                          padding: EdgeInsets.all(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 20, top: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(250, 255, 233, 144),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 20,
                                    offset: Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return PagePokja1();
                                        },
                                      ),
                                    );
                                  },
                                  splashColor: grey300,
                                  borderRadius: BorderRadius.circular(10),
                                  child: Align(
                                    alignment: FractionalOffset.centerLeft,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 5,
                                      ),
                                      child: ListTile(
                                        leading: Image.asset(
                                          "assets/images/garuda.png",
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.cover,
                                        ),
                                        title: Text(
                                          "Penghayatan & Pengamalan Pancasila",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        subtitle: Padding(
                                          padding: EdgeInsets.only(top: 7),
                                          child: Text(
                                            "Klik untuk melanjutkan",
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        trailing: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons
                                              .keyboard_arrow_right_outlined),
                                          iconSize: 25,
                                          padding: EdgeInsets.all(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                right: 20,
                                top: 20,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(250, 255, 221, 178),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 20,
                                    offset: Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    // Navigator.pushNamed(context,
                                    //     PageGotongRoyong.route.toString());
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return PageGotongRoyong();
                                        },
                                      ),
                                    );
                                  },
                                  splashColor: grey300,
                                  borderRadius: BorderRadius.circular(10),
                                  child: Align(
                                    alignment: FractionalOffset.centerLeft,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 5,
                                      ),
                                      child: ListTile(
                                        leading: Image.asset(
                                          "assets/images/handshake.png",
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.cover,
                                        ),
                                        title: Text(
                                          "Gotong Royong",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        subtitle: Padding(
                                          padding: EdgeInsets.only(top: 7),
                                          child: Text(
                                            "Klik untuk melanjutkan",
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        trailing: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons
                                              .keyboard_arrow_right_outlined),
                                          iconSize: 25,
                                          padding: EdgeInsets.all(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ExpansionTile(
                    title: Text(
                      "Pokja II",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        "Silahkan pilih program kerja",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    tilePadding: EdgeInsets.symmetric(horizontal: 20),
                    collapsedBackgroundColor: whiteColor,
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: whiteColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        width: 1,
                        color: Color.fromARGB(106, 172, 172, 172),
                      ),
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 30,
                          bottom: 20,
                          top: 5,
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(250, 139, 197, 234),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 20,
                                    offset: Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return PagePendidikanKetrampilan();
                                        },
                                      ),
                                    );
                                  },
                                  splashColor: grey300,
                                  borderRadius: BorderRadius.circular(10),
                                  child: Align(
                                    alignment: FractionalOffset.centerLeft,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 5,
                                      ),
                                      child: ListTile(
                                        leading: Image.asset(
                                          "assets/images/mortarboard.png",
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.cover,
                                        ),
                                        title: Text(
                                          "Pendidikan Ketrampilan",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        subtitle: Padding(
                                          padding: EdgeInsets.only(top: 7),
                                          child: Text(
                                            "Klik untuk melanjutkan",
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        trailing: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons
                                              .keyboard_arrow_right_outlined),
                                          iconSize: 25,
                                          padding: EdgeInsets.all(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                right: 20,
                                top: 20,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(250, 203, 239, 255),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 20,
                                    offset: Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return PagePengembanganKehidupan();
                                        },
                                      ),
                                    );
                                  },
                                  splashColor: grey300,
                                  borderRadius: BorderRadius.circular(10),
                                  child: Align(
                                    alignment: FractionalOffset.centerLeft,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 5,
                                      ),
                                      child: ListTile(
                                        leading: Image.asset(
                                          "assets/images/cooperation.png",
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.cover,
                                        ),
                                        title: Text(
                                          "Pengembangan Kehidupan Berkoperasi",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        subtitle: Padding(
                                          padding: EdgeInsets.only(top: 7),
                                          child: Text(
                                            "Klik untuk melanjutkan",
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        trailing: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons
                                              .keyboard_arrow_right_outlined),
                                          iconSize: 25,
                                          padding: EdgeInsets.all(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ExpansionTile(
                    title: Text(
                      "Pokja III",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        "Silahkan pilih program kerja",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    tilePadding: EdgeInsets.symmetric(horizontal: 20),
                    collapsedBackgroundColor: whiteColor,
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: whiteColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        width: 1,
                        color: Color.fromARGB(106, 172, 172, 172),
                      ),
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 30,
                          bottom: 20,
                          top: 5,
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                right: 20,
                                top: 5,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(250, 255, 201, 178),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 20,
                                    offset: Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return PageKaderPokja3();
                                        },
                                      ),
                                    );
                                  },
                                  splashColor: grey300,
                                  borderRadius: BorderRadius.circular(10),
                                  child: Align(
                                    alignment: FractionalOffset.centerLeft,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 5,
                                      ),
                                      child: ListTile(
                                        leading: Image.asset(
                                          "assets/images/teamwork.png",
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.cover,
                                        ),
                                        title: Text(
                                          "Kader Pokja III",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        subtitle: Padding(
                                          padding: EdgeInsets.only(top: 7),
                                          child: Text(
                                            "Klik untuk melanjutkan",
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        trailing: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons
                                              .keyboard_arrow_right_outlined),
                                          iconSize: 25,
                                          padding: EdgeInsets.all(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20, right: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(250, 255, 218, 148),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 20,
                                    offset: Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return PagePangan();
                                        },
                                      ),
                                    );
                                  },
                                  splashColor: grey300,
                                  borderRadius: BorderRadius.circular(10),
                                  child: Align(
                                    alignment: FractionalOffset.centerLeft,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 5,
                                      ),
                                      child: ListTile(
                                        leading: Image.asset(
                                          "assets/images/food.png",
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.cover,
                                        ),
                                        title: Text(
                                          "Pangan",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        subtitle: Padding(
                                          padding: EdgeInsets.only(top: 7),
                                          child: Text(
                                            "Klik untuk melanjutkan",
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        trailing: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons
                                              .keyboard_arrow_right_outlined),
                                          iconSize: 25,
                                          padding: EdgeInsets.all(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                right: 20,
                                top: 20,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(250, 255, 193, 127),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 20,
                                    offset: Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return PageSandang();
                                        },
                                      ),
                                    );
                                  },
                                  splashColor: grey300,
                                  borderRadius: BorderRadius.circular(10),
                                  child: Align(
                                    alignment: FractionalOffset.centerLeft,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 5,
                                      ),
                                      child: ListTile(
                                        leading: Image.asset(
                                          "assets/images/sandang.png",
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.cover,
                                        ),
                                        title: Text(
                                          "Sandang",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        subtitle: Padding(
                                          padding: EdgeInsets.only(top: 7),
                                          child: Text(
                                            "Klik untuk melanjutkan",
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        trailing: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons
                                              .keyboard_arrow_right_outlined),
                                          iconSize: 25,
                                          padding: EdgeInsets.all(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                right: 20,
                                top: 20,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(250, 255, 178, 193),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 20,
                                    offset: Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return PagePerumahan();
                                        },
                                      ),
                                    );
                                  },
                                  splashColor: grey300,
                                  borderRadius: BorderRadius.circular(10),
                                  child: Align(
                                    alignment: FractionalOffset.centerLeft,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 5,
                                      ),
                                      child: ListTile(
                                        leading: Image.asset(
                                          "assets/images/housing_area.png",
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.cover,
                                        ),
                                        title: Text(
                                          "Perumahan & Tata Laksana Rumah Tangga",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        subtitle: Padding(
                                          padding: EdgeInsets.only(top: 7),
                                          child: Text(
                                            "Klik untuk melanjutkan",
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        trailing: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons
                                              .keyboard_arrow_right_outlined),
                                          iconSize: 25,
                                          padding: EdgeInsets.all(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ExpansionTile(
                    title: Text(
                      "Pokja IV",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        "Silahkan pilih program kerja",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    tilePadding: EdgeInsets.symmetric(horizontal: 20),
                    collapsedBackgroundColor: whiteColor,
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: whiteColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        width: 1,
                        color: Color.fromARGB(106, 172, 172, 172),
                      ),
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 30,
                          bottom: 20,
                          top: 5,
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 20, top: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(250, 255, 201, 178),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 20,
                                    offset: Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return PageKaderPokja4();
                                        },
                                      ),
                                    );
                                  },
                                  splashColor: grey300,
                                  borderRadius: BorderRadius.circular(10),
                                  child: Align(
                                    alignment: FractionalOffset.centerLeft,
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5),
                                      child: ListTile(
                                        leading: Image.asset(
                                          "assets/images/teamwork.png",
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.cover,
                                        ),
                                        title: Text(
                                          "Kader Pokja IV",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        subtitle: Padding(
                                          padding: EdgeInsets.only(top: 7),
                                          child: Text(
                                            "Klik untuk melanjutkan",
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        trailing: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons
                                              .keyboard_arrow_right_outlined),
                                          iconSize: 25,
                                          padding: EdgeInsets.all(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 20, top: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(250, 247, 201, 204),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 20,
                                    offset: Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context,
                                        PageBidangKesehatan.route.toString());
                                  },
                                  splashColor: grey300,
                                  borderRadius: BorderRadius.circular(10),
                                  child: Align(
                                    alignment: FractionalOffset.centerLeft,
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5),
                                      child: ListTile(
                                        leading: Image.asset(
                                          "assets/images/healthcare.png",
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.cover,
                                        ),
                                        title: Text(
                                          "Kesehatan",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        subtitle: Padding(
                                          padding: EdgeInsets.only(top: 7),
                                          child: Text(
                                            "Klik untuk melanjutkan",
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        trailing: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons
                                              .keyboard_arrow_right_outlined),
                                          iconSize: 25,
                                          padding: EdgeInsets.all(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                right: 20,
                                top: 20,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(250, 187, 229, 194),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 20,
                                    offset: Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context,
                                        PageLingkunganHidup.route.toString());
                                  },
                                  splashColor: grey300,
                                  borderRadius: BorderRadius.circular(10),
                                  child: Align(
                                    alignment: FractionalOffset.centerLeft,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 5,
                                      ),
                                      child: ListTile(
                                        leading: Image.asset(
                                          "assets/images/planet_earth.png",
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.cover,
                                        ),
                                        title: Text(
                                          "Kelestarian Lingkungan Hidup",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        subtitle: Padding(
                                          padding: EdgeInsets.only(top: 7),
                                          child: Text(
                                            "Klik untuk melanjutkan",
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        trailing: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons
                                              .keyboard_arrow_right_outlined),
                                          iconSize: 25,
                                          padding: EdgeInsets.all(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                right: 20,
                                top: 20,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(250, 245, 229, 218),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 20,
                                    offset: Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context,
                                        PagePerencaanSehat.route.toString());
                                  },
                                  splashColor: grey300,
                                  borderRadius: BorderRadius.circular(10),
                                  child: Align(
                                    alignment: FractionalOffset.centerLeft,
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5),
                                      child: ListTile(
                                        leading: Image.asset(
                                          "assets/images/exercise.png",
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.cover,
                                        ),
                                        title: Text(
                                          "Perencanaan Sehat",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        subtitle: Padding(
                                          padding: EdgeInsets.only(top: 7),
                                          child: Text(
                                            "Klik untuk melanjutkan",
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        trailing: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons
                                              .keyboard_arrow_right_outlined),
                                          iconSize: 25,
                                          padding: EdgeInsets.all(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 1,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: whiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 2,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return PageLaporanUmum();
                              },
                            ),
                          );
                        },
                        splashColor: grey300,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 3,
                            horizontal: 5,
                          ),
                          child: ListTile(
                            title: Text(
                              "Laporan Umum",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                "Klik untuk melanjutkan",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: grey700,
                                ),
                              ),
                            ),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.keyboard_arrow_right_outlined),
                              iconSize: 25,
                              padding: EdgeInsets.only(left: 25),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
