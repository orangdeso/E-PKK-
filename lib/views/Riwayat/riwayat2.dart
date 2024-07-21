import 'package:e_pkk/utils/constants.dart';
import 'package:e_pkk/views/Riwayat/riwayat_galeri.dart';
import 'package:e_pkk/views/Riwayat/riwayat_gotong.dart';
import 'package:e_pkk/views/Riwayat/riwayat_kader1.dart';
import 'package:e_pkk/views/Riwayat/riwayat_kader3.dart';
import 'package:e_pkk/views/Riwayat/riwayat_kader4.dart';
import 'package:e_pkk/views/Riwayat/riwayat_kelestarian.dart';
import 'package:e_pkk/views/Riwayat/riwayat_kesehatan.dart';
import 'package:e_pkk/views/Riwayat/riwayat_lapUmum.dart';
import 'package:e_pkk/views/Riwayat/riwayat_pangan.dart';
import 'package:e_pkk/views/Riwayat/riwayat_pendidikan.dart';
import 'package:e_pkk/views/Riwayat/riwayat_pengembangan.dart';
import 'package:e_pkk/views/Riwayat/riwayat_penghayatan.dart';
import 'package:e_pkk/views/Riwayat/riwayat_perencanaan.dart';
import 'package:e_pkk/views/Riwayat/riwayat_perumahan.dart';
import 'package:e_pkk/views/Riwayat/riwayat_sandang.dart';
import 'package:flutter/material.dart';

