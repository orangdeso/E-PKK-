// ignore_for_file: body_might_complete_normally_nullable

import 'package:cherry_toast/cherry_toast.dart';
import 'package:e_pkk/models/ApiEditLaporan.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PageEditKader4 extends StatefulWidget {
  final String id;
  final String posyandu;
  final String gizi;
  final String kesling;
  final String penyuluhan;
  final String phbs;
  final String kb;

  PageEditKader4({
    Key? key,
    required this.id,
    required this.posyandu,
    required this.gizi,
    required this.kesling,
    required this.penyuluhan,
    required this.phbs,
    required this.kb,
  }) : super(key: key);

  @override
  State<PageEditKader4> createState() => _PageEditKader4State();
}

class _PageEditKader4State extends State<PageEditKader4> {
  final _formKey = GlobalKey<FormState>();
  late String id_laporan;

  TextEditingController tPosyandu = TextEditingController();
  TextEditingController tGizi = TextEditingController();
  TextEditingController tKesling = TextEditingController();
  TextEditingController tPenyuluhan = TextEditingController();
  TextEditingController tPHBS = TextEditingController();
  TextEditingController tKB = TextEditingController();

  var isLoading = true;

  void loadTampilan() {
    setState(() {
      Future.delayed(Duration(seconds: 2), () {
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
    tPosyandu.text = widget.posyandu;
    tGizi.text = widget.gizi;
    tKesling.text = widget.kesling;
    tPenyuluhan.text = widget.penyuluhan;
    tPHBS.text = widget.phbs;
    tKB.text = widget.kb;
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
                                    controller: tPosyandu,
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
                                    controller: tGizi,
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
                                    controller: tKesling,
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
                                    controller: tPenyuluhan,
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
                                    controller: tPHBS,
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
                                    controller: tKB,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Tidak boleh kosong';
                                      }
                                    },
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(11),
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

                                String pos = tPosyandu.text.toString();
                                String gizi = tGizi.text.toString();
                                String kes = tKesling.text.toString();
                                String pen = tPenyuluhan.text.toString();
                                String phbs = tPHBS.text.toString();
                                String kb = tKB.text.toString();
                                EditApiLaporan.editLaporanKader4(
                                  context: context,
                                  posyandu: pos,
                                  gizi: gizi,
                                  kesling: kes,
                                  penyuluhan: pen,
                                  PHBS: phbs,
                                  KB: kb,
                                  userID: id_laporan,
                                ).then(
                                  (value) => {},
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
    );
  }
}
