import 'package:e_pkk/helpers/ApiHelper.dart';
import 'package:e_pkk/models/LoginApi.dart';
import 'package:e_pkk/models/Riwayat.dart';
import 'package:e_pkk/models/laporanModel.dart';
import 'package:e_pkk/utils/constants.dart';
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
  List<dynamic> _data = [];
  List<dynamic> _dataProses = [];
  List<dynamic> _dataSelesai = [];

  //Repository repository = Repository();
  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse(ApiHelper.url + "getRiwayat.php"));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      setState(() {
        _data = jsonData['data'];
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

  Future<void> fetchDataProses() async {
    final response =
        await http.get(Uri.parse(ApiHelper.url + "getRiwayatProses.php"));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print(jsonData);

      setState(() {
        _dataProses = jsonData['data'];
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
        "Menunggu",
        style: GoogleFonts.inter(
          textStyle: TextStyle(),
        ),
      ),
    ),
    Tab(
      child: Text(
        "Proses",
        style: GoogleFonts.inter(
          textStyle: TextStyle(),
        ),
      ),
    ),
    Tab(
      child: Text(
        "Selesai",
        style: GoogleFonts.inter(
          textStyle: TextStyle(),
        ),
      ),
    ),
  ];

  @override
  void initState() {
    fetchData();
    fetchDataProses();
    fetchDataSelesai();
    super.initState();
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
              // ListView.builder(
              //   itemCount: _data.length,
              //   itemBuilder: (context, index) {
              //     return ListTile(
              //       title: Text(_data[index]['title_laporan']),
              //       subtitle: Text(_data[index]['tanggal']),
              //       leading: CircleAvatar(
              //         backgroundImage: NetworkImage(_data[index]['image']),
              //       ),
              //     );
              //   },
              // ),
              ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                itemCount: _data.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: InkWell(
                          onTap: () {
                            String title =
                                _data[index]['title_laporan'].toString();
                            String tanggal = _data[index]['tanggal'].toString();
                            String deskripsi =
                                _data[index]['deskripsi'].toString();
                            String image = _data[index]['image'].toString();
                            String statuss = _data[index]['status'].toString();
                            String idKategori =
                                _data[index]['id_kategori'].toString();
                            String id_user = _data[index]['id_user'].toString();
                            print("title = ${title}");
                            print("tanggal = ${tanggal}");
                            print("deskripsi = ${deskripsi}");
                            print("sttaus = ${statuss}");
                            print("id_kategori = ${idKategori}");
                            // Navigator.of(context)
                            //     .pushNamed("/detailRiwayatLaporan");
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => KeamananAkunPage()));
                            Navigator.of(context, rootNavigator: true)
                                .pushReplacement(
                              MaterialPageRoute(
                                settings: RouteSettings(arguments: {
                                  "title": title,
                                  "tanggal": tanggal,
                                  "deskripsi": deskripsi,
                                  "status": statuss,
                                  "idKategori": idKategori,
                                  "idUser": id_user,
                                  "image": image
                                }),
                                builder: (context) {
                                  return PageDetailRiwayat();
                                },
                              ),
                            );
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     settings: RouteSettings(arguments: {
                            //       "title": title,
                            //       "tanggal": tanggal,
                            //       "deskripsi": deskripsi,
                            //       "status": statuss,
                            //       "idKategori": idKategori,
                            //       "idUser": id_user,
                            //       "image": image
                            //     }),
                            //     builder: (context) {
                            //       return PageDetailRiwayat();
                            //     },
                            //   ),
                            // );
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
                                      child: _data[index]['image'].isNotEmpty
                                          ? Image.network(
                                              height: 110,
                                              width: 130,
                                              fit: BoxFit.cover,
                                              _data[index]['image'].toString())
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
                                            // (listLaporan[index].titleLaporan ==
                                            //         null)
                                            //     ? "P"
                                            //     : "P : ${listLaporan[index].titleLaporan}",
                                            // listLaporan[index]
                                            //     .titleLaporan
                                            //     .toString(),
                                            _data[index]['title_laporan'] ??
                                                'Not Title',
                                            style: TextStyle(
                                              fontSize: 13,
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
                                                color: Colors.amberAccent,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Text(
                                                _data[index]['status'] ??
                                                    'Not Title',
                                                // listLaporan[index]
                                                //     .status
                                                //     .toString(),
                                                // (listLaporan[index].status ==
                                                //         null)
                                                //     ? "status"
                                                //     : "status : ${listLaporan[index].status}",
                                                style: TextStyle(
                                                  fontSize: 13,
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
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text(
                                      _data[index]['tanggal'] ?? 'Not Title',
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
                itemCount: _dataProses.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: InkWell(
                          onTap: () {
                            String title1 =
                                _dataProses[index]['title_laporan'].toString();
                            String tanggal1 =
                                _dataProses[index]['tanggal'].toString();
                            String deskripsi1 =
                                _dataProses[index]['deskripsi'].toString();
                            String image1 =
                                _dataProses[index]['image'].toString();
                            String statuss1 =
                                _dataProses[index]['status'].toString();
                            String idKategori1 =
                                _dataProses[index]['id_kategori'].toString();
                            String id_user1 =
                                _dataProses[index]['id_user'].toString();
                            print("title = ${title1}");
                            print("tanggal = ${tanggal1}");
                            print("deskripsi = ${deskripsi1}");
                            print("sttaus = ${statuss1}");
                            print("id_kategori = ${idKategori1}");
                            // Navigator.of(context)
                            //     .pushNamed("/detailRiwayatLaporan");
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => KeamananAkunPage()));

                            Navigator.of(context, rootNavigator: true)
                                .pushReplacement(
                              MaterialPageRoute(
                                settings: RouteSettings(arguments: {
                                  "title": title1,
                                  "tanggal": tanggal1,
                                  "deskripsi": deskripsi1,
                                  "status": statuss1,
                                  "idKategori": idKategori1,
                                  "idUser": id_user1,
                                  "image": image1
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
                                      child:
                                          _dataProses[index]['image'].isNotEmpty
                                              ? Image.network(
                                                  height: 110,
                                                  width: 130,
                                                  fit: BoxFit.cover,
                                                  _dataProses[index]['image']
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
                                            "${_dataProses[index]['title_laporan']}",
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
                                                color: Colors.blueAccent
                                                    .withOpacity(0.5),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Text(
                                                "${_dataProses[index]['status']}",
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
                                      "${_dataProses[index]['tanggal']}",
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
