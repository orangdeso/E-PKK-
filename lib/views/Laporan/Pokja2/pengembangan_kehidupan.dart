import 'package:e_pkk/models/ApiLaporan.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/DataAKun.dart';

class PagePengembanganKehidupan extends StatefulWidget {
  const PagePengembanganKehidupan({super.key});

  @override
  State<PagePengembanganKehidupan> createState() =>
      _PagePengembanganKehidupanState();
}

class _PagePengembanganKehidupanState extends State<PagePengembanganKehidupan> {
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

  TextEditingController tKelompokPemula = TextEditingController();
  TextEditingController tPesertaPemula = TextEditingController();
  TextEditingController tKelompokMadya = TextEditingController();
  TextEditingController tPesertaMadya = TextEditingController();
  TextEditingController tKelompokUtama = TextEditingController();
  TextEditingController tPesertaUtama = TextEditingController();
  TextEditingController tKelompokMandiri = TextEditingController();
  TextEditingController tPesertaMandiri = TextEditingController();
  TextEditingController tKelompokHukum = TextEditingController();
  TextEditingController tPesertaHukum = TextEditingController();

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
          "Pengembangan Kehidupan Berkoperasi",
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
                      height: 2,
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Prakoperasi / Usaha Bersama / UP2K-PKK",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 15,
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
                            "Pemula",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Jumlah Kelompok",
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
                                controller: tKelompokPemula,
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
                                  hintText: "Masukkan jumlah kelompok Pemula",
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
                            "Jumlah Peserta",
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
                                controller: tPesertaPemula,
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
                                  hintText: "Masukkan jumlah peserta Pemula",
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
                            height: 30,
                          ),
                          Text(
                            "Madya",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Jumlah Kelompok",
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
                                controller: tKelompokMadya,
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
                                  hintText: "Masukkan jumlah kelompok Madya",
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
                            "Jumlah Peserta",
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
                                controller: tPesertaMadya,
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
                                  hintText: "Masukkan jumlah peserta Madya",
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
                            height: 30,
                          ),
                          Text(
                            "Utama",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Jumlah Kelompok",
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
                                controller: tKelompokUtama,
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
                                  hintText: "Masukkan jumlah kelompok Utama",
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
                            "Jumlah Peserta",
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
                                controller: tPesertaUtama,
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
                                  hintText: "Masukkan jumlah peserta Utama",
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
                            height: 30,
                          ),
                          Text(
                            "Mandiri",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Jumlah Kelompok",
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
                                controller: tKelompokMandiri,
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
                                  hintText: "Masukkan jumlah kelompok Mandiri",
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
                            "Jumlah Peserta",
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
                                controller: tPesertaMandiri,
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
                                  hintText: "Masukkan jumlah peserta Mandiri",
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
                      height: 40,
                    ),
                    Text(
                      "Koperasi Berbadan Hukum",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 15,
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
                            "Jumlah Kelompok",
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
                                controller: tKelompokHukum,
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
                                  hintText: "Masukkan jumlah kelompok",
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
                            "Jumlah Peserta",
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
                                controller: tPesertaHukum,
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
                                  hintText: "Masukkan jumlah peserta",
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
                          print(idAkun);
                          if (_formKey.currentState!.validate()) {
                            String jumlah_kelompok_pemula =
                                tKelompokPemula.text.toString();
                            String jumlah_peserta_pemula =
                                tPesertaPemula.text.toString();
                            String jumlah_kelompok_madya =
                                tKelompokMadya.text.toString();
                            String jumlah_peserta_madya =
                                tPesertaMadya.text.toString();
                            String jumlah_kelompok_utama =
                                tKelompokUtama.text.toString();
                            String jumlah_peserta_utama =
                                tPesertaUtama.text.toString();
                            String jumlah_kelompok_mandiri =
                                tKelompokMandiri.text.toString();
                            String jumlah_peserta_mandiri =
                                tPesertaMandiri.text.toString();
                            String jumlah_kelompok_hukum =
                                tKelompokHukum.text.toString();
                            String jumlah_peserta_hukum =
                                tPesertaHukum.text.toString();
                            GetApi.LaporanPengembangan(
                              context: context,
                              jumlah_kelompok_pemula: jumlah_kelompok_pemula,
                              jumlah_peserta_pemula: jumlah_peserta_pemula,
                              jumlah_kelompok_madya: jumlah_kelompok_madya,
                              jumlah_peserta_madya: jumlah_peserta_madya,
                              jumlah_kelompok_utama: jumlah_kelompok_utama,
                              jumlah_peserta_utama: jumlah_peserta_utama,
                              jumlah_kelompok_mandiri: jumlah_kelompok_mandiri,
                              jumlah_peserta_mandiri: jumlah_peserta_mandiri,
                              jumlah_kelompok_hukum: jumlah_kelompok_hukum,
                              jumlah_peserta_hukum: jumlah_peserta_hukum,
                              userID: idAkun,
                            ).then(
                              (value) => {
                                print('Berhasil'),
                              },
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 55, 149, 183),
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
