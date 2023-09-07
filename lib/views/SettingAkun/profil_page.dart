// ignore_for_file: unused_local_variable

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_pkk/controller/ApiController.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/DataAKun.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  TextEditingController textEditingControllerNama =
      TextEditingController(text: "Ahmad Kahfi Smith");
  TextEditingController textEditingControllerNoWhatsapp =
      TextEditingController(text: "0812345678");
  TextEditingController textEditingControllerAlamat =
      TextEditingController(text: "Baron");

  late Future<DataAkun> futureAkun;
  String idAkun = '';

  Future<void> getIdAkunFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String idAkunValue = prefs.getString("id_akun") ??
        ''; // Menggunakan operator nullish coalescing untuk menetapkan nilai default jika kunci tidak ada
    setState(() {
      idAkun = idAkunValue;
    });
  }

  _showAlertSukses(context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.topSlide,
      showCloseIcon: true,
      title: "Berhasil Update Akun",
      desc: "Klik tombol ok untuk diarahkan kehalaman beranda",
      btnOkOnPress: () {},
    ).show();
  }

  void showBerhasil(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: whiteColor,
      textColor: textColor2,
    );
  }

  @override
  void initState() {
    super.initState();
    getIdAkunFromSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    futureAkun = API_CONTROLLER.fetchData(idAkun);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Informasi Akun",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: ktextColor,
      ),
      backgroundColor: Color.fromARGB(255, 244, 244, 244),
      body: FutureBuilder<DataAkun>(
        future: futureAkun,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            textEditingControllerNama.text =
                snapshot.data!.data!.namaPengguna.toString();
            textEditingControllerAlamat.text =
                snapshot.data!.data!.namaKec.toString();
            textEditingControllerNoWhatsapp.text =
                snapshot.data!.data!.noWhatsapp.toString();
            return ListView(
              shrinkWrap: true,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              "assets/icons/user64.png",
                            ),
                            radius: 40,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              "Profil Anda",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                    left: 10,
                  ),
                  child: Text(
                    "Informasi Pribadi",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Nama",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "No. Whatsapp",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Alamat",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 170,
                              child: TextField(
                                controller: textEditingControllerNama,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.zero,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 170,
                              child: TextField(
                                controller: textEditingControllerNoWhatsapp,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.zero,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 170,
                              child: TextField(
                                controller: textEditingControllerAlamat,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.zero,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(child: Text("")),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () => {
                        API_CONTROLLER.editAkun(
                          idAkun,
                          textEditingControllerNama.text,
                          textEditingControllerAlamat.text,
                          textEditingControllerNoWhatsapp.text,
                        ),
                        showBerhasil("Berhasil menyimpan profil"),
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) {
                        //       return navbarView();
                        //     },
                        //   ),
                        // ),
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ktextColor,
                        elevation: 5,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "SIMPAN",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                )
              ],
            );
          } else {
            return Text(snapshot.stackTrace.toString());
          }
        },
      ),
    );
  }
}
