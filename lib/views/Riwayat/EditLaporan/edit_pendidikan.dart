// ignore_for_file: body_might_complete_normally_nullable

import 'package:cherry_toast/cherry_toast.dart';
import 'package:e_pkk/models/ApiEditLaporan.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PageEditPendidikan extends StatefulWidget {
  final String id;
  final String buta;
  final String kelA;
  final String wargaA;
  final String kelB;
  final String wargaB;
  final String kelC;
  final String wargaC;
  final String kelKF;
  final String wargaKF;
  final String paud;
  final String taman;
  final String klp;
  final String ape;
  final String ibu;
  final String simulasi;
  final String KF;
  final String paud_tutor;
  final String BKB;
  final String koperasi;
  final String ketrampilan;
  final String LP3PKK;
  final String TP3PKK;
  final String damas;

  PageEditPendidikan({
    Key? key,
    required this.id,
    required this.buta,
    required this.kelA,
    required this.wargaA,
    required this.kelB,
    required this.wargaB,
    required this.kelC,
    required this.wargaC,
    required this.kelKF,
    required this.wargaKF,
    required this.paud,
    required this.taman,
    required this.klp,
    required this.ape,
    required this.ibu,
    required this.simulasi,
    required this.KF,
    required this.paud_tutor,
    required this.BKB,
    required this.koperasi,
    required this.ketrampilan,
    required this.LP3PKK,
    required this.TP3PKK,
    required this.damas,
  }) : super(key: key);

  @override
  State<PageEditPendidikan> createState() => _PageEditPendidikanState();
}

class _PageEditPendidikanState extends State<PageEditPendidikan> {
  final _formKey = GlobalKey<FormState>();
  late String id_laporan;

  TextEditingController tButa = TextEditingController();
  TextEditingController tKelA = TextEditingController();
  TextEditingController tWargaA = TextEditingController();
  TextEditingController tKelB = TextEditingController();
  TextEditingController tWargaB = TextEditingController();
  TextEditingController tKelC = TextEditingController();
  TextEditingController tWargaC = TextEditingController();
  TextEditingController tKelKF = TextEditingController();
  TextEditingController tWargaKF = TextEditingController();
  TextEditingController tpaud = TextEditingController();
  TextEditingController tTaman = TextEditingController();
  TextEditingController tKlp = TextEditingController();
  TextEditingController tIbu = TextEditingController();
  TextEditingController tApe = TextEditingController();
  TextEditingController tKelSimulasi = TextEditingController();
  TextEditingController tKF = TextEditingController();
  TextEditingController tPaudTutor = TextEditingController();
  TextEditingController tBKB = TextEditingController();
  TextEditingController tKoperasi = TextEditingController();
  TextEditingController tKetrampilan = TextEditingController();
  TextEditingController tLP3PKK = TextEditingController();
  TextEditingController tTP3PKK = TextEditingController();
  TextEditingController tDamas = TextEditingController();

  var isLoading = true;

