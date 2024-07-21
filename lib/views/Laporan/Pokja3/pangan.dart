// ignore_for_file: body_might_complete_normally_nullable

import 'package:e_pkk/models/ApiLaporan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/DataAKun.dart';
import '../../../utils/constants.dart';

class PagePangan extends StatefulWidget {
  const PagePangan({super.key});

  @override
  State<PagePangan> createState() => _PagePanganState();
}

class _PagePanganState extends State<PagePangan> {
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

  TextEditingController tBeras = TextEditingController();
  TextEditingController tNonBeras = TextEditingController();
  TextEditingController tPeternakan = TextEditingController();
  TextEditingController tPerikanan = TextEditingController();
  TextEditingController tWarung = TextEditingController();
  TextEditingController tLumbung = TextEditingController();
  TextEditingController tToga = TextEditingController();
  TextEditingController tTanaman = TextEditingController();

  @override
  void initState() {
    super.initState();
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
          "Pangan",
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
        child: Padding(
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
                      thickness: 1,
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                            "Makanan Pokok",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Beras",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
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
                                controller: tBeras,
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
                                  hintText: "Masukkan jumlah beras",
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
                            height: 15,
                          ),
                          Text(
                            "Non Beras",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
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
                                controller: tNonBeras,
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
                                  hintText: "Masukkan jumlah non beras",
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                            "Pemanfaatan Pekarangan / Hatinya PKK",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Peternakan",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
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
                                controller: tPeternakan,
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
                                  hintText: "Masukkan jumlah peternakan",
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
                            height: 15,
                          ),
                          Text(
                            "Perikanan",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
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
                                controller: tPerikanan,
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
                                  hintText: "Masukkan jumlah perikanan",
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
                            height: 15,
                          ),
                          Text(
                            "Warung Hidup",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
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
                                controller: tWarung,
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
                                  hintText: "Masukkan jumlah warung hidup",
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
                            height: 15,
                          ),
                          Text(
                            "Lumbung Hidup",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
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
                                controller: tLumbung,
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
                                  hintText: "Masukkan jumlah lumbung hidup",
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
                            height: 15,
                          ),
                          Text(
                            "TOGA",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
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
                                controller: tToga,
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
                                  hintText: "Masukkan jumlah TOGA",
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
                            height: 15,
                          ),
                          Text(
                            "Tanaman Keras",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
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
                                controller: tTanaman,
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
                                  hintText: "Masukkan jumlah tanaman keras",
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

                            await Future.delayed(Duration(seconds: 2));

                            print(idAkun);
                            String beras = tBeras.text.toString();
                            String nonBeras = tNonBeras.text.toString();
                            String peternakan = tPeternakan.text.toString();
                            String perikanan = tPerikanan.text.toString();
                            String warung = tWarung.text.toString();
                            String lumbung = tLumbung.text.toString();
                            String toga = tToga.text.toString();
                            String tanaman = tTanaman.text.toString();
                            GetApi.LaporanPangan(
                              context: context,
                              beras: beras,
                              non_beras: nonBeras,
                              peternakan: peternakan,
                              perikanan: perikanan,
                              warung_hidup: warung,
                              lumbung_hidup: lumbung,
                              toga: toga,
                              tanaman_keras: tanaman,
                              userID: idAkun,
                            ).then(
                              (value) => {
                                print('Berhasil bro'),
                              },
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 55, 149, 183),
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
      ),
    );
  }
}