class PageRiwayat2 extends StatelessWidget {
  const PageRiwayat2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 244, 244),
      appBar: AppBar(
        title: Text(
          "Riwayat",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: whiteColor,
          ),
        ),
        iconTheme: IconThemeData(
          color: grey800,
        ),
        elevation: 5,
        centerTitle: true,
        backgroundColor: ktextColor,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Scrollbar(
          radius: Radius.circular(25),
          thickness: 5,
          thumbVisibility: true,
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: 30, left: 20, right: 20, bottom: 5),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pokja I",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: grey800,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 1,
                          color: grey200,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 110,
                                        child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () {
                                              print("Klik");
                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .push(
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return RiwayatKader1();
                                                  },
                                                ),
                                              );
                                            },
                                            splashColor: grey300,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/teamwork.png",
                                                    width: 40,
                                                    height: 40,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    alignment: Alignment.center,
                                                    width: 100,
                                                    child: Text(
                                                      "Kader Pokja I",
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        color: Colors
                                                            .grey.shade700,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 110,
                                        child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () {
                                              print("Klik");
                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .push(
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return RiwayatPenghayatan();
                                                  },
                                                ),
                                              );
                                            },
                                            splashColor: grey300,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/garuda.png",
                                                    width: 40,
                                                    height: 40,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    alignment: Alignment.center,
                                                    width: 100,
                                                    child: Text(
                                                      "Penghayatan & Pengamalan Pancasila",
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        color: Colors
                                                            .grey.shade700,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 110,
                                        child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () {
                                              print("Klik");
                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .push(
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return RiwayatGotong();
                                                  },
                                                ),
                                              );
                                            },
                                            splashColor: grey300,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/handshake.png",
                                                    width: 40,
                                                    height: 40,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    alignment: Alignment.center,
                                                    width: 100,
                                                    child: Text(
                                                      "Gotong Royong",
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        color: Colors
                                                            .grey.shade700,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: 20, left: 20, right: 20, bottom: 5),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pokja II",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: grey800,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 1,
                          color: grey200,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 110,
                                        child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () {
                                              print("Klik");
                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .push(
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return RiwayatPendidikan();
                                                  },
                                                ),
                                              );
                                            },
                                            splashColor: grey300,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/mortarboard.png",
                                                    width: 40,
                                                    height: 40,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    alignment: Alignment.center,
                                                    width: 100,
                                                    child: Text(
                                                      "Pendidikan Ketrampilan",
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        color: Colors
                                                            .grey.shade700,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 110,
                                        child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () {
                                              print("Klik");
                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .push(
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return RiwayatPengembangan();
                                                  },
                                                ),
                                              );
                                            },
                                            splashColor: grey300,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/cooperation.png",
                                                    width: 40,
                                                    height: 40,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    alignment: Alignment.center,
                                                    width: 100,
                                                    child: Text(
                                                      "Pengembangan Kehidupan Berkoperasi",
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        color: Colors
                                                            .grey.shade700,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: 20, left: 20, right: 20, bottom: 5),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pokja III",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: grey800,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 1,
                          color: grey200,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 110,
                                        child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () {
                                              print("Klik");
                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .push(
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return RiwayatKader3();
                                                  },
                                                ),
                                              );
                                            },
                                            splashColor: grey300,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/teamwork.png",
                                                    width: 40,
                                                    height: 40,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    alignment: Alignment.center,
                                                    width: 100,
                                                    child: Text(
                                                      "Kader Pokja III",
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        color: Colors
                                                            .grey.shade700,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 110,
                                        child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () {
                                              print("Klik");
                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .push(
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return RiwayatPangan();
                                                  },
                                                ),
                                              );
                                            },
                                            splashColor: grey300,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/food.png",
                                                    width: 40,
                                                    height: 40,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    alignment: Alignment.center,
                                                    width: 100,
                                                    child: Text(
                                                      "Pangan",
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        color: Colors
                                                            .grey.shade700,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 110,
                                        child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () {
                                              print("Klik");
                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .push(
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return RiwayatSandang();
                                                  },
                                                ),
                                              );
                                            },
                                            splashColor: grey300,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/sandang.png",
                                                    width: 40,
                                                    height: 40,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    alignment: Alignment.center,
                                                    width: 100,
                                                    child: Text(
                                                      "Sandang",
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        color: Colors
                                                            .grey.shade700,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 110,
                                        child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () {
                                              print("Klik");
                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .push(
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return RiwayatPerumahan();
                                                  },
                                                ),
                                              );
                                            },
                                            splashColor: grey300,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/housing_area.png",
                                                    width: 40,
                                                    height: 40,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    alignment: Alignment.center,
                                                    width: 100,
                                                    child: Text(
                                                      "Perumahan & Tata Laksana Rumah Tangga",
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        color: Colors
                                                            .grey.shade700,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: 20, left: 20, right: 20, bottom: 5),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pokja IV",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: grey800,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 1,
                          color: grey200,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 110,
                                        child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () {
                                              print("Klik");
                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .push(
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return RiwayatKader4();
                                                  },
                                                ),
                                              );
                                            },
                                            splashColor: grey300,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/teamwork.png",
                                                    width: 40,
                                                    height: 40,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    alignment: Alignment.center,
                                                    width: 100,
                                                    child: Text(
                                                      "Kader Pokja IV",
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        color: Colors
                                                            .grey.shade700,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 110,
                                        child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () {
                                              print("Klik");
                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .push(
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return RiwayatKesehatan();
                                                  },
                                                ),
                                              );
                                            },
                                            splashColor: grey300,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/healthcare.png",
                                                    width: 40,
                                                    height: 40,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    alignment: Alignment.center,
                                                    width: 100,
                                                    child: Text(
                                                      "Kesehatan",
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        color: Colors
                                                            .grey.shade700,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 110,
                                        child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () {
                                              print("Klik");
                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .push(
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return RiwayatKelestarian();
                                                  },
                                                ),
                                              );
                                            },
                                            splashColor: grey300,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/planet_earth.png",
                                                    width: 40,
                                                    height: 40,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    alignment: Alignment.center,
                                                    width: 100,
                                                    child: Text(
                                                      "Kelestarian Lingkungan Hidup",
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        color: Colors
                                                            .grey.shade700,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 110,
                                        child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () {
                                              print("Klik");
                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .push(
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return RiwayatPerencanaan();
                                                  },
                                                ),
                                              );
                                            },
                                            splashColor: grey300,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/exercise.png",
                                                    width: 40,
                                                    height: 40,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    alignment: Alignment.center,
                                                    width: 100,
                                                    child: Text(
                                                      "Perencanaan Sehat",
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        color: Colors
                                                            .grey.shade700,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(top: 20, left: 0, right: 20, bottom: 5),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            "Laporan Umum",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: grey800,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 1,
                          color: grey200,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      //height: 110,
                                      padding: EdgeInsets.only(bottom: 10),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          onTap: () {
                                            print("Klik");
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .push(
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return RiwayatLapUmum();
                                                },
                                              ),
                                            );
                                          },
                                          splashColor: grey300,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Column(
                                              children: [
                                                Image.asset(
                                                  "assets/images/teamwork.png",
                                                  width: 40,
                                                  height: 40,
                                                  fit: BoxFit.cover,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  width: 100,
                                                  child: Text(
                                                    "Laporan   Umum",
                                                    textAlign: TextAlign.center,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      color:
                                                          Colors.grey.shade700,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(top: 20, left: 0, right: 20, bottom: 5),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            "Galeri",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: grey800,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 1,
                          color: grey200,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      //height: 110,
                                      padding: EdgeInsets.only(bottom: 10),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          onTap: () {
                                            print("Klik");
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .push(
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return RiwayatGaleri();
                                                },
                                              ),
                                            );
                                          },
                                          splashColor: grey300,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Column(
                                              children: [
                                                Image.asset(
                                                  "assets/images/picture.png",
                                                  width: 40,
                                                  height: 40,
                                                  fit: BoxFit.cover,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  width: 100,
                                                  child: Text(
                                                    "Galeri",
                                                    textAlign: TextAlign.center,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      color:
                                                          Colors.grey.shade700,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
