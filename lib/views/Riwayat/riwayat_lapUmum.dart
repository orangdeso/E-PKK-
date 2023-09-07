import 'dart:convert';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_pkk/helpers/ApiHelper.dart';
import 'package:e_pkk/models/DataAKun.dart';
import 'package:e_pkk/utils/constants.dart';

import 'package:e_pkk/views/Riwayat/detail_pengembangan.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RiwayatLapUmum extends StatefulWidget {
  const RiwayatLapUmum({super.key});

  @override
  State<RiwayatLapUmum> createState() => _RiwayatLapUmumState();
}

class _RiwayatLapUmumState extends State<RiwayatLapUmum> {
  String idAkun = '';
  late Future<DataAkun> futureAkun;
  List<dynamic> _dataUmum = [];

  //SharedPreferences
  Future<void> getIdAkun() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String idAkunValue = prefs.getString("id_akun") ?? '';
    setState(() {
      idAkun = idAkunValue;
      fetchDataLapUmum(idUser: idAkun);
    });
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

  var isLoading = true;

  void loadTampilan() {
    setState(() {
      //Future.delayed(Duration(seconds: 2), () {});
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    getIdAkun();
    fetchDataLapUmum(idUser: idAkun);
    loadTampilan();
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Laporan Umum",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 5,
        centerTitle: true,
        backgroundColor: ktextColor,
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator(
                color: ktextColor,
                backgroundColor: Colors.grey.shade300,
                semanticsLabel: 'Loading',
              )
            : ConditionalBuilder(
                condition: _dataUmum.isNotEmpty,
                fallback: (context) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/report3D.png",
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Belum ada laporan",
                          style: TextStyle(
                            fontSize: 20,
                            color: grey400,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                builder: (context) {
                  return ListView.builder(
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
                                      "desa_wisma": _dataUmum[index]
                                          ['desa_wisma'],
                                      "KRT": _dataUmum[index]['KRT'],
                                      "KK": _dataUmum[index]['KK'],
                                      "jiwa_laki": _dataUmum[index]
                                          ['jiwa_laki'],
                                      "jiwa_perempuan": _dataUmum[index]
                                          ['jiwa_perempuan'],
                                      "anggota_laki": _dataUmum[index]
                                          ['anggota_laki'],
                                      "anggota_perempuan": _dataUmum[index]
                                          ['anggota_perempuan'],
                                      "umum_laki": _dataUmum[index]
                                          ['umum_laki'],
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
                                      "catatan":
                                          _dataUmum[index]['catatan'] != null &&
                                                  _dataUmum[index]['catatan']
                                                      .isNotEmpty
                                              ? _dataUmum[index]['catatan']
                                              : "-",
                                      "status": _dataUmum[index]['status'],
                                      "tanggal": _dataUmum[index]['tanggal'],
                                      "waktu": _dataUmum[index]['waktu'],
                                      "created_at": _dataUmum[index]
                                          ['created_at'],
                                      "updated_at": _dataUmum[index]
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                  );
                },
              ),
      ),
    );
  }
}
