import 'package:e_pkk/models/ApiLaporan.dart';
import 'package:e_pkk/models/DataAKun.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/constants.dart';

class PageGotongRoyong extends StatefulWidget {
  static String route = '/pageGotongRoyong';

  @override
  State<PageGotongRoyong> createState() => _PageGotongRoyongState();
}

class _PageGotongRoyongState extends State<PageGotongRoyong> {
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

  TextEditingController tKerja = TextEditingController();
  TextEditingController tRukun = TextEditingController();
  TextEditingController tKeagamaan = TextEditingController();
  TextEditingController tJimpitan = TextEditingController();
  TextEditingController tArisan = TextEditingController();

  Succes() {
    tKerja.text = "";
    tRukun.text = "";
    tKeagamaan.text = "";
    tJimpitan.text = "";
    tArisan.text = "";
  }

  var isLoading = true;

  void loadTampilan() {
    setState(() {
      Future.delayed(Duration(seconds: 3), () {
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
          "Gotong Royong",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator(
                color: ktextColor,
                backgroundColor: Colors.grey.shade300,
                semanticsLabel: 'Loading',
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Column(
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
                            height: 2,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: grey300,
                                width: 1.2,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Kerja Bakti",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
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
                                      color: grey100,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: grey300,
                                        width: 1.2,
                                      ),
                                    ),
                                    child: TextFormField(
                                      controller: tKerja,
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
                                        hintText: "Masukkan jumlah kerja bakti",
                                        hintStyle: TextStyle(
                                          color: grey400,
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
                                  "Rukun Kematian",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
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
                                      color: grey100,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: grey300,
                                        width: 1.2,
                                      ),
                                    ),
                                    child: TextFormField(
                                      controller: tRukun,
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
                                        hintText:
                                            "Masukkan jumlah rukun kematian",
                                        hintStyle: TextStyle(
                                          color: grey400,
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
                                  "Keagamaan",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
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
                                      color: grey100,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: grey300,
                                        width: 1.2,
                                      ),
                                    ),
                                    child: TextFormField(
                                      controller: tKeagamaan,
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
                                        hintText: "Masukkan jumlah keagamaan",
                                        hintStyle: TextStyle(
                                          color: grey400,
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
                                  "Jimpitan",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
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
                                      color: grey100,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: grey300,
                                        width: 1.2,
                                      ),
                                    ),
                                    child: TextFormField(
                                      controller: tJimpitan,
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
                                        hintText: "Masukkan jumlah jimpitan",
                                        hintStyle: TextStyle(
                                          color: grey400,
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
                                  "Arisan",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
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
                                      color: grey100,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: grey300,
                                        width: 1.2,
                                      ),
                                    ),
                                    child: TextFormField(
                                      controller: tArisan,
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
                                        hintText: "Masukkan jumlah arisan",
                                        hintStyle: TextStyle(
                                          color: grey400,
                                          fontSize: 15,
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
                          Padding(
                            padding: EdgeInsets.only(bottom: 30),
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  print("Test Laporan Gotong Royong");
                                  String kerja_bakti = tKerja.text.toString();
                                  String rukun_kematian =
                                      tRukun.text.toString();
                                  String keagamaan = tKeagamaan.text.toString();
                                  String jimpitan = tJimpitan.text.toString();
                                  String arisan = tArisan.text.toString();
                                  print("kerja :: ${kerja_bakti}");
                                  print("rukun :: ${rukun_kematian}");
                                  print("Keagamaan :: ${keagamaan}");
                                  print("Jimpitan :: ${jimpitan}");
                                  print("Arisan :: ${arisan}");
                                  GetApi.LaporanGotongRoyong(
                                    context: context,
                                    kerja_bakti: kerja_bakti,
                                    rukun_kematian: rukun_kematian,
                                    keagamaan: keagamaan,
                                    jimpitan: jimpitan,
                                    arisan: arisan,
                                    userID: idAkun,
                                  ).then(
                                    (value) => {
                                      print("berhasil"),
                                    },
                                  );
                                }
                                print(idAkun);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 55, 149, 183),
                                minimumSize: Size.fromHeight(50),
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                "UPLOAD",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
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
      ),
    );
  }
}
