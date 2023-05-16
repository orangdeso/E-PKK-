import 'package:e_pkk/helpers/ApiHelper.dart';
import 'package:e_pkk/models/LoginApi.dart';
import 'package:e_pkk/models/Riwayat.dart';
import 'package:e_pkk/models/laporanModel.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:e_pkk/views/Riwayat/detail_Psehat.dart';
import 'package:e_pkk/views/Riwayat/detail_klh.dart';
import 'package:e_pkk/views/Riwayat/page_detail_riwayat.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../SettingAkun/keamanan_page.dart';

class RiwayatPage extends StatefulWidget {
  static String route = '/Riwayat';
  // const RiwayatPage({super.key});

  @override
  State<RiwayatPage> createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage> {
  int _current = 0;
  // List<Data> listLaporan = [];
  List<dynamic> _dataKesehatan = [];
  List<dynamic> _dataKLH = [];
  List<dynamic> _dataSelesai = [];

  //Repository repository = Repository();
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

  Future<void> fetchDataSelesai() async {
    final response =
        await http.get(Uri.parse(ApiHelper.url + "getRiwayatSelesai.php"));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      setState(() {
        _dataSelesai = jsonData['data'];
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

  //

  // getData() async {
  //   listLaporan = await repository.getRiwayat();
  // }

  List<Tab> myTab = [
    Tab(
      child: Text(
        "Kesehatan",
        style: GoogleFonts.inter(
          textStyle: TextStyle(),
        ),
      ),
    ),
    Tab(
      child: Text(
        "KLH",
        style: GoogleFonts.inter(
          textStyle: TextStyle(),
        ),
      ),
    ),
    Tab(
      child: Text(
        "P. Sehat",
        style: GoogleFonts.inter(
          textStyle: TextStyle(),
        ),
      ),
    ),
    Tab(
      child: Text(
        "Galeri",
        style: GoogleFonts.inter(
          textStyle: TextStyle(),
        ),
      ),
    ),
  ];

  @override
  void initState() {
    fetchDataKesehatan(idUser: "5");
    fetchDataKLH(idUser: "5");
    fetchDataSelesai();
    super.initState();
  }

  Color WarnaButton({String? stts}) {
    if (stts == "Proses") {
      return Colors.blueAccent;
    } else {
      return Colors.green;
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
                fontWeight: FontWeight.w500,
              ),
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: ktextColor,
            bottom: TabBar(
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
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(20),
                        leading: Container(
                          width: 80,
                          height: 80,
                          child: Image.network(
                            "${ApiHelper.url}assets/Bidang_kesehatan/${_dataKesehatan[index]['gambar_upload']}",
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          "${_dataKesehatan[index]['kategori_laporan']}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            "Jumlah Posyandu : ${_dataKesehatan[index]['jumlah_posyandu']}"),
                        trailing: InkWell(
                          onTap: () {
                            // Navigator.pushReplacement(context,
                            //     MaterialPageRoute(builder: (context) {
                            //   return PageDetailSehat();
                            // }));

                            Navigator.of(context, rootNavigator: true)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (context) {
                                      return PageDetailSehat();
                                    },
                                    settings: RouteSettings(arguments: {
                                      "gambar": _dataKesehatan[index]
                                          ['gambar_upload'],
                                      "tanggal": _dataKesehatan[index]
                                          ['tanggal'],
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
                                    })));
                          },
                          child: Container(
                            width: 120,
                            child: Card(
                                color: WarnaButton(
                                    stts: _dataKesehatan[index]['status']),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 5),
                                  child: Center(
                                    child: Text(
                                      "${_dataKesehatan[index]['status']}",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                )),
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
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(20),
                        leading: Container(
                          width: 80,
                          height: 80,
                          child: Image.network(
                            "${ApiHelper.url}assets/Bidang_LingkunganHidup/${_dataKLH[index]['gambar_upload']}",
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          "Data KLH",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("Jamban : ${_dataKLH[index]['jamban']}"),
                        trailing: InkWell(
                          onTap: () {
                            Navigator.of(context, rootNavigator: true)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (context) {
                                      return PageDetailKlh();
                                    },
                                    settings: RouteSettings(arguments: {
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
                                    })));
                          },
                          child: Container(
                            width: 120,
                            child: Card(
                                color: WarnaButton(
                                    stts: _dataKLH[index]['status']),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 5),
                                  child: Center(
                                    child: Text(
                                      "${_dataKLH[index]['status']}",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                )),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                itemCount: _dataSelesai.length,
                itemBuilder: (context, index) {
                  // return ListTile(
                  //     leading: _dataSelesai[index]['image'].isNotEmpty
                  //         ? Image.network(
                  //             height: 130,
                  //             width: 130,
                  //             fit: BoxFit.cover,
                  //             _dataSelesai[index]['image'].toString())
                  //         : Image.asset(
                  //             "assets/images/po.png",
                  //             height: 130,
                  //             width: 130,
                  //             fit: BoxFit.cover,
                  //           ),
                  //     title: Text(
                  //       "${_dataSelesai[index]['title_laporan']}",
                  //       style: TextStyle(
                  //         fontSize: 16,
                  //         fontWeight: FontWeight.w500,
                  //       ),
                  //     ),
                  //     subtitle: Text(
                  //       "${_dataSelesai[index]['status']}",
                  //       style: TextStyle(
                  //         fontSize: 16,
                  //         fontWeight: FontWeight.w400,
                  //       ),
                  //     ),
                  //     trailing: Padding(
                  //       padding: EdgeInsets.only(left: 5, top: 2),
                  //       child: Text(
                  //         "${_dataSelesai[index]['tanggal']}",
                  //         style: TextStyle(
                  //           fontSize: 13,
                  //           fontWeight: FontWeight.w400,
                  //         ),
                  //       ),
                  //     ));

                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: InkWell(
                          onTap: () {
                            String title12 =
                                _dataSelesai[index]['title_laporan'].toString();
                            String tanggal12 =
                                _dataSelesai[index]['tanggal'].toString();
                            String deskripsi12 =
                                _dataSelesai[index]['deskripsi'].toString();
                            String image12 =
                                _dataSelesai[index]['image'].toString();
                            String statuss12 =
                                _dataSelesai[index]['status'].toString();
                            String idKategori12 =
                                _dataSelesai[index]['id_kategori'].toString();
                            String id_user12 =
                                _dataSelesai[index]['id_user'].toString();
                            print("title = ${title12}");
                            print("tanggal = ${tanggal12}");
                            print("deskripsi = ${deskripsi12}");
                            print("sttaus = ${statuss12}");
                            print("id_kategori = ${idKategori12}");
                            // Navigator.of(context)
                            //     .pushNamed("/detailRiwayatLaporan");
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => KeamananAkunPage()));

                            Navigator.of(context, rootNavigator: true)
                                .pushReplacement(
                              MaterialPageRoute(
                                settings: RouteSettings(arguments: {
                                  "title": title12,
                                  "tanggal": tanggal12,
                                  "deskripsi": deskripsi12,
                                  "status": statuss12,
                                  "idKategori": idKategori12,
                                  "idUser": id_user12,
                                  "image": image12
                                }),
                                builder: (context) {
                                  return PageDetailRiwayat();
                                },
                              ),
                            );
                          },
                          child: Container(
                            // height: 170,
                            // width: 300,
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 10,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: _dataSelesai[index]['image']
                                              .isNotEmpty
                                          ? Image.network(
                                              height: 110,
                                              width: 130,
                                              fit: BoxFit.cover,
                                              _dataSelesai[index]['image']
                                                  .toString())
                                          : Image.asset(
                                              "assets/images/po.png",
                                              height: 110,
                                              width: 130,
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            "${_dataSelesai[index]['title_laporan']}",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 10),
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 5,
                                                horizontal: 5,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.greenAccent
                                                    .withOpacity(0.5),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Text(
                                                "${_dataSelesai[index]['status']}",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5, top: 2),
                                    child: Text(
                                      "${_dataSelesai[index]['tanggal']}",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
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
                  );
                },
              ),
              ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                itemCount: _dataSelesai.length,
                itemBuilder: (context, index) {
                  // return ListTile(
                  //     leading: _dataSelesai[index]['image'].isNotEmpty
                  //         ? Image.network(
                  //             height: 130,
                  //             width: 130,
                  //             fit: BoxFit.cover,
                  //             _dataSelesai[index]['image'].toString())
                  //         : Image.asset(
                  //             "assets/images/po.png",
                  //             height: 130,
                  //             width: 130,
                  //             fit: BoxFit.cover,
                  //           ),
                  //     title: Text(
                  //       "${_dataSelesai[index]['title_laporan']}",
                  //       style: TextStyle(
                  //         fontSize: 16,
                  //         fontWeight: FontWeight.w500,
                  //       ),
                  //     ),
                  //     subtitle: Text(
                  //       "${_dataSelesai[index]['status']}",
                  //       style: TextStyle(
                  //         fontSize: 16,
                  //         fontWeight: FontWeight.w400,
                  //       ),
                  //     ),
                  //     trailing: Padding(
                  //       padding: EdgeInsets.only(left: 5, top: 2),
                  //       child: Text(
                  //         "${_dataSelesai[index]['tanggal']}",
                  //         style: TextStyle(
                  //           fontSize: 13,
                  //           fontWeight: FontWeight.w400,
                  //         ),
                  //       ),
                  //     ));

                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: InkWell(
                          onTap: () {
                            String title12 =
                                _dataSelesai[index]['title_laporan'].toString();
                            String tanggal12 =
                                _dataSelesai[index]['tanggal'].toString();
                            String deskripsi12 =
                                _dataSelesai[index]['deskripsi'].toString();
                            String image12 =
                                _dataSelesai[index]['image'].toString();
                            String statuss12 =
                                _dataSelesai[index]['status'].toString();
                            String idKategori12 =
                                _dataSelesai[index]['id_kategori'].toString();
                            String id_user12 =
                                _dataSelesai[index]['id_user'].toString();
                            print("title = ${title12}");
                            print("tanggal = ${tanggal12}");
                            print("deskripsi = ${deskripsi12}");
                            print("sttaus = ${statuss12}");
                            print("id_kategori = ${idKategori12}");
                            // Navigator.of(context)
                            //     .pushNamed("/detailRiwayatLaporan");
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => KeamananAkunPage()));

                            Navigator.of(context, rootNavigator: true)
                                .pushReplacement(
                              MaterialPageRoute(
                                settings: RouteSettings(arguments: {
                                  "title": title12,
                                  "tanggal": tanggal12,
                                  "deskripsi": deskripsi12,
                                  "status": statuss12,
                                  "idKategori": idKategori12,
                                  "idUser": id_user12,
                                  "image": image12
                                }),
                                builder: (context) {
                                  return PageDetailRiwayat();
                                },
                              ),
                            );
                          },
                          child: Container(
                            // height: 170,
                            // width: 300,
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 10,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: _dataSelesai[index]['image']
                                              .isNotEmpty
                                          ? Image.network(
                                              height: 110,
                                              width: 130,
                                              fit: BoxFit.cover,
                                              _dataSelesai[index]['image']
                                                  .toString())
                                          : Image.asset(
                                              "assets/images/po.png",
                                              height: 110,
                                              width: 130,
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            "${_dataSelesai[index]['title_laporan']}",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 10),
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 5,
                                                horizontal: 5,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.greenAccent
                                                    .withOpacity(0.5),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Text(
                                                "${_dataSelesai[index]['status']}",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5, top: 2),
                                    child: Text(
                                      "${_dataSelesai[index]['tanggal']}",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
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
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