  void loadTampilan() {
    setState(() {
      Future.delayed(Duration(seconds: 3), () {
        CherryToast.info(
          shadowColor: grey300,
          toastDuration: Duration(seconds: 4),
          title: Text(
            "Silahkan edit data laporan Anda",
          ),
        ).show(context);
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
    tButa.text = widget.buta;
    tKelA.text = widget.kelA;
    tWargaA.text = widget.wargaA;
    tKelB.text = widget.kelB;
    tWargaB.text = widget.wargaB;
    tKelC.text = widget.kelC;
    tWargaC.text = widget.wargaC;
    tKelKF.text = widget.kelKF;
    tWargaKF.text = widget.wargaKF;
    tpaud.text = widget.paud;
    tTaman.text = widget.taman;
    tKlp.text = widget.klp;
    tIbu.text = widget.ibu;
    tApe.text = widget.ape;
    tKelSimulasi.text = widget.simulasi;
    tKF.text = widget.KF;
    tPaudTutor.text = widget.paud_tutor;
    tBKB.text = widget.BKB;
    tKoperasi.text = widget.koperasi;
    tKetrampilan.text = widget.ketrampilan;
    tLP3PKK.text = widget.LP3PKK;
    tTP3PKK.text = widget.TP3PKK;
    tDamas.text = widget.damas;
    id_laporan = widget.id;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 244, 244),
      appBar: AppBar(
        title: Text(
          "Edit Laporan",
          style: TextStyle(
            color: Colors.grey.shade800,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.grey.shade800,
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        shadowColor: Colors.grey.shade200,
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
                              fontWeight: FontWeight.w400,
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
                        height: 20,
                      ),
                      Text(
                        "Jumlah Kelompok Belajar",
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
                                  "Jumlah warga Yang Masih Buta",
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
                                      controller: tButa,
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
                                            "Masukkan jumlah warga yang masih buta",
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
                                Divider(
                                  thickness: 1,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Paket A",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Kel. Belajar",
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
                                      controller: tKelA,
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
                                            "Masukkan jumlah kel. belajar A",
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
                                  "Warga Belajar",
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
                                      controller: tWargaA,
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
                                            "Masukkan jumlah warga belajar A",
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
                                  "Paket B",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Kel. Belajar",
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
                                      controller: tKelB,
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
                                            "Masukkan jumlah kel. belajar B",
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
                                  "Warga Belajar",
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
                                      controller: tWargaB,
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
                                            "Masukkan jumlah warga belajar B",
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
                                  "Paket C",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Kel. Belajar",
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
                                      controller: tKelC,
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
                                            "Masukkan jumlah kel. belajar C",
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
                                  "Warga Belajar",
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
                                      controller: tWargaC,
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
                                            "Masukkan jumlah warga belajar C",
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
                                  "KF",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Kel. Belajar",
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
                                      controller: tKelKF,
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
                                            "Masukkan jumlah kel. belajar KF",
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
                                  "Warga Belajar",
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
                                      controller: tWargaKF,
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
                                            "Masukkan jumlah warga belajar KF",
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
                                Divider(
                                  thickness: 1,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Paud / Sejenis",
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
                                      controller: tpaud,
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
                                            "Masukkan jumlah paud / sejenis",
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
                                  "Jumlah Taman Bacaan / Perpustakaan",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
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
                                      controller: tTaman,
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
                                            "Masukkan jumlah taman bacaan / perpustakaan",
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
                            "BKP",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
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
                                  "Jumlah KLP",
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
                                      controller: tKlp,
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
                                        hintText: "Masukkan jumlah klp",
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
                                  "Jumlah Ibu Peserta",
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
                                      controller: tIbu,
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
                                        hintText: "Masukkan jumlah ibu peserta",
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
                                  "Jumlah APE (SET)",
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
                                      controller: tApe,
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
                                        hintText: "Masukkan jumlah ape (set)",
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
                                  "Jumlah Kel. Simulasi",
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
                                      controller: tKelSimulasi,
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
                                            "Masukkan jumlah kel. simulasi",
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
                            "Kader Khusus",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
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
                                  "Tutor",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "KF",
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
                                      controller: tKF,
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
                                        hintText: "Masukkan jumlah KF",
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
                                  "Paud / Sejenis",
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
                                      controller: tPaudTutor,
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
                                            "Masukkan jumlah paud / sejenis",
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
                                Divider(
                                  thickness: 1,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "BKB",
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
                                      controller: tBKB,
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
                                        hintText: "Masukkan jumlah BKB",
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
                                  "Koperasi",
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
                                      controller: tKoperasi,
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
                                        hintText: "Masukkan jumlah koperasi",
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
                                  "Ketrampilan",
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
                                      controller: tKetrampilan,
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
                                        hintText: "Masukkan jumlah ketrampilan",
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
                            "Jumlah Kader Yang Sudah Dilatih",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
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
                                  "LP3PKK",
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
                                      controller: tLP3PKK,
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
                                        hintText: "Masukkan jumlah LP3PKK",
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
                                  "TP3PKK",
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
                                      controller: tTP3PKK,
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
                                        hintText: "Masukkan jumlah TP3PKK",
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
                                  "DAMAS PKK",
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
                                      controller: tDamas,
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
                                        hintText: "Masukkan jumlah DAMAS PKK",
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
                                // print(idAkun);
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

                                  String warga_buta = tButa.text.toString();
                                  String kel_belajarA = tKelA.text.toString();
                                  String warga_belajarA =
                                      tWargaA.text.toString();
                                  String kel_belajarB = tKelB.text.toString();
                                  String warga_belajarB =
                                      tWargaB.text.toString();
                                  String kel_belajarC = tKelC.text.toString();
                                  String warga_belajarC =
                                      tWargaC.text.toString();
                                  String kel_belajarKF = tKelKF.text.toString();
                                  String warga_belajarKF =
                                      tWargaKF.text.toString();
                                  String paud = tpaud.text.toString();
                                  String taman_bacaan = tTaman.text.toString();
                                  String jumlah_klp = tKlp.text.toString();
                                  String jumlah_ibu_peserta =
                                      tIbu.text.toString();
                                  String jumlah_ape = tApe.text.toString();
                                  String jumlah_kel_simulasi =
                                      tKelSimulasi.text.toString();
                                  String KF = tKF.text.toString();
                                  String paud_tutor =
                                      tPaudTutor.text.toString();
                                  String BKB = tBKB.text.toString();
                                  String koperasi = tKoperasi.text.toString();
                                  String ketrampilan =
                                      tKetrampilan.text.toString();
                                  String LP3PKK = tLP3PKK.text.toString();
                                  String TP3PKK = tTP3PKK.text.toString();
                                  String damas_pkk = tDamas.text.toString();
                                  EditApiLaporan.editLaporanPendidikan(
                                    context: context,
                                    warga_buta: warga_buta,
                                    kel_belajarA: kel_belajarA,
                                    warga_belajarA: warga_belajarA,
                                    kel_belajarB: kel_belajarB,
                                    warga_belajarB: warga_belajarB,
                                    kel_belajarC: kel_belajarC,
                                    warga_belajarC: warga_belajarC,
                                    kel_belajarKF: kel_belajarKF,
                                    warga_belajarKF: warga_belajarKF,
                                    paud: paud,
                                    taman_bacaan: taman_bacaan,
                                    jumlah_klp: jumlah_klp,
                                    jumlah_ibu_peserta: jumlah_ibu_peserta,
                                    jumlah_ape: jumlah_ape,
                                    jumlah_kel_simulasi: jumlah_kel_simulasi,
                                    KF: KF,
                                    paud_tutor: paud_tutor,
                                    BKB: BKB,
                                    koperasi: koperasi,
                                    ketrampilan: ketrampilan,
                                    LP3PKK: LP3PKK,
                                    TP3PKK: TP3PKK,
                                    damas_pkk: damas_pkk,
                                    userID: id_laporan,
                                  ).then(
                                    (value) => {
                                      print('Berhasil'),
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
