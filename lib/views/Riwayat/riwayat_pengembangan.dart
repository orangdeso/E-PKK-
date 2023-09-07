import 'dart:convert';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_pkk/views/Riwayat/detail_pengembangan.dart';
import 'package:http/http.dart' as http;
import 'package:e_pkk/helpers/ApiHelper.dart';
import 'package:e_pkk/models/DataAKun.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RiwayatPengembangan extends StatefulWidget {
  const RiwayatPengembangan({super.key});

  @override
  State<RiwayatPengembangan> createState() => _RiwayatPengembanganState();
}

class _RiwayatPengembanganState extends State<RiwayatPengembangan> {
  String idAkun = '';
  late Future<DataAkun> futureAkun;
  List<dynamic> _dataPengembangan = [];
  //late Future<dynamic> _data;

  //SharedPreferences
  Future<void> getIdAkun() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String idAkunValue = prefs.getString("id_akun") ?? '';
    setState(() {
      idAkun = idAkunValue;
      fetchDataPengembangan(idUser: idAkun);
    });
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
    fetchDataPengembangan(idUser: idAkun);
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
          "Pengembangan Kehidupan Berkoperasi",
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
                condition: _dataPengembangan.isNotEmpty,
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
                                      "id_pokja2_bidang2":
                                          _dataPengembangan[index]
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
                                              _dataPengembangan[index]
                                                      ['catatan']
                                                  .isNotEmpty
                                          ? _dataPengembangan[index]['catatan']
                                          : "-",
                                      "status": _dataPengembangan[index]
                                          ['status'],
                                      "tanggal": _dataPengembangan[index]
                                          ['tanggal'],
                                      "waktu": _dataPengembangan[index]
                                          ['waktu'],
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                          stts: _dataPengembangan[index]
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
                  );
                },
              ),
      ),
    );
  }
}
