// ignore_for_file: unused_local_variable

import 'package:e_pkk/helpers/ApiHelper.dart';
import 'package:e_pkk/models/DataAkun.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:e_pkk/views/Riwayat/detail_gotong_royong.dart';
import 'package:e_pkk/views/Riwayat/detail_kader1.dart';
import 'package:e_pkk/views/Riwayat/detail_kader3.dart';
import 'package:e_pkk/views/Riwayat/detail_kader4.dart';
import 'package:e_pkk/views/Riwayat/detail_klh.dart';
import 'package:e_pkk/views/Riwayat/detail_pangan.dart';
import 'package:e_pkk/views/Riwayat/detail_pengembangan.dart';
import 'package:e_pkk/views/Riwayat/detail_penghayatan.dart';
import 'package:e_pkk/views/Riwayat/detail_perumahan.dart';
import 'package:e_pkk/views/Riwayat/detail_sandang.dart';
import 'package:e_pkk/views/Riwayat/detal_pendidikan.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'detail_gallery.dart';

class RiwayatPage extends StatefulWidget {
  static String route = '/Riwayat';
  // const RiwayatPage({super.key});

  @override
  State<RiwayatPage> createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage> {
  //List Dynamic Data Laporan
  List<dynamic> _dataKesehatan = [];
  List<dynamic> _dataKLH = [];
  List<dynamic> _dataPSehat = [];
  List<dynamic> _gallery = [];
  List<dynamic> _dataKader1 = [];
  List<dynamic> _dataPenghayatan = [];
  List<dynamic> _dataGotong = [];
  List<dynamic> _dataPendidikan = [];
  List<dynamic> _dataPengembangan = [];
  List<dynamic> _dataKader3 = [];
  List<dynamic> _dataPangan = [];
  List<dynamic> _dataIndustri = [];
  List<dynamic> _dataPerumahan = [];
  List<dynamic> _dataKader4 = [];
  List<dynamic> _dataUmum = [];

  //Pendeklarasian
  String idAkun = '';
  late Future<DataAkun> futureAkun;

  //SharedPreferences
  Future<void> getIdAkun() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String idAkunValue = prefs.getString("id_akun") ?? '';
    setState(() {
      idAkun = idAkunValue;
      fetchDataKesehatan(idUser: idAkun);
      fetchDataKLH(idUser: idAkun);
      fetchDataPSehat(idUser: idAkun);
      fetchDataGaleery(idUser: idAkun);
      fetchDataKader1(idUser: idAkun);
      fetchDataPenghayatan(idUser: idAkun);
      fetchDataGotong(idUser: idAkun);
      fetchDataPendidikan(idUser: idAkun);
      fetchDataPengembangan(idUser: idAkun);
      fetchDataKader3(idUser: idAkun);
      fetchDataPangan(idUser: idAkun);
      fetchDataIndustri(idUser: idAkun);
      fetchDataRumah(idUser: idAkun);
      fetchDataKader4(idUser: idAkun);
      fetchDataLapUmum(idUser: idAkun);
    });
  }

