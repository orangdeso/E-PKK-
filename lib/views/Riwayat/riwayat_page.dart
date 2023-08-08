import 'package:e_pkk/helpers/ApiHelper.dart';
import 'package:e_pkk/models/DataAkun.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:e_pkk/views/Riwayat/detail_Psehat.dart';
import 'package:e_pkk/views/Riwayat/detail_gotong_royong.dart';
import 'package:e_pkk/views/Riwayat/detail_kader1.dart';
import 'package:e_pkk/views/Riwayat/detail_klh.dart';
import 'package:e_pkk/views/Riwayat/detail_penghayatan.dart';
import 'package:e_pkk/views/Riwayat/detail_perencaanSehat.dart';
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
  int _current = 0;

  //List Dynamic Data Laporan
  List<dynamic> _dataKesehatan = [];
  List<dynamic> _dataKLH = [];
  List<dynamic> _dataPSehat = [];
  List<dynamic> _gallery = [];
  List<dynamic> _dataKader1 = [];
  List<dynamic> _dataPenghayatan = [];
  List<dynamic> _dataGotong = [];

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

  //Revisi
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
    print(idAkun);
    setState(() {});
    super.initState();
  }

  Color WarnaButton({String? stts}) {
    if (stts == "Proses") {
      return Colors.orange.shade400;
    } else if (stts == "Dibatalkan") {
      return Colors.red.shade400;
    } else if (stts == "Direview") {
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
            leading: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
            ),
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
                          Navigator.of(context, rootNavigator: true)
                              .pushReplacement(
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
                                  Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Icon(
                                      Icons.access_time_rounded,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "${_dataKader1[index]['waktu']}",
                                      style: TextStyle(
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.arrow_back_ios,
                                    color: ktextColor,
                                  ),
                                  Text(
                                    "Lihat Detail",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: ktextColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: ktextColor,
                                    ),
                                  ),
                                ],
                              ),
                            )
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
                          Navigator.of(context, rootNavigator: true)
                              .pushReplacement(
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
                                  Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Icon(
                                      Icons.access_time_rounded,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "${_dataPenghayatan[index]['waktu']}",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.arrow_back_ios,
                                    color: ktextColor,
                                  ),
                                  Text(
                                    "Lihat Detail",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: ktextColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: ktextColor,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        trailing: Column(
                          children: [
                            InkWell(
                              child: Container(
                                width: 85,
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
                          Navigator.of(context, rootNavigator: true)
                              .pushReplacement(
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
                                SizedBox(
                                  width: 20,
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
                                      "${_dataGotong[index]['tanggal']}",
                                      style: TextStyle(
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Icon(
                                      Icons.access_time_rounded,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "${_dataGotong[index]['waktu']}",
                                      style: TextStyle(
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.arrow_back_ios,
                                    color: ktextColor,
                                  ),
                                  Text(
                                    "Lihat Detail",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: ktextColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: ktextColor,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        trailing: Column(
                          children: [
                            InkWell(
                              child: Container(
                                width: 85,
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
                          Navigator.of(context, rootNavigator: true)
                              .pushReplacement(
                            MaterialPageRoute(
                              builder: (context) {
                                return PageDetailSehat();
                              },
                              settings: RouteSettings(
                                arguments: {
                                  "gambar": _dataKesehatan[index]
                                      ['gambar_upload'],
                                  "tanggal": _dataKesehatan[index]['tanggal'],
                                  "kategori_laporan": _dataKesehatan[index]
                                      ['kategori_laporan'],
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
                                  "stss": _dataKesehatan[index]['status']
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
                            "${ApiHelper.url}../public/frontend2/Bidang_kesehatan/${_dataKesehatan[index]['gambar_upload']}",
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          "${_dataKesehatan[index]['kategori_laporan']}",
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
                              padding: EdgeInsets.only(top: 8),
                              child: Text(
                                  "Jumlah Posyandu : ${_dataKesehatan[index]['jumlah_posyandu']}"),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Text(
                                "${_dataKesehatan[index]['tanggal']}",
                              ),
                            ),
                          ],
                        ),
                        trailing: InkWell(
                          child: Container(
                            width: 85,
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
                                  "gambar": _dataKLH[index]['gambar_upload']
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
                            "${ApiHelper.url}../public/frontend2/Bidang_LingkunganHidup/${_dataKLH[index]['gambar_upload']}",
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          "Data Kelestarian Lingkungan Hidup",
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
                              padding: EdgeInsets.only(top: 8),
                              child:
                                  Text("Jamban : ${_dataKLH[index]['jamban']}"),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Text(
                                "${_dataKLH[index]['tanggal']}",
                              ),
                            ),
                          ],
                        ),
                        trailing: InkWell(
                          child: Container(
                            width: 85,
                            height: 40,
                            child: Card(
                              color:
                                  WarnaButton(stts: _dataKLH[index]['status']),
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
                          Navigator.of(context, rootNavigator: true)
                              .pushReplacement(
                            MaterialPageRoute(
                              builder: (context) {
                                return PageDetailPerencaanSehat();
                              },
                              settings: RouteSettings(
                                arguments: {
                                  "jps": _dataPSehat[index]['J_Psubur'],
                                  "jws": _dataPSehat[index]['J_Wsubur'],
                                  "kbp": _dataPSehat[index]['Kb_p'],
                                  "kbw": _dataPSehat[index]['Kb_w'],
                                  "kk_tbg": _dataPSehat[index]['Kk_tbg'],
                                  "user": _dataPSehat[index]['id_user'],
                                  "tgl": _dataPSehat[index]['tanggal'],
                                  "gbr": _dataPSehat[index]['gambar'],
                                  "stss": _dataPSehat[index]['status'],
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
                            "${ApiHelper.url}../public/frontend2/Bidang_Perencaan_Sehat/${_dataPSehat[index]['gambar']}",
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          "Data Perencanaan Sehat",
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
                              padding: EdgeInsets.only(top: 8),
                              child: Text(
                                  "Pria Subur: ${_dataPSehat[index]['J_Psubur']}"),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Text(
                                "${_dataPSehat[index]['tanggal']}",
                              ),
                            ),
                          ],
                        ),
                        trailing: InkWell(
                          child: Container(
                            width: 85,
                            height: 40,
                            child: Card(
                              color: WarnaButton(
                                  stts: _dataPSehat[index]['status']),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Center(
                                  child: Text(
                                    "${_dataPSehat[index]['status']}",
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
                          Navigator.of(context, rootNavigator: true)
                              .pushReplacement(
                            MaterialPageRoute(
                              builder: (context) {
                                return DetailGallery();
                              },
                              settings: RouteSettings(
                                arguments: {
                                  "status": _gallery[index]['status'],
                                  "tanggal": _gallery[index]['tanggal'],
                                  "judul": _gallery[index]['judul'],
                                  //"deskripsi": _gallery[index]['deskripsi'],
                                  "gambar": _gallery[index]['gambar'],
                                  "user": _gallery[index]['id_user'],
                                  "idGalery": _gallery[index]['id']
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
                          "${_gallery[index]['judul']}",
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
                            width: 85,
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
