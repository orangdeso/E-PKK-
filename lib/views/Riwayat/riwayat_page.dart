import 'package:e_pkk/helpers/ApiHelper.dart';
import 'package:e_pkk/models/DataAkun.dart';
import 'package:e_pkk/models/LoginApi.dart';
import 'package:e_pkk/models/Riwayat.dart';
import 'package:e_pkk/models/laporanModel.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:e_pkk/views/Riwayat/detail_Psehat.dart';
import 'package:e_pkk/views/Riwayat/detail_klh.dart';
import 'package:e_pkk/views/Riwayat/detail_perencaanSehat.dart';
import 'package:e_pkk/views/Riwayat/page_detail_riwayat.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../SettingAkun/keamanan_page.dart';
import 'detail_gallery.dart';

class RiwayatPage extends StatefulWidget {
  static String route = '/Riwayat';
  // const RiwayatPage({super.key});

  @override
  State<RiwayatPage> createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage> {
  int _current = 0;
  List<dynamic> _dataKesehatan = [];
  List<dynamic> _dataKLH = [];
  List<dynamic> _dataPSehat = [];
  List<dynamic> _gallery = [];
  String idAkun = '';
  late Future<DataAkun> futureAkun;

  Future<void> getIdAkun() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String idAkunValue = prefs.getString("id_akun") ?? '';
    setState(() {
      idAkun = idAkunValue;
      fetchDataKesehatan(idUser: idAkun);
      fetchDataKLH(idUser: idAkun);
      fetchDataPSehat(idUser: idAkun);
      fetchDataGaleery(idUser: idAkun);
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

  List<Tab> myTab = [
    Tab(
      child: Text(
        "Bidang Kesehatan",
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
          textStyle: TextStyle(
            fontSize: 10.5,
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
            fontSize: 10.5,
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
            fontSize: 10.5,
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
            fontSize: 10.5,
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
    print(idAkun);
    setState(() {});
    super.initState();
  }

  Color WarnaButton({String? stts}) {
    if (stts == "Proses") {
      return Colors.orange.shade400;
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
                            "${ApiHelper.url}assets/Bidang_kesehatan/${_dataKesehatan[index]['gambar_upload']}",
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
                          // onTap: () {
                          //   Navigator.of(context, rootNavigator: true)
                          //       .pushReplacement(
                          //     MaterialPageRoute(
                          //       builder: (context) {
                          //         return PageDetailSehat();
                          //       },
                          //       settings: RouteSettings(
                          //         arguments: {
                          //           "gambar": _dataKesehatan[index]
                          //               ['gambar_upload'],
                          //           "tanggal": _dataKesehatan[index]['tanggal'],
                          //           "kategori_laporan": _dataKesehatan[index]
                          //               ['kategori_laporan'],
                          //           "jml_posyandu": _dataKesehatan[index]
                          //               ['jumlah_posyandu'],
                          //           "jml_posint": _dataKesehatan[index]
                          //               ['jumlah_posyandu_iterasi'],
                          //           "jml_klp": _dataKesehatan[index]
                          //               ['jumlah_klp'],
                          //           "jml_anggota": _dataKesehatan[index]
                          //               ['jumlah_anggota'],
                          //           "jml_kartu": _dataKesehatan[index]
                          //               ['jumlah_kartu_gratis'],
                          //           "stss": _dataKesehatan[index]['status']
                          //         },
                          //       ),
                          //     ),
                          //   );
                          // },
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
                          borderRadius: BorderRadius.circular(10)),
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
                            "${ApiHelper.url}assets/Bidang_LingkunganHidup/${_dataKLH[index]['gambar_upload']}",
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
                            "${ApiHelper.url}assets/Bidang_Perencaan_Sehat/${_dataPSehat[index]['gambar']}",
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
                          borderRadius: BorderRadius.circular(10)),
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
                                  "deskripsi": _gallery[index]['deskripsi'],
                                  "gambar": _gallery[index]['image'],
                                  "user": _gallery[index]['id_user'],
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
                            "${ApiHelper.url}assets/gallery/${_gallery[index]['image']}",
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          "Gallery",
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
              )
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