  Future<void> fetchDataKesehatan({String? idUser}) async {
    final response = await http.post(
        Uri.parse(ApiHelper.url + "RiwayatKesehatan.php"),
        body: {"id_user": idUser});

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      setState(() {
        _dataKesehatan = jsonData['data'];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> fetchDataPSehat({String? idUser}) async {
    final response = await http.post(
        Uri.parse(ApiHelper.url + "RiwayatPerencanaanSehat.php"),
        body: {"id_user": idUser});

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      setState(() {
        _dataPSehat = jsonData['data'];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> fetchDataGaleery({String? idUser}) async {
    final response = await http.post(
        Uri.parse(ApiHelper.url + "getGallery.php"),
        body: {"id_user": idUser});

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      setState(() {
        _gallery = jsonData['data'];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> fetchDataKLH({String? idUser}) async {
    final response = await http.post(
        Uri.parse(ApiHelper.url + "RiwayatKelestarian.php"),
        body: {"id_user": idUser});

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print(jsonData);

      setState(() {
        _dataKLH = jsonData['data'];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  //Revisi Masboro
  Future<void> fetchDataKader1({String? idUser}) async {
    final response = await http.post(
        Uri.parse(ApiHelper.url + "RiwayatKader1.php"),
        body: {"id_user": idUser});

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      setState(() {
        _dataKader1 = jsonData['data'];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> fetchDataPenghayatan({String? idUser}) async {
    final response = await http.post(
        Uri.parse(ApiHelper.url + "RiwayatPenghayatan.php"),
        body: {"id_user": idUser});

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      setState(() {
        _dataPenghayatan = jsonData['data'];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> fetchDataGotong({String? idUser}) async {
    final response = await http.post(
        Uri.parse(ApiHelper.url + "RiwayatGotong.php"),
        body: {"id_user": idUser});

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      setState(() {
        _dataGotong = jsonData['data'];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> fetchDataPendidikan({String? idUser}) async {
    final response = await http.post(
        Uri.parse(ApiHelper.url + "RiwayatPendidikan.php"),
        body: {"id_user": idUser});

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      setState(() {
        _dataPendidikan = jsonData['data'];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> fetchDataPengembangan({String? idUser}) async {
    final response = await http.post(
        Uri.parse(ApiHelper.url + "RiwayatPengembangan.php"),
        body: {"id_user": idUser});

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      setState(() {
        _dataPengembangan = jsonData['data'];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> fetchDataKader3({String? idUser}) async {
    final response = await http.post(
        Uri.parse(ApiHelper.url + "RiwayatKader3.php"),
        body: {"id_user": idUser});

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      setState(() {
        _dataKader3 = jsonData['data'];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> fetchDataPangan({String? idUser}) async {
    final response = await http.post(
        Uri.parse(ApiHelper.url + "RiwayatPangan.php"),
        body: {"id_user": idUser});

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      setState(() {
        _dataPangan = jsonData['data'];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> fetchDataIndustri({String? idUser}) async {
    final response = await http.post(
        Uri.parse(ApiHelper.url + "RiwayatIndustri.php"),
        body: {"id_user": idUser});

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      setState(() {
        _dataIndustri = jsonData['data'];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> fetchDataRumah({String? idUser}) async {
    final response = await http.post(
        Uri.parse(ApiHelper.url + "RiwayatPerumahan.php"),
        body: {"id_user": idUser});

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      setState(() {
        _dataPerumahan = jsonData['data'];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> fetchDataKader4({String? idUser}) async {
    final response = await http.post(
        Uri.parse(ApiHelper.url + "RiwayatKader4.php"),
        body: {"id_user": idUser});

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      setState(() {
        _dataKader4 = jsonData['data'];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> fetchDataLapUmum({String? idUser}) async {
    final response = await http.post(
        Uri.parse(ApiHelper.url + "RiwayatLapUmum.php"),
        body: {"id_user": idUser});

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      setState(() {
        _dataUmum = jsonData['data'];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  List<Tab> myTab = [
    Tab(
      child: Text(
        "Kader Pokja I",
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
          textStyle: TextStyle(
              //fontSize: 10.5,
              ),
        ),
      ),
    ),
    Tab(
      child: Text(
        "Penghayatan & Pengamalan Pancasila",
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
          textStyle: TextStyle(
              //fontSize: 10.5,
              ),
        ),
      ),
    ),
    Tab(
      child: Text(
        "Gotong Royong",
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
          textStyle: TextStyle(
              //fontSize: 10.5,
              ),
        ),
      ),
    ),
    Tab(
      child: Text(
        "Pendidikan & Ketrampilan ",
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
          textStyle: TextStyle(
              //fontSize: 10.5,
              ),
        ),
      ),
    ),
    Tab(
      child: Text(
        "Pengembangan Kehidupan Berkoperasi",
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
          textStyle: TextStyle(
              //fontSize: 10.5,
              ),
        ),
      ),
    ),
    Tab(
      child: Text(
        "Kader Pokja III",
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
          textStyle: TextStyle(
              //fontSize: 10.5,
              ),
        ),
      ),
    ),
    Tab(
      child: Text(
        "Pangan",
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
          textStyle: TextStyle(
              //fontSize: 10.5,
              ),
        ),
      ),
    ),
    Tab(
      child: Text(
        "Sandang",
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
          textStyle: TextStyle(
              //fontSize: 10.5,
              ),
        ),
      ),
    ),
    Tab(
      child: Text(
        "Perumahan & Tata Laksana Rumah Tangga",
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
          textStyle: TextStyle(
              //fontSize: 10.5,
              ),
        ),
      ),
    ),
    Tab(
      child: Text(
        "Kader Pokja IV",
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
          textStyle: TextStyle(
              //fontSize: 10.5,
              ),
        ),
      ),
    ),
    Tab(
      child: Text(
        "Bidang Kesehatan",
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
          textStyle: TextStyle(
              //fontSize: 10.5,
              ),
        ),
      ),
    ),
    Tab(
      child: Text(
        "Kelesrarian LH",
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
          textStyle: TextStyle(
              //fontSize: 13,
              ),
        ),
      ),
    ),
    Tab(
      child: Text(
        "Perencanaan Sehat",
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
          textStyle: TextStyle(
              //fontSize: 10.5,
              ),
        ),
      ),
    ),
    Tab(
      child: Text(
        "Laporan Umum",
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
          textStyle: TextStyle(
              //fontSize: 10.5,
              ),
        ),
      ),
    ),
    Tab(
      child: Text(
        "Galeri",
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
          textStyle: TextStyle(
              //fontSize: 10.5,
              ),
        ),
      ),
    ),
  ];

  @override
  void initState() {
    getIdAkun();
    fetchDataKesehatan(idUser: idAkun);
    fetchDataKLH(idUser: idAkun);
    fetchDataPSehat(idUser: idAkun);
    fetchDataGaleery(idUser: idAkun);
    fetchDataKader1(idUser: idAkun);
    fetchDataPenghayatan(idUser: idAkun);
    fetchDataGotong(idUser: idAkun);
    fetchDataPendidikan(idUser: idAkun);
    fetchDataPengembangan(idUser: idAkun);
    fetchDataKader3(idUser: idAkun);
    fetchDataPangan(idUser: idAkun);
    fetchDataIndustri(idUser: idAkun);
    fetchDataRumah(idUser: idAkun);
    fetchDataKader4(idUser: idAkun);
    fetchDataLapUmum(idUser: idAkun);
    print(idAkun);
    setState(() {});
    super.initState();
  }

  Color WarnaButton({String? stts}) {
    if (stts == "Proses") {
      return Colors.orange.shade400;
    } else if (stts == "Dibatalkan") {
      return Colors.red.shade400;
    } else if (stts == "Revisi") {
      return Colors.blue.shade400;
    } else {
      return Colors.green.shade500;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: myTab.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Riwayat",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: ktextColor,
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: blueLight50,
              labelColor: whiteColor,
              unselectedLabelColor: grey400,
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.normal,
              ),
              tabs: myTab,
            ),
          ),
          resizeToAvoidBottomInset: true,
          body: TabBarView(
            children: [
              ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                itemCount: _dataKader1.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 2.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return PageDetailKader1();
                              },
                              settings: RouteSettings(
                                arguments: {
                                  "id_kader_pokja1": _dataKader1[index]
                                      ['id_kader_pokja1'],
                                  "PKBN": _dataKader1[index]['PKBN'],
                                  "PKDRT": _dataKader1[index]['PKDRT'],
                                  "pola_asuh": _dataKader1[index]['pola_asuh'],
                                  "catatan":
                                      _dataKader1[index]['catatan'] != null &&
                                              _dataKader1[index]['catatan']
                                                  .isNotEmpty
                                          ? _dataKader1[index]['catatan']
                                          : "-",
                                  "status": _dataKader1[index]['status'],
                                  "tanggal": _dataKader1[index]['tanggal'],
                                  "waktu": _dataKader1[index]['waktu'],
                                  "created_at": _dataKader1[index]
                                      ['created_at'],
                                  "updated_at": _dataKader1[index]
                                      ['updated_at'],
                                },
                              ),
                            ),
                          );
                        },
                        contentPadding: EdgeInsets.all(20),
                        // leading: Container(
                        //   width: 80,
                        //   height: 80,
                        //   child: Image.network(
                        //     "${ApiHelper.url}../public/frontend2/Bidang_LingkunganHidup/${_dataKLH[index]['gambar_upload']}",
                        //     fit: BoxFit.cover,
                        //   ),
                        // ),
                        title: Text(
                          "Laporan Kader Pokja I",
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                "Id Laporan : ${_dataKader1[index]['id_kader_pokja1']}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Text("PKBN"),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Text(
                                        "${_dataKader1[index]['PKBN']}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Text("PKDRT"),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Text(
                                        "${_dataKader1[index]['PKDRT']}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Text("Pola Asuh"),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    "${_dataKader1[index]['pola_asuh']}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.calendar_month_outlined,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "${_dataKader1[index]['tanggal']}",
                                      style: TextStyle(
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: EdgeInsets.only(left: 20),
                                  //   child: Icon(
                                  //     Icons.access_time_rounded,
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding: EdgeInsets.only(left: 10),
                                  //   child: Text(
                                  //     "${_dataKader1[index]['waktu']}",
                                  //     style: TextStyle(
                                  //       letterSpacing: 1,
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            // Container(
                            //   padding: EdgeInsets.only(top: 20),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.end,
                            //     crossAxisAlignment: CrossAxisAlignment.center,
                            //     children: [
                            //       Icon(
                            //         Icons.arrow_back_ios,
                            //         color: ktextColor,
                            //       ),
                            //       Text(
                            //         "Lihat Detail",
                            //         style: TextStyle(
                            //           fontSize: 16,
                            //           color: ktextColor,
                            //           fontWeight: FontWeight.w500,
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: EdgeInsets.only(left: 5),
                            //         child: Icon(
                            //           Icons.arrow_forward_ios,
                            //           color: ktextColor,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // )
                          ],
                        ),
                        trailing: Column(
                          children: [
                            InkWell(
                              child: Container(
                                width: 100,
                                height: 40,
                                child: Card(
                                  color: WarnaButton(
                                      stts: _dataKader1[index]['status']),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${_dataKader1[index]['status']}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
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
                    ),
                  );
                },
              ),
              ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                itemCount: _dataPenghayatan.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 2.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return PageDetailPenghayatan();
                              },
                              settings: RouteSettings(
                                arguments: {
                                  "id_pokja1_bidang1": _dataPenghayatan[index]
                                      ['id_pokja1_bidang1'],
                                  "jumlah_kel_simulasi1":
                                      _dataPenghayatan[index]
                                          ['jumlah_kel_simulasi1'],
                                  "jumlah_anggota1": _dataPenghayatan[index]
                                      ['jumlah_anggota1'],
                                  "jumlah_kel_simulasi2":
                                      _dataPenghayatan[index]
                                          ['jumlah_kel_simulasi2'],
                                  "jumlah_anggota2": _dataPenghayatan[index]
                                      ['jumlah_anggota2'],
                                  "jumlah_kel_simulasi3":
                                      _dataPenghayatan[index]
                                          ['jumlah_kel_simulasi3'],
                                  "jumlah_anggota3": _dataPenghayatan[index]
                                      ['jumlah_anggota3'],
                                  "jumlah_kel_simulasi4":
                                      _dataPenghayatan[index]
                                          ['jumlah_kel_simulasi4'],
                                  "jumlah_anggota4": _dataPenghayatan[index]
                                      ['jumlah_anggota4'],
                                  "status": _dataPenghayatan[index]['status'],
                                  "tanggal": _dataPenghayatan[index]['tanggal'],
                                  "catatan": _dataPenghayatan[index]
                                                  ['catatan'] !=
                                              null &&
                                          _dataPenghayatan[index]['catatan']
                                              .isNotEmpty
                                      ? _dataPenghayatan[index]['catatan']
                                      : "-",
                                  "waktu": _dataPenghayatan[index]['waktu'],
                                  "created_at": _dataPenghayatan[index]
                                      ['created_at'],
                                  "updated_at": _dataPenghayatan[index]
                                      ['updated_at'],
                                },
                              ),
                            ),
                          );
                        },
                        contentPadding: EdgeInsets.all(20),
                        // leading: Container(
                        //   width: 80,
                        //   height: 80,
                        //   child: Image.network(
                        //     "${ApiHelper.url}../public/frontend2/Bidang_LingkunganHidup/${_dataKLH[index]['gambar_upload']}",
                        //     fit: BoxFit.cover,
                        //   ),
                        // ),
                        title: Text(
                          "Penghayatan & Pengamalan Pancasila",
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                "Id Laporan : ${_dataPenghayatan[index]['id_pokja1_bidang1']}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                "Sosial Pendidikan PKBN :",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10, left: 10),
                              child: Text("Jumlah Kel Simulasi"),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10, top: 5),
                              child: Text(
                                "${_dataPenghayatan[index]['jumlah_kel_simulasi1']}",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10, left: 10),
                              child: Text("Jumlah Anggota"),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10, top: 5),
                              child: Text(
                                "${_dataPenghayatan[index]['jumlah_anggota1']}",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.calendar_month_outlined,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "${_dataPenghayatan[index]['tanggal']}",
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: EdgeInsets.only(left: 20),
                                  //   child: Icon(
                                  //     Icons.access_time_rounded,
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding: EdgeInsets.only(left: 10),
                                  //   child: Text(
                                  //     "${_dataPenghayatan[index]['waktu']}",
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            // Container(
                            //   padding: EdgeInsets.only(top: 20),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.end,
                            //     crossAxisAlignment: CrossAxisAlignment.center,
                            //     children: [
                            //       Icon(
                            //         Icons.arrow_back_ios,
                            //         color: ktextColor,
                            //       ),
                            //       Text(
                            //         "Lihat Detail",
                            //         style: TextStyle(
                            //           fontSize: 16,
                            //           color: ktextColor,
                            //           fontWeight: FontWeight.w500,
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: EdgeInsets.only(left: 5),
                            //         child: Icon(
                            //           Icons.arrow_forward_ios,
                            //           color: ktextColor,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // )
                          ],
                        ),
                        trailing: Column(
                          children: [
                            InkWell(
                              child: Container(
                                width: 100,
                                height: 40,
                                child: Card(
                                  color: WarnaButton(
                                      stts: _dataPenghayatan[index]['status']),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${_dataPenghayatan[index]['status']}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
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
                    ),
                  );
                },
              ),
              ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                itemCount: _dataGotong.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 2.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return PageDetailGotongRoyong();
                              },
                              settings: RouteSettings(
                                arguments: {
                                  "id_pokja1_bidang2": _dataGotong[index]
                                      ['id_pokja1_bidang2'],
                                  "kerja_bakti": _dataGotong[index]
                                      ['kerja_bakti'],
                                  "rukun_kematian": _dataGotong[index]
                                      ['rukun_kematian'],
                                  "keagamaan": _dataGotong[index]['keagamaan'],
                                  "jimpitan": _dataGotong[index]['jimpitan'],
                                  "arisan": _dataGotong[index]['arisan'],
                                  "catatan":
                                      _dataGotong[index]['catatan'] != null &&
                                              _dataGotong[index]['catatan']
                                                  .isNotEmpty
                                          ? _dataGotong[index]['catatan']
                                          : "-",
                                  "status": _dataGotong[index]['status'],
                                  "tanggal": _dataGotong[index]['tanggal'],
                                  "waktu": _dataGotong[index]['waktu'],
                                  "created_at": _dataGotong[index]
                                      ['created_at'],
                                  "updated_at": _dataGotong[index]
                                      ['updated_at'],
                                },
                              ),
                            ),
                          );
                        },
                        contentPadding: EdgeInsets.all(20),
                        // leading: Container(
                        //   width: 80,
                        //   height: 80,
                        //   child: Image.network(
                        //     "${ApiHelper.url}../public/frontend2/Bidang_LingkunganHidup/${_dataKLH[index]['gambar_upload']}",
                        //     fit: BoxFit.cover,
                        //   ),
                        // ),
                        title: Text(
                          "Laporan Gotong Royong",
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                "Id Laporan : ${_dataGotong[index]['id_pokja1_bidang2']}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Text("Kerja Bakti"),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Text(
                                        "${_dataGotong[index]['kerja_bakti']}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Text("Rukun Kematian"),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    "${_dataGotong[index]['rukun_kematian']}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.calendar_month_outlined,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "${_dataGotong[index]['tanggal']}",
                                      style: TextStyle(
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: EdgeInsets.only(left: 20),
                                  //   child: Icon(
                                  //     Icons.access_time_rounded,
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding: EdgeInsets.only(left: 10),
                                  //   child: Text(
                                  //     "${_dataGotong[index]['waktu']}",
                                  //     style: TextStyle(
                                  //       letterSpacing: 1,
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            // Container(
                            //   padding: EdgeInsets.only(top: 20),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.end,
                            //     crossAxisAlignment: CrossAxisAlignment.center,
                            //     children: [
                            //       Icon(
                            //         Icons.arrow_back_ios,
                            //         color: ktextColor,
                            //       ),
                            //       Text(
                            //         "Lihat Detail",
                            //         style: TextStyle(
                            //           fontSize: 16,
                            //           color: ktextColor,
                            //           fontWeight: FontWeight.w500,
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: EdgeInsets.only(left: 5),
                            //         child: Icon(
                            //           Icons.arrow_forward_ios,
                            //           color: ktextColor,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // )
                          ],
                        ),
                        trailing: Column(
                          children: [
                            InkWell(
                              child: Container(
                                width: 100,
                                height: 40,
                                child: Card(
                                  color: WarnaButton(
                                      stts: _dataGotong[index]['status']),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${_dataGotong[index]['status']}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
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
                    ),
                  );
                },
              ),
              ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                itemCount: _dataPendidikan.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 2.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return PageDetailPendidikan();
                              },
                              settings: RouteSettings(
                                arguments: {
                                  "id_pokja2_bidang1": _dataPendidikan[index]
                                      ['id_pokja2_bidang1'],
                                  "warga_buta": _dataPendidikan[index]
                                      ['warga_buta'],
                                  "kel_belajarA": _dataPendidikan[index]
                                      ['kel_belajarA'],
                                  "warga_belajarA": _dataPendidikan[index]
                                      ['warga_belajarA'],
                                  "kel_belajarB": _dataPendidikan[index]
                                      ['kel_belajarB'],
                                  "warga_belajarB": _dataPendidikan[index]
                                      ['warga_belajarB'],
                                  "kel_belajarC": _dataPendidikan[index]
                                      ['kel_belajarC'],
                                  "warga_belajarC": _dataPendidikan[index]
                                      ['warga_belajarC'],
                                  "kel_belajarKF": _dataPendidikan[index]
                                      ['kel_belajarKF'],
                                  "warga_belajarKF": _dataPendidikan[index]
                                      ['warga_belajarKF'],
                                  "paud": _dataPendidikan[index]['paud'],
                                  "taman_bacaan": _dataPendidikan[index]
                                      ['taman_bacaan'],
                                  "jumlah_klp": _dataPendidikan[index]
                                      ['jumlah_klp'],
                                  "jumlah_ibu_peserta": _dataPendidikan[index]
                                      ['jumlah_ibu_peserta'],
                                  "jumlah_ape": _dataPendidikan[index]
                                      ['jumlah_ape'],
                                  "jumlah_kel_simulasi": _dataPendidikan[index]
                                      ['jumlah_kel_simulasi'],
                                  "KF": _dataPendidikan[index]['KF'],
                                  "paud_tutor": _dataPendidikan[index]
                                      ['paud_tutor'],
                                  "BKB": _dataPendidikan[index]['BKB'],
                                  "koperasi": _dataPendidikan[index]
                                      ['koperasi'],
                                  "ketrampilan": _dataPendidikan[index]
                                      ['ketrampilan'],
                                  "LP3PKK": _dataPendidikan[index]['LP3PKK'],
                                  "TP3PKK": _dataPendidikan[index]['TP3PKK'],
                                  "damas_pkk": _dataPendidikan[index]
                                      ['damas_pkk'],
                                  "status": _dataPendidikan[index]['status'],
                                  "tanggal": _dataPendidikan[index]['tanggal'],
                                  "catatan": _dataPendidikan[index]
                                                  ['catatan'] !=
                                              null &&
                                          _dataPendidikan[index]['catatan']
                                              .isNotEmpty
                                      ? _dataPendidikan[index]['catatan']
                                      : "-",
                                  "waktu": _dataPendidikan[index]['waktu'],
                                  "created_at": _dataPendidikan[index]
                                      ['created_at'],
                                  "updated_at": _dataPendidikan[index]
                                      ['updated_at'],
                                },
                              ),
                            ),
                          );
                        },
                        contentPadding: EdgeInsets.all(20),
                        // leading: Container(
                        //   width: 80,
                        //   height: 80,
                        //   child: Image.network(
                        //     "${ApiHelper.url}../public/frontend2/Bidang_LingkunganHidup/${_dataKLH[index]['gambar_upload']}",
                        //     fit: BoxFit.cover,
                        //   ),
                        // ),
                        title: Text(
                          "Pendidikan & Ketrampilan",
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                "Id Laporan : ${_dataPendidikan[index]['id_pokja2_bidang1']}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                "Jumlah Kelompok Belajar :",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10, left: 10),
                              child: Text("Jumlah warga yang masih buta"),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10, top: 5),
                              child: Text(
                                "${_dataPendidikan[index]['warga_buta']}",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            // Padding(
                            //   padding: EdgeInsets.only(top: 10, left: 10),
                            //   child: Text("Jumlah Anggota"),
                            // ),
                            // Padding(
                            //   padding: EdgeInsets.only(left: 10, top: 5),
                            //   child: Text(
                            //     "${_dataPenghayatan[index]['jumlah_anggota1']}",
                            //     style: TextStyle(
                            //       fontSize: 16,
                            //       color: Colors.black,
                            //     ),
                            //   ),
                            // ),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.calendar_month_outlined,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "${_dataPendidikan[index]['tanggal']}",
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: EdgeInsets.only(left: 20),
                                  //   child: Icon(
                                  //     Icons.access_time_rounded,
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding: EdgeInsets.only(left: 10),
                                  //   child: Text(
                                  //     "${_dataPendidikan[index]['waktu']}",
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            // Container(
                            //   padding: EdgeInsets.only(top: 20),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.end,
                            //     crossAxisAlignment: CrossAxisAlignment.center,
                            //     children: [
                            //       Icon(
                            //         Icons.arrow_back_ios,
                            //         color: ktextColor,
                            //       ),
                            //       Text(
                            //         "Lihat Detail",
                            //         style: TextStyle(
                            //           fontSize: 16,
                            //           color: ktextColor,
                            //           fontWeight: FontWeight.w500,
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: EdgeInsets.only(left: 5),
                            //         child: Icon(
                            //           Icons.arrow_forward_ios,
                            //           color: ktextColor,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // )
                          ],
                        ),
                        trailing: Column(
                          children: [
                            InkWell(
                              child: Container(
                                width: 100,
                                height: 40,
                                child: Card(
                                  color: WarnaButton(
                                      stts: _dataPendidikan[index]['status']),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${_dataPendidikan[index]['status']}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
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
                    ),
                  );
                },
              ),
              ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                itemCount: _dataPengembangan.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 2.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return PageDetailPengembangan();
                              },
                              settings: RouteSettings(
                                arguments: {
                                  "id_pokja2_bidang2": _dataPengembangan[index]
                                      ['id_pokja2_bidang2'],
                                  "jumlah_kelompok_pemula":
                                      _dataPengembangan[index]
                                          ['jumlah_kelompok_pemula'],
                                  "jumlah_peserta_pemula":
                                      _dataPengembangan[index]
                                          ['jumlah_peserta_pemula'],
                                  "jumlah_kelompok_madya":
                                      _dataPengembangan[index]
                                          ['jumlah_kelompok_madya'],
                                  "jumlah_peserta_madya":
                                      _dataPengembangan[index]
                                          ['jumlah_peserta_madya'],
                                  "jumlah_kelompok_utama":
                                      _dataPengembangan[index]
                                          ['jumlah_kelompok_utama'],
                                  "jumlah_peserta_utama":
                                      _dataPengembangan[index]
                                          ['jumlah_peserta_utama'],
                                  "jumlah_kelompok_mandiri":
                                      _dataPengembangan[index]
                                          ['jumlah_kelompok_mandiri'],
                                  "jumlah_peserta_mandiri":
                                      _dataPengembangan[index]
                                          ['jumlah_peserta_mandiri'],
                                  "jumlah_kelompok_hukum":
                                      _dataPengembangan[index]
                                          ['jumlah_kelompok_hukum'],
                                  "jumlah_peserta_hukum":
                                      _dataPengembangan[index]
                                          ['jumlah_peserta_hukum'],
                                  "catatan": _dataPengembangan[index]
                                                  ['catatan'] !=
                                              null &&
                                          _dataPengembangan[index]['catatan']
                                              .isNotEmpty
                                      ? _dataPengembangan[index]['catatan']
                                      : "-",
                                  "status": _dataPengembangan[index]['status'],
                                  "tanggal": _dataPengembangan[index]
                                      ['tanggal'],
                                  "waktu": _dataPengembangan[index]['waktu'],
                                  "created_at": _dataPengembangan[index]
                                      ['created_at'],
                                  "updated_at": _dataPengembangan[index]
                                      ['updated_at'],
                                },
                              ),
                            ),
                          );
                        },
                        contentPadding: EdgeInsets.all(20),
                        // leading: Container(
                        //   width: 80,
                        //   height: 80,
                        //   child: Image.network(
                        //     "${ApiHelper.url}../public/frontend2/Bidang_LingkunganHidup/${_dataKLH[index]['gambar_upload']}",
                        //     fit: BoxFit.cover,
                        //   ),
                        // ),
                        title: Text(
                          "Pengembangan Kehidupan Berkoperasi",
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                "Id Laporan : ${_dataPengembangan[index]['id_pokja2_bidang2']}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                "Pemula :",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10, left: 10),
                              child: Text("Jumlah Kelompok"),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10, top: 5),
                              child: Text(
                                "${_dataPengembangan[index]['jumlah_kelompok_pemula']}",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10, left: 10),
                              child: Text("Jumlah Peserta"),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10, top: 5),
                              child: Text(
                                "${_dataPengembangan[index]['jumlah_peserta_pemula']}",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.calendar_month_outlined,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "${_dataPengembangan[index]['tanggal']}",
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: EdgeInsets.only(left: 20),
                                  //   child: Icon(
                                  //     Icons.access_time_rounded,
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding: EdgeInsets.only(left: 10),
                                  //   child: Text(
                                  //     "${_dataPengembangan[index]['waktu']}",
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            // Container(
                            //   padding: EdgeInsets.only(top: 20),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.end,
                            //     crossAxisAlignment: CrossAxisAlignment.center,
                            //     children: [
                            //       Icon(
                            //         Icons.arrow_back_ios,
                            //         color: ktextColor,
                            //       ),
                            //       Text(
                            //         "Lihat Detail",
                            //         style: TextStyle(
                            //           fontSize: 16,
                            //           color: ktextColor,
                            //           fontWeight: FontWeight.w500,
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: EdgeInsets.only(left: 5),
                            //         child: Icon(
                            //           Icons.arrow_forward_ios,
                            //           color: ktextColor,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // )
                          ],
                        ),
                        trailing: Column(
                          children: [
                            InkWell(
                              child: Container(
                                width: 100,
                                height: 40,
                                child: Card(
                                  color: WarnaButton(
                                      stts: _dataPengembangan[index]['status']),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${_dataPengembangan[index]['status']}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
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
                    ),
                  );
                },
              ),
              ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                itemCount: _dataKader3.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 2.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return PageDetailKader3();
                              },
                              settings: RouteSettings(
                                arguments: {
                                  "id_kader_pokja3": _dataKader3[index]
                                      ['id_kader_pokja3'],
                                  "pangan": _dataKader3[index]['pangan'],
                                  "sandang": _dataKader3[index]['sandang'],
                                  "tata_laksana_rumah": _dataKader3[index]
                                      ['tata_laksana_rumah'],
                                  "catatan":
                                      _dataKader3[index]['catatan'] != null &&
                                              _dataKader3[index]['catatan']
                                                  .isNotEmpty
                                          ? _dataKader3[index]['catatan']
                                          : "-",
                                  "status": _dataKader3[index]['status'],
                                  "tanggal": _dataKader3[index]['tanggal'],
                                  "waktu": _dataKader3[index]['waktu'],
                                  "created_at": _dataKader3[index]
                                      ['created_at'],
                                  "updated_at": _dataKader3[index]
                                      ['updated_at'],
                                },
                              ),
                            ),
                          );
                        },
                        contentPadding: EdgeInsets.all(20),
                        // leading: Container(
                        //   width: 80,
                        //   height: 80,
                        //   child: Image.network(
                        //     "${ApiHelper.url}../public/frontend2/Bidang_LingkunganHidup/${_dataKLH[index]['gambar_upload']}",
                        //     fit: BoxFit.cover,
                        //   ),
                        // ),
                        title: Text(
                          "Laporan Kader Pokja III",
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                "Id Laporan : ${_dataKader3[index]['id_kader_pokja3']}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Text("Pangan"),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Text(
                                        "${_dataKader3[index]['pangan']}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Text("Sandang"),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Text(
                                        "${_dataKader3[index]['sandang']}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Text("Tata Laksana Rumah"),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    "${_dataKader3[index]['tata_laksana_rumah']}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.calendar_month_outlined,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "${_dataKader3[index]['tanggal']}",
                                      style: TextStyle(
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: EdgeInsets.only(left: 20),
                                  //   child: Icon(
                                  //     Icons.access_time_rounded,
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding: EdgeInsets.only(left: 10),
                                  //   child: Text(
                                  //     "${_dataKader1[index]['waktu']}",
                                  //     style: TextStyle(
                                  //       letterSpacing: 1,
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            // Container(
                            //   padding: EdgeInsets.only(top: 20),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.end,
                            //     crossAxisAlignment: CrossAxisAlignment.center,
                            //     children: [
                            //       Icon(
                            //         Icons.arrow_back_ios,
                            //         color: ktextColor,
                            //       ),
                            //       Text(
                            //         "Lihat Detail",
                            //         style: TextStyle(
                            //           fontSize: 16,
                            //           color: ktextColor,
                            //           fontWeight: FontWeight.w500,
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: EdgeInsets.only(left: 5),
                            //         child: Icon(
                            //           Icons.arrow_forward_ios,
                            //           color: ktextColor,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // )
                          ],
                        ),
                        trailing: Column(
                          children: [
                            InkWell(
                              child: Container(
                                width: 100,
                                height: 40,
                                child: Card(
                                  color: WarnaButton(
                                      stts: _dataKader3[index]['status']),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${_dataKader3[index]['status']}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
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
                    ),
                  );
                },
              ),
              ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                itemCount: _dataPangan.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 2.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return PageDetailPangan();
                              },
                              settings: RouteSettings(
                                arguments: {
                                  "id_pokja3_bidang1": _dataPangan[index]
                                      ['id_pokja3_bidang1'],
                                  "beras": _dataPangan[index]['beras'],
                                  "non_beras": _dataPangan[index]['non_beras'],
                                  "peternakan": _dataPangan[index]
                                      ['peternakan'],
                                  "perikanan": _dataPangan[index]['perikanan'],
                                  "warung_hidup": _dataPangan[index]
                                      ['warung_hidup'],
                                  "lumbung_hidup": _dataPangan[index]
                                      ['lumbung_hidup'],
                                  "toga": _dataPangan[index]['toga'],
                                  "tanaman_keras": _dataPangan[index]
                                      ['tanaman_keras'],
                                  "status": _dataPangan[index]['status'],
                                  "tanggal": _dataPangan[index]['tanggal'],
                                  "catatan":
                                      _dataPangan[index]['catatan'] != null &&
                                              _dataPangan[index]['catatan']
                                                  .isNotEmpty
                                          ? _dataPangan[index]['catatan']
                                          : "-",
                                  "waktu": _dataPangan[index]['waktu'],
                                  "created_at": _dataPangan[index]
                                      ['created_at'],
                                  "updated_at": _dataPangan[index]
                                      ['updated_at'],
                                },
                              ),
                            ),
                          );
                        },
                        contentPadding: EdgeInsets.all(20),
                        // leading: Container(
                        //   width: 80,
                        //   height: 80,
                        //   child: Image.network(
                        //     "${ApiHelper.url}../public/frontend2/Bidang_LingkunganHidup/${_dataKLH[index]['gambar_upload']}",
                        //     fit: BoxFit.cover,
                        //   ),
                        // ),
                        title: Text(
                          "Laporan Pangan",
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                "Id Laporan : ${_dataPangan[index]['id_pokja3_bidang1']}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                "Makanan Pokok :",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10, left: 10),
                              child: Text("Beras"),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10, top: 5),
                              child: Text(
                                "${_dataPangan[index]['beras']}",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10, left: 10),
                              child: Text("Non Beras"),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10, top: 5),
                              child: Text(
                                "${_dataPangan[index]['non_beras']}",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.calendar_month_outlined,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "${_dataPangan[index]['tanggal']}",
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: EdgeInsets.only(left: 20),
                                  //   child: Icon(
                                  //     Icons.access_time_rounded,
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding: EdgeInsets.only(left: 10),
                                  //   child: Text(
                                  //     "${_dataPangan[index]['waktu']}",
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            // Container(
                            //   padding: EdgeInsets.only(top: 20),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.end,
                            //     crossAxisAlignment: CrossAxisAlignment.center,
                            //     children: [
                            //       Icon(
                            //         Icons.arrow_back_ios,
                            //         color: ktextColor,
                            //       ),
                            //       Text(
                            //         "Lihat Detail",
                            //         style: TextStyle(
                            //           fontSize: 16,
                            //           color: ktextColor,
                            //           fontWeight: FontWeight.w500,
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: EdgeInsets.only(left: 5),
                            //         child: Icon(
                            //           Icons.arrow_forward_ios,
                            //           color: ktextColor,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // )
                          ],
                        ),
                        trailing: Column(
                          children: [
                            InkWell(
                              child: Container(
                                width: 100,
                                height: 40,
                                child: Card(
                                  color: WarnaButton(
                                      stts: _dataPangan[index]['status']),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${_dataPangan[index]['status']}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
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
                    ),
                  );
                },
              ),
              ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                itemCount: _dataIndustri.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 2.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return PageDetailSandang();
                              },
                              settings: RouteSettings(
                                arguments: {
                                  "id_pokja3_bidang2": _dataIndustri[index]
                                      ['id_pokja3_bidang2'],
                                  "pangan": _dataIndustri[index]['pangan'],
                                  "sandang": _dataIndustri[index]['sandang'],
                                  "jasa": _dataIndustri[index]['jasa'],
                                  "catatan":
                                      _dataIndustri[index]['catatan'] != null &&
                                              _dataIndustri[index]['catatan']
                                                  .isNotEmpty
                                          ? _dataIndustri[index]['catatan']
                                          : "-",
                                  "status": _dataIndustri[index]['status'],
                                  "tanggal": _dataIndustri[index]['tanggal'],
                                  "waktu": _dataIndustri[index]['waktu'],
                                  "created_at": _dataIndustri[index]
                                      ['created_at'],
                                  "updated_at": _dataIndustri[index]
                                      ['updated_at'],
                                },
                              ),
                            ),
                          );
                        },
                        contentPadding: EdgeInsets.all(20),
                        // leading: Container(
                        //   width: 80,
                        //   height: 80,
                        //   child: Image.network(
                        //     "${ApiHelper.url}../public/frontend2/Bidang_LingkunganHidup/${_dataKLH[index]['gambar_upload']}",
                        //     fit: BoxFit.cover,
                        //   ),
                        // ),
                        title: Text(
                          "Laporan Sandang",
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                "Id Laporan : ${_dataIndustri[index]['id_pokja3_bidang2']}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Text("Pangan"),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Text(
                                        "${_dataIndustri[index]['pangan']}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Text("Sandang"),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Text(
                                        "${_dataIndustri[index]['sandang']}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Text("Jasa"),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    "${_dataIndustri[index]['jasa']}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.calendar_month_outlined,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "${_dataIndustri[index]['tanggal']}",
                                      style: TextStyle(
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: EdgeInsets.only(left: 20),
                                  //   child: Icon(
                                  //     Icons.access_time_rounded,
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding: EdgeInsets.only(left: 10),
                                  //   child: Text(
                                  //     "${_dataIndustri[index]['waktu']}",
                                  //     style: TextStyle(
                                  //       letterSpacing: 1,
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            // Container(
                            //   padding: EdgeInsets.only(top: 20),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.end,
                            //     crossAxisAlignment: CrossAxisAlignment.center,
                            //     children: [
                            //       Icon(
                            //         Icons.arrow_back_ios,
                            //         color: ktextColor,
                            //       ),
                            //       Text(
                            //         "Lihat Detail",
                            //         style: TextStyle(
                            //           fontSize: 16,
                            //           color: ktextColor,
                            //           fontWeight: FontWeight.w500,
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: EdgeInsets.only(left: 5),
                            //         child: Icon(
                            //           Icons.arrow_forward_ios,
                            //           color: ktextColor,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // )
                          ],
                        ),
                        trailing: Column(
                          children: [
                            InkWell(
                              child: Container(
                                width: 100,
                                height: 40,
                                child: Card(
                                  color: WarnaButton(
                                      stts: _dataIndustri[index]['status']),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${_dataIndustri[index]['status']}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
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
                    ),
                  );
                },
              ),
              ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                itemCount: _dataPerumahan.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 2.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return PageDetailPerumahan();
                              },
                              settings: RouteSettings(
                                arguments: {
                                  "id_pokja3_bidang3": _dataPerumahan[index]
                                      ['id_pokja3_bidang3'],
                                  "layak_huni": _dataPerumahan[index]
                                      ['layak_huni'],
                                  "tidak_layak": _dataPerumahan[index]
                                      ['tidak_layak'],
                                  "catatan": _dataPerumahan[index]['catatan'] !=
                                              null &&
                                          _dataPerumahan[index]['catatan']
                                              .isNotEmpty
                                      ? _dataPerumahan[index]['catatan']
                                      : "-",
                                  "status": _dataPerumahan[index]['status'],
                                  "tanggal": _dataPerumahan[index]['tanggal'],
                                  "waktu": _dataPerumahan[index]['waktu'],
                                  "created_at": _dataPerumahan[index]
                                      ['created_at'],
                                  "updated_at": _dataPerumahan[index]
                                      ['updated_at'],
                                },
                              ),
                            ),
                          );
                        },
                        contentPadding: EdgeInsets.all(20),
                        // leading: Container(
                        //   width: 80,
                        //   height: 80,
                        //   child: Image.network(
                        //     "${ApiHelper.url}../public/frontend2/Bidang_LingkunganHidup/${_dataKLH[index]['gambar_upload']}",
                        //     fit: BoxFit.cover,
                        //   ),
                        // ),
                        title: Text(
                          "Perumahan & Tata Laksana Rumah Tangga",
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                "Id Laporan : ${_dataPerumahan[index]['id_pokja3_bidang3']}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Text("Sehat & Layak Huni"),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    "${_dataPerumahan[index]['layak_huni']}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Text("Tidak Sehat & Tidak Layak Huni"),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    "${_dataPerumahan[index]['tidak_layak']}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.calendar_month_outlined,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "${_dataPerumahan[index]['tanggal']}",
                                      style: TextStyle(
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: EdgeInsets.only(left: 20),
                                  //   child: Icon(
                                  //     Icons.access_time_rounded,
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding: EdgeInsets.only(left: 10),
                                  //   child: Text(
                                  //     "${_dataPerumahan[index]['waktu']}",
                                  //     style: TextStyle(
                                  //       letterSpacing: 1,
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            // Container(
                            //   padding: EdgeInsets.only(top: 20),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.end,
                            //     crossAxisAlignment: CrossAxisAlignment.center,
                            //     children: [
                            //       Icon(
                            //         Icons.arrow_back_ios,
                            //         color: ktextColor,
                            //       ),
                            //       Text(
                            //         "Lihat Detail",
                            //         style: TextStyle(
                            //           fontSize: 16,
                            //           color: ktextColor,
                            //           fontWeight: FontWeight.w500,
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: EdgeInsets.only(left: 5),
                            //         child: Icon(
                            //           Icons.arrow_forward_ios,
                            //           color: ktextColor,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // )
                          ],
                        ),
                        trailing: Column(
                          children: [
                            InkWell(
                              child: Container(
                                width: 100,
                                height: 40,
                                child: Card(
                                  color: WarnaButton(
                                      stts: _dataPerumahan[index]['status']),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${_dataPerumahan[index]['status']}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
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
                    ),
                  );
                },
              ),
              ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                itemCount: _dataKader4.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 2.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return PageDetailKader4();
                              },
                              settings: RouteSettings(
                                arguments: {
                                  "id_kader_pokja4": _dataKader4[index]
                                      ['id_kader_pokja4'],
                                  "posyandu": _dataKader4[index]['posyandu'],
                                  "gizi": _dataKader4[index]['gizi'],
                                  "kesling": _dataKader4[index]['kesling'],
                                  "penyuluhan_narkoba": _dataKader4[index]
                                      ['penyuluhan_narkoba'],
                                  "PHBS": _dataKader4[index]['PHBS'],
                                  "KB": _dataKader4[index]['KB'],
                                  "catatan":
                                      _dataKader4[index]['catatan'] != null &&
                                              _dataKader4[index]['catatan']
                                                  .isNotEmpty
                                          ? _dataKader4[index]['catatan']
                                          : "-",
                                  "status": _dataKader4[index]['status'],
                                  "tanggal": _dataKader4[index]['tanggal'],
                                  "waktu": _dataKader4[index]['waktu'],
                                  "created_at": _dataKader4[index]
                                      ['created_at'],
                                  "updated_at": _dataKader4[index]
                                      ['updated_at'],
                                },
                              ),
                            ),
                          );
                        },
                        contentPadding: EdgeInsets.all(20),
                        // leading: Container(
                        //   width: 80,
                        //   height: 80,
                        //   child: Image.network(
                        //     "${ApiHelper.url}../public/frontend2/Bidang_LingkunganHidup/${_dataKLH[index]['gambar_upload']}",
                        //     fit: BoxFit.cover,
                        //   ),
                        // ),
                        title: Text(
                          "Laporan Kader Pokja IV",
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                "Id Laporan : ${_dataKader4[index]['id_kader_pokja4']}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Text("Posyandu"),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Text(
                                        "${_dataKader4[index]['posyandu']}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Text("Gizi"),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Text(
                                        "${_dataKader4[index]['gizi']}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.calendar_month_outlined,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "${_dataKader4[index]['tanggal']}",
                                      style: TextStyle(
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: EdgeInsets.only(left: 20),
                                  //   child: Icon(
                                  //     Icons.access_time_rounded,
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding: EdgeInsets.only(left: 10),
                                  //   child: Text(
                                  //     "${_dataKader4[index]['waktu']}",
                                  //     style: TextStyle(
                                  //       letterSpacing: 1,
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            // Container(
                            //   padding: EdgeInsets.only(top: 20),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.end,
                            //     crossAxisAlignment: CrossAxisAlignment.center,
                            //     children: [
                            //       Icon(
                            //         Icons.arrow_back_ios,
                            //         color: ktextColor,
                            //       ),
                            //       Text(
                            //         "Lihat Detail",
                            //         style: TextStyle(
                            //           fontSize: 16,
                            //           color: ktextColor,
                            //           fontWeight: FontWeight.w500,
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: EdgeInsets.only(left: 5),
                            //         child: Icon(
                            //           Icons.arrow_forward_ios,
                            //           color: ktextColor,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // )
                          ],
                        ),
                        trailing: Column(
                          children: [
                            InkWell(
                              child: Container(
                                width: 100,
                                height: 40,
                                child: Card(
                                  color: WarnaButton(
                                      stts: _dataKader4[index]['status']),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${_dataKader4[index]['status']}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
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
                    ),
                  );
                },
              ),
              ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                itemCount: _dataKesehatan.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 2.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return PageDetailKader1();
                              },
                              settings: RouteSettings(
                                arguments: {
                                  "id_p_sehat": _dataKesehatan[index]
                                      ['id_p_sehat'],
                                  "jml_posyandu": _dataKesehatan[index]
                                      ['jumlah_posyandu'],
                                  "jml_posint": _dataKesehatan[index]
                                      ['jumlah_posyandu_iterasi'],
                                  "jml_klp": _dataKesehatan[index]
                                      ['jumlah_klp'],
                                  "jml_anggota": _dataKesehatan[index]
                                      ['jumlah_anggota'],
                                  "jml_kartu": _dataKesehatan[index]
                                      ['jumlah_kartu_gratis'],
                                  "catatan": _dataKesehatan[index]['catatan'] !=
                                              null &&
                                          _dataKesehatan[index]['catatan']
                                              .isNotEmpty
                                      ? _dataKesehatan[index]['catatan']
                                      : "-",
                                  "tanggal": _dataKesehatan[index]['tanggal'],
                                  "waktu": _dataKesehatan[index]['waktu'],
                                  "status": _dataKesehatan[index]['status'],
                                },
                              ),
                            ),
                          );
                        },
                        contentPadding: EdgeInsets.all(20),
                        // leading: Container(
                        //   width: 80,
                        //   height: 80,
                        //   child: Image.network(
                        //     "${ApiHelper.url}../public/frontend2/Bidang_LingkunganHidup/${_dataKLH[index]['gambar_upload']}",
                        //     fit: BoxFit.cover,
                        //   ),
                        // ),
                        title: Text(
                          "Kesehatan",
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                "Id Laporan : ${_dataKesehatan[index]['id_laporan_sehat']}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Text("Jumlah Posyandu"),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    "${_dataKesehatan[index]['jumlah_posyandu']}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Text("Posyandu Terintegrasi"),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    "${_dataKesehatan[index]['jumlah_posyandu_iterasi']}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.calendar_month_outlined,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "${_dataKesehatan[index]['tanggal']}",
                                      style: TextStyle(
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: EdgeInsets.only(left: 20),
                                  //   child: Icon(
                                  //     Icons.access_time_rounded,
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding: EdgeInsets.only(left: 10),
                                  //   child: Text(
                                  //     "${_dataKesehatan[index]['waktu']}",
                                  //     style: TextStyle(
                                  //       letterSpacing: 1,
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            // Container(
                            //   padding: EdgeInsets.only(top: 20),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.end,
                            //     crossAxisAlignment: CrossAxisAlignment.center,
                            //     children: [
                            //       Icon(
                            //         Icons.arrow_back_ios,
                            //         color: ktextColor,
                            //       ),
                            //       Text(
                            //         "Lihat Detail",
                            //         style: TextStyle(
                            //           fontSize: 16,
                            //           color: ktextColor,
                            //           fontWeight: FontWeight.w500,
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: EdgeInsets.only(left: 5),
                            //         child: Icon(
                            //           Icons.arrow_forward_ios,
                            //           color: ktextColor,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // )
                          ],
                        ),
                        trailing: Column(
                          children: [
                            InkWell(
                              child: Container(
                                width: 100,
                                height: 40,
                                child: Card(
                                  color: WarnaButton(
                                      stts: _dataKesehatan[index]['status']),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${_dataKesehatan[index]['status']}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
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
                    ),
                  );
                },
              ),
              ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                itemCount: _dataKLH.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 2.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true)
                              .pushReplacement(
                            MaterialPageRoute(
                              builder: (context) {
                                return PageDetailKlh();
                              },
                              settings: RouteSettings(
                                arguments: {
                                  "jamban": _dataKLH[index]['jamban'],
                                  "tanggal": _dataKLH[index]['tanggal'],
                                  "spal": _dataKLH[index]['spal'],
                                  "tps": _dataKLH[index]['tps'],
                                  "mck": _dataKLH[index]['mck'],
                                  "pdam": _dataKLH[index]['pdam'],
                                  "sumur": _dataKLH[index]['sumur'],
                                  "dll": _dataKLH[index]['dll'],
                                  "stss": _dataKLH[index]['status'],
                                  "waktu": _dataKLH[index]['waktu'],
                                  "catatan": _dataKLH[index]['catatan'] !=
                                              null &&
                                          _dataKLH[index]['catatan']
                                              .isNotEmpty
                                      ? _dataKLH[index]['catatan']
                                      : "-",
                                },
                              ),
                            ),
                          );
                        },
                        contentPadding: EdgeInsets.all(20),
                        // leading: Container(
                        //   width: 80,
                        //   height: 80,
                        //   child: Image.network(
                        //     "${ApiHelper.url}../public/frontend2/Bidang_LingkunganHidup/${_dataKLH[index]['gambar_upload']}",
                        //     fit: BoxFit.cover,
                        //   ),
                        // ),
                        title: Text(
                          "Kelestarian Lingkungan Hidup",
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                "Id Laporan : ${_dataKLH[index]['id_kelpangan']}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Text("Jamban"),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Text(
                                        "${_dataKLH[index]['jamban']}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 20),
                                      child: Text("spal"),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Text(
                                        "${_dataKLH[index]['spal']}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.calendar_month_outlined,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "${_dataKLH[index]['tanggal']}",
                                      style: TextStyle(
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: EdgeInsets.only(left: 20),
                                  //   child: Icon(
                                  //     Icons.access_time_rounded,
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding: EdgeInsets.only(left: 10),
                                  //   child: Text(
                                  //     "${_dataKLH[index]['waktu']}",
                                  //     style: TextStyle(
                                  //       letterSpacing: 1,
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            // Container(
                            //   padding: EdgeInsets.only(top: 20),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.end,
                            //     crossAxisAlignment: CrossAxisAlignment.center,
                            //     children: [
                            //       Icon(
                            //         Icons.arrow_back_ios,
                            //         color: ktextColor,
                            //       ),
                            //       Text(
                            //         "Lihat Detail",
                            //         style: TextStyle(
                            //           fontSize: 16,
                            //           color: ktextColor,
                            //           fontWeight: FontWeight.w500,
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: EdgeInsets.only(left: 5),
                            //         child: Icon(
                            //           Icons.arrow_forward_ios,
                            //           color: ktextColor,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // )
                          ],
                        ),
                        trailing: Column(
                          children: [
                            InkWell(
                              child: Container(
                                width: 100,
                                height: 40,
                                child: Card(
                                  color: WarnaButton(
                                      stts: _dataKLH[index]['status']),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${_dataKLH[index]['status']}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
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
                    ),
                  );
                },
              ),
              ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                itemCount: _dataPSehat.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 2.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return PageDetailKader1();
                              },
                              settings: RouteSettings(
                                arguments: {
                                  "id_laporan_sehat": _dataPSehat[index]
                                      ['id_laporan_sehat'],
                                  "J_Psubur": _dataPSehat[index]['J_Psubur'],
                                  "J_Wsubur": _dataPSehat[index]['J_Wsubur'],
                                  "Kb_p": _dataPSehat[index]['Kb_p'],
                                  "Kb_w": _dataPSehat[index]['Kb_w'],
                                  "Kk_tbg": _dataPSehat[index]['Kk_tbg'],
                                  "catatan":
                                      _dataPSehat[index]['catatan'] != null &&
                                              _dataPSehat[index]['catatan']
                                                  .isNotEmpty
                                          ? _dataPSehat[index]['catatan']
                                          : "-",
                                  "tanggal": _dataPSehat[index]['tanggal'],
                                  "waktu": _dataPSehat[index]['waktu'],
                                  "status": _dataPSehat[index]['status'],
                                },
                              ),
                            ),
                          );
                        },
                        contentPadding: EdgeInsets.all(20),
                        // leading: Container(
                        //   width: 80,
                        //   height: 80,
                        //   child: Image.network(
                        //     "${ApiHelper.url}../public/frontend2/Bidang_LingkunganHidup/${_dataKLH[index]['gambar_upload']}",
                        //     fit: BoxFit.cover,
                        //   ),
                        // ),
                        title: Text(
                          "Perencanaan Sehat",
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                "Id Laporan : ${_dataPSehat[index]['id_p_sehat']}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Text("Pria Usia Subur"),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    "${_dataPSehat[index]['J_Psubur']}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Text("Wanita Usia Subur"),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    "${_dataPSehat[index]['J_Wsubur']}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.calendar_month_outlined,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "${_dataPSehat[index]['tanggal']}",
                                      style: TextStyle(
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: EdgeInsets.only(left: 20),
                                  //   child: Icon(
                                  //     Icons.access_time_rounded,
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding: EdgeInsets.only(left: 10),
                                  //   child: Text(
                                  //     "${_dataPSehat[index]['waktu']}",
                                  //     style: TextStyle(
                                  //       letterSpacing: 1,
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            // Container(
                            //   padding: EdgeInsets.only(top: 20),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.end,
                            //     crossAxisAlignment: CrossAxisAlignment.center,
                            //     children: [
                            //       Icon(
                            //         Icons.arrow_back_ios,
                            //         color: ktextColor,
                            //       ),
                            //       Text(
                            //         "Lihat Detail",
                            //         style: TextStyle(
                            //           fontSize: 16,
                            //           color: ktextColor,
                            //           fontWeight: FontWeight.w500,
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: EdgeInsets.only(left: 5),
                            //         child: Icon(
                            //           Icons.arrow_forward_ios,
                            //           color: ktextColor,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // )
                          ],
                        ),
                        trailing: Column(
                          children: [
                            InkWell(
                              child: Container(
                                width: 100,
                                height: 40,
                                child: Card(
                                  color: WarnaButton(
                                      stts: _dataPSehat[index]['status']),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${_dataPSehat[index]['status']}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
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
                    ),
                  );
                },
              ),
              ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                itemCount: _dataUmum.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 2.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return PageDetailPengembangan();
                              },
                              settings: RouteSettings(
                                arguments: {
                                  "id_laporan_umum": _dataUmum[index]
                                      ['id_laporan_umum'],
                                  "dusun_lingkungan": _dataUmum[index]
                                      ['dusun_lingkungan'],
                                  "PKK_RW": _dataUmum[index]['PKK_RW'],
                                  "desa_wisma": _dataUmum[index]['desa_wisma'],
                                  "KRT": _dataUmum[index]['KRT'],
                                  "KK": _dataUmum[index]['KK'],
                                  "jiwa_laki": _dataUmum[index]['jiwa_laki'],
                                  "jiwa_perempuan": _dataUmum[index]
                                      ['jiwa_perempuan'],
                                  "anggota_laki": _dataUmum[index]
                                      ['anggota_laki'],
                                  "anggota_perempuan": _dataUmum[index]
                                      ['anggota_perempuan'],
                                  "umum_laki": _dataUmum[index]['umum_laki'],
                                  "umum_perempuan": _dataUmum[index]
                                      ['umum_perempuan'],
                                  "khusus_laki": _dataUmum[index]
                                      ['khusus_laki'],
                                  "khusus_perempuan": _dataUmum[index]
                                      ['khusus_perempuan'],
                                  "hororer_laki": _dataUmum[index]
                                      ['hororer_laki'],
                                  "hororer_perempuan": _dataUmum[index]
                                      ['hororer_perempuan'],
                                  "bantuan_laki": _dataUmum[index]
                                      ['bantuan_laki'],
                                  "bantuan_perempuan": _dataUmum[index]
                                      ['bantuan_perempuan'],
                                  "catatan": _dataUmum[index]['catatan'] !=
                                              null &&
                                          _dataUmum[index]['catatan'].isNotEmpty
                                      ? _dataUmum[index]['catatan']
                                      : "-",
                                  "status": _dataUmum[index]['status'],
                                  "tanggal": _dataUmum[index]['tanggal'],
                                  "waktu": _dataUmum[index]['waktu'],
                                  "created_at": _dataUmum[index]['created_at'],
                                  "updated_at": _dataUmum[index]['updated_at'],
                                },
                              ),
                            ),
                          );
                        },
                        contentPadding: EdgeInsets.all(20),
                        // leading: Container(
                        //   width: 80,
                        //   height: 80,
                        //   child: Image.network(
                        //     "${ApiHelper.url}../public/frontend2/Bidang_LingkunganHidup/${_dataKLH[index]['gambar_upload']}",
                        //     fit: BoxFit.cover,
                        //   ),
                        // ),
                        title: Text(
                          "Laporan Umum",
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                "Id Laporan : ${_dataUmum[index]['id_laporan_umum']}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                "Jumlah Kelompok :",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10, left: 10),
                              child: Text("Dusun Lingkungan"),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10, top: 5),
                              child: Text(
                                "${_dataUmum[index]['dusun_lingkungan']}",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10, left: 10),
                              child: Text("PKK RW"),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10, top: 5),
                              child: Text(
                                "${_dataUmum[index]['PKK_RW']}",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.calendar_month_outlined,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "${_dataUmum[index]['tanggal']}",
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: EdgeInsets.only(left: 20),
                                  //   child: Icon(
                                  //     Icons.access_time_rounded,
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding: EdgeInsets.only(left: 10),
                                  //   child: Text(
                                  //     "${_dataUmum[index]['waktu']}",
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            // Container(
                            //   padding: EdgeInsets.only(top: 20),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.end,
                            //     crossAxisAlignment: CrossAxisAlignment.center,
                            //     children: [
                            //       Icon(
                            //         Icons.arrow_back_ios,
                            //         color: ktextColor,
                            //       ),
                            //       Text(
                            //         "Lihat Detail",
                            //         style: TextStyle(
                            //           fontSize: 16,
                            //           color: ktextColor,
                            //           fontWeight: FontWeight.w500,
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: EdgeInsets.only(left: 5),
                            //         child: Icon(
                            //           Icons.arrow_forward_ios,
                            //           color: ktextColor,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // )
                          ],
                        ),
                        trailing: Column(
                          children: [
                            InkWell(
                              child: Container(
                                width: 100,
                                height: 40,
                                child: Card(
                                  color: WarnaButton(
                                      stts: _dataUmum[index]['status']),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${_dataUmum[index]['status']}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
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
                    ),
                  );
                },
              ),
              ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                itemCount: _gallery.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 2.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return DetailGallery();
                              },
                              settings: RouteSettings(
                                arguments: {
                                  "idGalery": _gallery[index]['id'],
                                  "deskripsi": _gallery[index]['deskripsi'],
                                  "pokja": _gallery[index]['pokja'],
                                  "bidang": _gallery[index]['bidang'],
                                  "gambar": _gallery[index]['gambar'],
                                  "status": _gallery[index]['status'],
                                  "tanggal": _gallery[index]['tanggal'],
                                  "user": _gallery[index]['id_user'],
                                  "waktu": _gallery[index]['waktu'],
                                },
                              ),
                            ),
                          );
                        },
                        contentPadding: EdgeInsets.all(20),
                        leading: Container(
                          width: 80,
                          height: 80,
                          child: Image.network(
                            "${ApiHelper.url}../public/frontend2/gallery2/${_gallery[index]['gambar']}",
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          "${_gallery[index]['deskripsi']}",
                          maxLines: 2,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Text(
                            "${_gallery[index]['tanggal']}",
                          ),
                        ),
                        trailing: InkWell(
                          child: Container(
                            width: 100,
                            height: 40,
                            child: Card(
                              color:
                                  WarnaButton(stts: _gallery[index]['status']),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 5,
                                ),
                                child: Center(
                                  child: Text(
                                    "${_gallery[index]['status']}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),

              // ListView.builder(
              //   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              //   itemCount: _dataPSehat.length,
              //   itemBuilder: (context, index) {
              //     return Padding(
              //       padding: const EdgeInsets.symmetric(vertical: 10),
              //       child: Container(
              //         decoration: BoxDecoration(
              //             color: Colors.grey.shade100,
              //             boxShadow: [
              //               BoxShadow(
              //                 color: Colors.grey,
              //                 offset: Offset(0.0, 1.0), //(x,y)
              //                 blurRadius: 2.0,
              //               ),
              //             ],
              //             borderRadius: BorderRadius.circular(10)),
              //         child: ListTile(
              //           contentPadding: EdgeInsets.all(20),
              //           leading: Container(
              //             width: 80,
              //             height: 80,
              //             child: Image.network(
              //               "${ApiHelper.url}assets/Bidang_Perencaan_Sehat/${_dataPSehat[index]['gambar']}",
              //               fit: BoxFit.cover,
              //             ),
              //           ),
              //           title: Text(
              //             "Data Perencanaan Sehat",
              //             style: TextStyle(fontWeight: FontWeight.bold),
              //           ),
              //           subtitle: Text(
              //               "Pria Subur: ${_dataPSehat[index]['J_Psubur']}"),
              //           trailing: InkWell(
              //             onTap: () {
              //               // Navigator.of(context, rootNavigator: true)
              //               //     .pushReplacement(MaterialPageRoute(
              //               //         builder: (context) {
              //               //           return PageDetailKlh();
              //               //         },
              //               //         settings: RouteSettings(arguments: {
              //               //           "jps": _dataPSehat[index]['J_Psubur'],
              //               //           "jws": _dataPSehat[index]['J_Wsubur'],
              //               //           "kbp": _dataPSehat[index]['Kb_p'],
              //               //           "kbw": _dataPSehat[index]['Kb_w'],
              //               //           "kk_tbg": _dataPSehat[index]['Kk_tbg'],
              //               //           "user": _dataPSehat[index]['id_user'],
              //               //           "tgl": _dataPSehat[index]['tanggal'],
              //               //           "gbr": _dataKLH[index]['gambar'],
              //               //           "stss": _dataKLH[index]['status'],
              //               //         })));
              //             },
              //             child: Container(
              //               width: 120,
              //               child: Card(
              //                   color: WarnaButton(
              //                       stts: _dataPSehat[index]['status']),
              //                   child: Padding(
              //                     padding: EdgeInsets.symmetric(
              //                         horizontal: 30, vertical: 5),
              //                     child: Center(
              //                       child: Text(
              //                         "${_dataPSehat[index]['status']}",
              //                         style: TextStyle(color: Colors.white),
              //                       ),
              //                     ),
              //                   )),
              //             ),
              //           ),
              //         ),
              //       ),
              //     );
              //   },
              // ),
              // Text("Cooming Soon")
            ],
          ),
        ),
      ),
    );
  }
}
