// ignore_for_file: body_might_complete_normally_nullable

import 'package:e_pkk/models/ApiLaporan.dart';
import 'package:e_pkk/models/DataAKun.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageKaderPokja1 extends StatefulWidget {
  const PageKaderPokja1({super.key});

  @override
  State<PageKaderPokja1> createState() => _PageKaderPokja1State();
}

class _PageKaderPokja1State extends State<PageKaderPokja1> {
  final _formKey = GlobalKey<FormState>();
  String idAkun = '';
  late Future<DataAkun> futureAkun;

  // Shared Preferences untuk pemanggilan ID pengguna
  Future<void> getIdAkun() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String idAkunValue = prefs.getString("id_akun") ?? '';
    setState(() {
      idAkun = idAkunValue;
    });
  }

  TextEditingController getPKBN = TextEditingController();
  TextEditingController getPKDRT = TextEditingController();
  TextEditingController getPola = TextEditingController();

  Succes() {
    getPKBN.text = "";
    getPKDRT.text = "";
    getPola.text = "";
  }

  var isLoading = true;

  void loadTampilan() {
    setState(() {
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          isLoading = false;
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    loadTampilan();
    getIdAkun();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 244, 244),
      appBar: AppBar(
        title: Text(
          "Jumlah Kader Pokja I",
          style: TextStyle(
            color: grey800,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: grey800),
        backgroundColor: Colors.white,
        elevation: 1,
        shadowColor: Colors.grey.shade100,
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator(
                color: ktextColor,
                backgroundColor: Colors.grey.shade300,
                semanticsLabel: 'Loading',
              )
            : Form(
                key: _formKey,
                child: ListView(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Isi Data Dibawah ini",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: grey500,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            thickness: 1,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 30),
                          decoration: BoxDecoration(
                            color: whiteColor,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "PKBN",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: grey800,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Align(
                                alignment: FractionalOffset.topCenter,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 2),
                                  width: size.width * 0.9,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade50,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: grey300,
                                      width: 1.2,
                                    ),
                                  ),
                                  child: TextFormField(
                                    controller: getPKBN,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Tidak boleh kosong';
                                      }
                                    },
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration: InputDecoration(
                                      hintText: "Masukkan jumlah PKBN",
                                      hintStyle: TextStyle(
                                        color: grey400,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "PKDRT",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: grey800,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Align(
                                alignment: FractionalOffset.topCenter,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 2),
                                  width: size.width * 0.9,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade50,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: grey300,
                                      width: 1.2,
                                    ),
                                  ),
                                  child: TextFormField(
                                    controller: getPKDRT,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Tidak boleh kosong';
                                      }
                                    },
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration: InputDecoration(
                                      hintText: "Masukkan jumlah PKDRT",
                                      hintStyle: TextStyle(
                                        color: grey400,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Pola Asuh",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: grey800,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Align(
                                alignment: FractionalOffset.topCenter,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 2),
                                  width: size.width * 0.9,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade50,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: grey300,
                                      width: 1.2,
                                    ),
                                  ),
                                  child: TextFormField(
                                    controller: getPola,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Tidak boleh kosong';
                                      }
                                    },
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration: InputDecoration(
                                      hintText: "Masukkan jumlah pola asuh",
                                      hintStyle: TextStyle(
                                        color: grey400,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: ElevatedButton(
                            onPressed: () async {
                              print(idAkun);
                              if (_formKey.currentState!.validate()) {
                                // Menampilkan Circular Progres Indicator
                                showDialog(
                                  context: context,
                                  barrierDismissible:
                                      false, // Tidak bisa ditutup selama menunggu
                                  builder: (BuildContext context) {
                                    return Center(
                                      child: CircularProgressIndicator(
                                        color: ktextColor,
                                        backgroundColor: Colors.grey.shade400,
                                        semanticsLabel: 'Loading',
                                      ),
                                    );
                                  },
                                );

                                await Future.delayed(Duration(seconds: 3));

                                String pkbn = getPKBN.text.toString();
                                String pkdrt = getPKDRT.text.toString();
                                String pola = getPola.text.toString();
                                GetApi.LaporanKader1(
                                  context: context,
                                  PKBN: pkbn,
                                  PKDRT: pkdrt,
                                  pola_asuh: pola,
                                  userID: idAkun,
                                ).then(
                                  (value) => {
                                    print("Berhasil"),
                                  },
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 55, 149, 183),
                              minimumSize: Size.fromHeight(50),
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text(
                              "UPLOAD",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
