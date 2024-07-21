import 'dart:convert';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:e_pkk/views/Riwayat/detail_penghayatan.dart';
import 'package:http/http.dart' as http;
import 'package:e_pkk/helpers/ApiHelper.dart';
import 'package:e_pkk/models/DataAKun.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RiwayatPenghayatan extends StatefulWidget {
  const RiwayatPenghayatan({super.key});

  @override
  State<RiwayatPenghayatan> createState() => _RiwayatPenghayatanState();
}

class _RiwayatPenghayatanState extends State<RiwayatPenghayatan> {
  String idAkun = '';
  late Future<DataAkun> futureAkun;
  List<dynamic> _dataPenghayatan = [];

  //SharedPreferences
  Future<void> getIdAkun() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String idAkunValue = prefs.getString("id_akun") ?? '';
    setState(() {
      idAkun = idAkunValue;
      fetchDataPenghayatan(idUser: idAkun);
    });
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
    fetchDataPenghayatan(idUser: idAkun);
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
          "Penghayatan & Pengamalan Pancasila",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
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
                condition: _dataPenghayatan.isNotEmpty,
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
                                      "id_pokja1_bidang1":
                                          _dataPenghayatan[index]
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
                                      "status": _dataPenghayatan[index]
                                          ['status'],
                                      "tanggal": _dataPenghayatan[index]
                                          ['tanggal'],
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                          stts: _dataPenghayatan[index]
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
                  );
                },
              ),
      ),
    );
  }
}
