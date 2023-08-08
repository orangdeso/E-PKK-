import 'package:e_pkk/models/DataAKun.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageKaderPokja4 extends StatefulWidget {
  const PageKaderPokja4({super.key});

  @override
  State<PageKaderPokja4> createState() => _PageKaderPokja4State();
}

class _PageKaderPokja4State extends State<PageKaderPokja4> {
  final _formKey = GlobalKey<FormState>();
  String idAkun = '';
  late Future<DataAkun> futureAkun;
  var isLoading = true;

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
    getIdAkun();
    loadTampilan();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 244, 244),
      appBar: AppBar(
        title: Text(
          "Jumlah Kader Pokja IV",
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
                            height: 2,
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
                                "Posyandu",
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
                                    //controller: getPKDRT,
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
                                      hintText: "Masukkan jumlah posyandu",
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
                                height: 25,
                              ),
                              Text(
                                "Gizi",
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
                                    //controller: getPola,
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
                                      hintText: "Masukkan jumlah gizi",
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
                                height: 25,
                              ),
                              Text(
                                "Kesling",
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
                                    //controller: getPKBN,
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
                                      hintText: "Masukkan jumlah kesling",
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
                                height: 25,
                              ),
                              Text(
                                "Penyuluhan Narkoba",
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
                                    //controller: getPKBN,
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
                                          "Masukkan jumlah penyuluhan narkoba",
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
                                height: 25,
                              ),
                              Text(
                                "PHBS",
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
                                    //controller: getPKBN,
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
                                      hintText: "Masukkan jumlah PHBS",
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
                                height: 25,
                              ),
                              Text(
                                "KB",
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
                                    //controller: getPKBN,
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
                                      hintText: "Masukkan jumlah KB",
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
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: ElevatedButton(
                            onPressed: () async {
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
    );
  }
}
