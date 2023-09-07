import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:e_pkk/views/Login/login_screen.dart';
import 'package:e_pkk/views/SettingAkun/hubungi_page.dart';
import 'package:e_pkk/views/SettingAkun/keamanan_page.dart';
import 'package:e_pkk/views/SettingAkun/profil_page.dart';
import 'package:e_pkk/views/SettingAkun/syarat.page.dart';
import 'package:e_pkk/views/SettingAkun/tentang_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/ApiController.dart';
import '../../models/DataAKun.dart';

class SettingAkun extends StatefulWidget {
  const SettingAkun({super.key});

  @override
  State<SettingAkun> createState() => _SettingAkunState();
}

class _SettingAkunState extends State<SettingAkun> {
  String idAkun = '';
  late Future<DataAkun> futureAkun;
  Future<void> getIdAkunFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String idAkunValue = prefs.getString("id_akun") ??
        ''; // Menggunakan operator nullish coalescing untuk menetapkan nilai default jika kunci tidak ada
    setState(() {
      idAkun = idAkunValue;
    });
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
          "Profil",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 5,
        centerTitle: true,
        backgroundColor: ktextColor,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: grey100,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          //SizedBox(height: size.height * 0.15),
          Align(
            alignment: FractionalOffset.topCenter,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              color: whiteColor,
              height: size.height * 0.11,
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: FutureBuilder<DataAkun>(
                  future: futureAkun,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListTile(
                        // leading: CircleAvatar(
                        //   backgroundImage:
                        //       AssetImage("assets/icons/user64.png"),
                        // ),
                        title: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 6, horizontal: 5),
                          child: Text(
                            snapshot.data!.data!.namaPengguna.toString(),
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        subtitle: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            snapshot.data!.data!.noWhatsapp.toString(),
                          ),
                        ),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Container(
              color: whiteColor,
              //height: size.height * 0.6,
              padding: EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: FractionalOffset.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 15,
                        top: 5,
                        bottom: 15,
                      ),
                      child: Text(
                        "Informasi akun pengguna",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProfilPage()));
                    },
                    leading: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.tealAccent.shade100,
                      ),
                      child: Icon(
                        Icons.person_outlined,
                        color: Colors.tealAccent.shade700,
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Profil Pengguna",
                        style: TextStyle(
                          color: grey800,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    trailing: Container(
                      width: 30,
                      height: 30,
                      padding: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        //color: grey400.withOpacity(0.1),
                      ),
                      child: Icon(Icons.keyboard_arrow_right_outlined),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => KeamananAkunPage()));
                    },
                    leading: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.amber.shade100,
                      ),
                      child: Icon(
                        Icons.lock_outline,
                        color: Colors.amber.shade700,
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Keamanan Akun",
                        style: TextStyle(
                          color: grey800,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    trailing: Container(
                      width: 30,
                      height: 30,
                      padding: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        //color: grey400.withOpacity(0.1),
                      ),
                      child: Icon(Icons.keyboard_arrow_right_outlined),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Container(
              color: whiteColor,
              //height: size.height * 0.6,
              padding: EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: FractionalOffset.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 15,
                        top: 5,
                        bottom: 15,
                      ),
                      child: Text(
                        "Informasi lainnya",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TentangKamiPage()));
                    },
                    leading: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: grey100,
                      ),
                      child: Icon(
                        Icons.info_outline,
                        color: grey700,
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Tentang Kami",
                        style: TextStyle(
                          color: grey800,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    trailing: Container(
                      width: 30,
                      height: 30,
                      padding: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        //color: grey400.withOpacity(0.1),
                      ),
                      child: Icon(Icons.keyboard_arrow_right_outlined),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HubungiKamiPage()));
                    },
                    leading: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: grey100,
                      ),
                      child: Icon(
                        Icons.chat_outlined,
                        color: grey700,
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Hubungi Kami",
                        style: TextStyle(
                          color: grey800,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    trailing: Container(
                      width: 30,
                      height: 30,
                      padding: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        //color: grey400.withOpacity(0.1),
                      ),
                      child: Icon(Icons.keyboard_arrow_right_outlined),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SyaratKetentuanPage()));
                    },
                    leading: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: grey100,
                      ),
                      child: Icon(
                        Icons.verified_user_outlined,
                        color: grey700,
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Syarat dan Ketentuan",
                        style: TextStyle(
                          color: grey800,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    trailing: Container(
                      width: 30,
                      height: 30,
                      padding: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        //color: grey400.withOpacity(0.1),
                      ),
                      child: Icon(Icons.keyboard_arrow_right_outlined),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      print("Wis diklik bro");
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Konfirmasi"),
                            content: Text(
                              "Apakah Anda ingin keluar dari aplikasi ?",
                            ),
                            actions: [
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    "Tidak",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              ),
                              AnimatedButton(
                                pressEvent: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                                },
                                text: "Ya",
                                width: 70,
                                color: ktextColor,
                                borderRadius: BorderRadius.circular(5),
                                buttonTextStyle: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    leading: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: grey100,
                      ),
                      child: Icon(
                        Icons.login_outlined,
                        color: grey700,
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Keluar",
                        style: TextStyle(
                          color: Colors.red.shade700,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    trailing: Container(
                      width: 30,
                      height: 30,
                      padding: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        //color: grey400.withOpacity(0.1),
                      ),
                      child: Icon(Icons.keyboard_arrow_right_outlined),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
