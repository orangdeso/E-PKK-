import 'dart:convert';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_pkk/helpers/ApiHelper.dart';
import 'package:e_pkk/models/DataAKun.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:e_pkk/views/Riwayat/detail_gallery.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RiwayatGaleri extends StatefulWidget {
  const RiwayatGaleri({super.key});

  @override
  State<RiwayatGaleri> createState() => _RiwayatGaleriState();
}

class _RiwayatGaleriState extends State<RiwayatGaleri> {
  String idAkun = '';
  late Future<DataAkun> futureAkun;
  List<dynamic> _gallery = [];

  //SharedPreferences
  Future<void> getIdAkun() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String idAkunValue = prefs.getString("id_akun") ?? '';
    setState(() {
      idAkun = idAkunValue;
      fetchDataGaleery(idUser: idAkun);
    });
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
    fetchDataGaleery(idUser: idAkun);
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
          "Galeri",
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
        iconTheme: IconThemeData(
          color: Colors.white,
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
                condition: _gallery.isNotEmpty,
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
                                "${ApiHelper.url}../frontend2/gallery2/${_gallery[index]['gambar']}",
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(
                              "${_gallery[index]['deskripsi']}",
                              maxLines: 2,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            subtitle: Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Text(
                                "${_gallery[index]['tanggal']}",
                                style: TextStyle(
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                            trailing: InkWell(
                              child: Container(
                                width: 100,
                                height: 40,
                                child: Card(
                                  color: WarnaButton(
                                      stts: _gallery[index]['status']),
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
                  );
                },
              ),
      ),
    );
  }
}
