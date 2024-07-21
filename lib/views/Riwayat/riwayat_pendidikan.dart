import 'dart:convert';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_pkk/helpers/ApiHelper.dart';
import 'package:e_pkk/models/DataAKun.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:e_pkk/views/Riwayat/detal_pendidikan.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RiwayatPendidikan extends StatefulWidget {
  const RiwayatPendidikan({super.key});

  @override
  State<RiwayatPendidikan> createState() => _RiwayatPendidikanState();
}

class _RiwayatPendidikanState extends State<RiwayatPendidikan> {
  String idAkun = '';
  late Future<DataAkun> futureAkun;
  List<dynamic> _dataPendidikan = [];

  //SharedPreferences
  Future<void> getIdAkun() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String idAkunValue = prefs.getString("id_akun") ?? '';
    setState(() {
      idAkun = idAkunValue;
      fetchDataPendidikan(idUser: idAkun);
    });
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
    fetchDataPendidikan(idUser: idAkun);
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
          "Pendidikan Ketrampilan",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.white,
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
        elevation: 1,
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
                condition: _dataPendidikan.isNotEmpty,
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
                                      "id_pokja2_bidang1":
                                          _dataPendidikan[index]
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
                                      "jumlah_ibu_peserta":
                                          _dataPendidikan[index]
                                              ['jumlah_ibu_peserta'],
                                      "jumlah_ape": _dataPendidikan[index]
                                          ['jumlah_ape'],
                                      "jumlah_kel_simulasi":
                                          _dataPendidikan[index]
                                              ['jumlah_kel_simulasi'],
                                      "KF": _dataPendidikan[index]['KF'],
                                      "paud_tutor": _dataPendidikan[index]
                                          ['paud_tutor'],
                                      "BKB": _dataPendidikan[index]['BKB'],
                                      "koperasi": _dataPendidikan[index]
                                          ['koperasi'],
                                      "ketrampilan": _dataPendidikan[index]
                                          ['ketrampilan'],
                                      "LP3PKK": _dataPendidikan[index]
                                          ['LP3PKK'],
                                      "TP3PKK": _dataPendidikan[index]
                                          ['TP3PKK'],
                                      "damas_pkk": _dataPendidikan[index]
                                          ['damas_pkk'],
                                      "status": _dataPendidikan[index]
                                          ['status'],
                                      "tanggal": _dataPendidikan[index]
                                          ['tanggal'],
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                          stts: _dataPendidikan[index]
                                              ['status']),
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
                  );
                },
              ),
      ),
    );
  }
}
