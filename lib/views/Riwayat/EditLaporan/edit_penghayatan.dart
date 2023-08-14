import 'package:cherry_toast/cherry_toast.dart';
import 'package:e_pkk/models/ApiEditLaporan.dart';
import 'package:e_pkk/models/DataAKun.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageEditPenghayatan extends StatefulWidget {
  final String id;
  final String kel1;
  final String ang1;
  final String kel2;
  final String ang2;
  final String kel3;
  final String ang3;
  final String kel4;
  final String ang4;

  PageEditPenghayatan({
    Key? key,
    required this.id,
    required this.kel1,
    required this.ang1,
    required this.kel2,
    required this.ang2,
    required this.kel3,
    required this.ang3,
    required this.kel4,
    required this.ang4,
  }) : super(key: key);

  @override
  State<PageEditPenghayatan> createState() => _PageEditPenghayatanState();
}

class _PageEditPenghayatanState extends State<PageEditPenghayatan> {
  final _formKey = GlobalKey<FormState>();
  late String id_laporan;

  TextEditingController getJmlSimulasi1 = TextEditingController();
  TextEditingController getJmlAnggota1 = TextEditingController();
  TextEditingController getJmlSimulasi2 = TextEditingController();
  TextEditingController getJmlAnggota2 = TextEditingController();
  TextEditingController getJmlSimulasi3 = TextEditingController();
  TextEditingController getJmlAnggota3 = TextEditingController();
  TextEditingController getJmlSimulasi4 = TextEditingController();
  TextEditingController getJmlAnggota4 = TextEditingController();

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
    getJmlSimulasi1.text = widget.kel1;
    getJmlAnggota1.text = widget.ang1;
    getJmlSimulasi2.text = widget.kel2;
    getJmlAnggota2.text = widget.ang2;
    getJmlSimulasi3.text = widget.kel3;
    getJmlAnggota3.text = widget.ang3;
    getJmlSimulasi4.text = widget.kel4;
    getJmlAnggota4.text = widget.ang4;
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
                            height: 20,
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Sosialisasi Pendidikan PKBN",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              Align(
                                alignment: FractionalOffset.topLeft,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 15, bottom: 15),
                                  child: Text(
                                    "Jumlah Kel. Simulasi",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: grey800,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  bottom: 15,
                                  left: 15,
                                  right: 15,
                                ),
                                child: Container(
                                  //margin: EdgeInsets.symmetric(vertical: 10),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 2,
                                  ),
                                  //width: size.width * 0.9,
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: grey200,
                                      width: 1.2,
                                    ),
                                  ),
                                  child: TextFormField(
                                    controller: getJmlSimulasi1,
                                    // onChanged: (value) {
                                    //   _onTextFieldChanged();
                                    // },
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
                                      hintText: "Masukkan jumlah kel. simulasi",
                                      hintStyle: TextStyle(
                                        color: grey400,
                                        fontSize: 15,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: FractionalOffset.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 15, top: 10, bottom: 15),
                                  child: Text(
                                    "Jumlah Anggota",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: grey800,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 15,
                                  right: 15,
                                ),
                                child: Container(
                                  //margin: EdgeInsets.symmetric(vertical: 10),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 2,
                                  ),
                                  //width: size.width * 0.9,
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: grey200,
                                      width: 1.2,
                                    ),
                                  ),
                                  child: TextFormField(
                                    controller: getJmlAnggota1,
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
                                      hintText: "Masukkan jumlah anggota",
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
                            "PKDRT",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              Align(
                                alignment: FractionalOffset.topLeft,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 15, bottom: 15),
                                  child: Text(
                                    "Jumlah Kel. Simulasi",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: grey800,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  bottom: 15,
                                  left: 15,
                                  right: 15,
                                ),
                                child: Container(
                                  //margin: EdgeInsets.symmetric(vertical: 10),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 2,
                                  ),
                                  //width: size.width * 0.9,
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: grey200,
                                      width: 1.2,
                                    ),
                                  ),
                                  child: TextFormField(
                                    controller: getJmlSimulasi2,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'tidak boleh kosong';
                                      }
                                    },
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration: InputDecoration(
                                      hintText:
                                          "Masukkan jumlah kel. simulasi PKDR",
                                      hintStyle: TextStyle(
                                        color: grey400,
                                        fontSize: 15,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: FractionalOffset.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 15, top: 10, bottom: 15),
                                  child: Text(
                                    "Jumlah Anggota",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: grey800,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 15,
                                  right: 15,
                                ),
                                child: Container(
                                  //margin: EdgeInsets.symmetric(vertical: 10),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 2,
                                  ),
                                  //width: size.width * 0.9,
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: grey200,
                                      width: 1.2,
                                    ),
                                  ),
                                  child: TextFormField(
                                    controller: getJmlAnggota2,
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
                                      hintText: "Masukkan jumlah anggota PKDRT",
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
                        ],
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
                        "Pola Asuh",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Align(
                            alignment: FractionalOffset.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 15, bottom: 15),
                              child: Text(
                                "Jumlah Kel. Simulasi",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  color: grey800,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: 15,
                              left: 15,
                              right: 15,
                            ),
                            child: Container(
                              //margin: EdgeInsets.symmetric(vertical: 10),
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 2,
                              ),
                              //width: size.width * 0.9,
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: grey200,
                                  width: 1.2,
                                ),
                              ),
                              child: TextFormField(
                                controller: getJmlSimulasi3,
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
                                      "Masukkan jumlah kel. simulasi Pola Asuh",
                                  hintStyle: TextStyle(
                                    color: grey400,
                                    fontSize: 15,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: FractionalOffset.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 15, top: 10, bottom: 15),
                              child: Text(
                                "Jumlah Anggota",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  color: grey800,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: Container(
                              //margin: EdgeInsets.symmetric(vertical: 10),
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 2,
                              ),
                              //width: size.width * 0.9,
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: grey200,
                                  width: 1.2,
                                ),
                              ),
                              child: TextFormField(
                                controller: getJmlAnggota3,
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
                                  hintText: "Masukkan jumlah anggota Pola Asuh",
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
                        "Lansia",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Align(
                            alignment: FractionalOffset.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 15, bottom: 15),
                              child: Text(
                                "Jumlah Kel. Simulasi",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  color: grey800,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: 15,
                              left: 15,
                              right: 15,
                            ),
                            child: Container(
                              //margin: EdgeInsets.symmetric(vertical: 10),
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 2,
                              ),
                              //width: size.width * 0.9,
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: grey200,
                                  width: 1.2,
                                ),
                              ),
                              child: TextFormField(
                                controller: getJmlSimulasi4,
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
                                      "Masukkan jumlah kel. simulasi Lansia",
                                  hintStyle: TextStyle(
                                    color: grey400,
                                    fontSize: 15,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: FractionalOffset.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 15, top: 10, bottom: 15),
                              child: Text(
                                "Jumlah Anggota",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  color: grey800,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: Container(
                              //margin: EdgeInsets.symmetric(vertical: 10),
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 2,
                              ),
                              //width: size.width * 0.9,
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: grey200,
                                  width: 1.2,
                                ),
                              ),
                              child: TextFormField(
                                controller: getJmlAnggota4,
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
                                  hintText: "Masukkan jumlah anggota Lansia",
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
                      SizedBox(
                        height: 40,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
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
                              // Menunda eksekusi selama 3 detik
                              await Future.delayed(Duration(seconds: 3));
                              if (_formKey.currentState!.validate()) {
                                String jumlah_kel_simulasi1 =
                                    getJmlSimulasi1.text.toString();
                                String jumlah_anggota1 =
                                    getJmlAnggota1.text.toString();
                                String jumlah_kel_simulasi2 =
                                    getJmlSimulasi2.text.toString();
                                String jumlah_anggota2 =
                                    getJmlAnggota2.text.toString();
                                String jumlah_kel_simulasi3 =
                                    getJmlSimulasi3.text.toString();
                                String jumlah_anggota3 =
                                    getJmlAnggota3.text.toString();
                                String jumlah_kel_simulasi4 =
                                    getJmlSimulasi4.text.toString();
                                String jumlah_anggota4 =
                                    getJmlAnggota4.text.toString();
                                EditApiLaporan.editLaporanPenghayatan(
                                  context: context,
                                  jumlah_kel_simulasi1: jumlah_kel_simulasi1,
                                  jumlah_anggota1: jumlah_anggota1,
                                  jumlah_kel_simulasi2: jumlah_kel_simulasi2,
                                  jumlah_anggota2: jumlah_anggota2,
                                  jumlah_kel_simulasi3: jumlah_kel_simulasi3,
                                  jumlah_anggota3: jumlah_anggota3,
                                  jumlah_kel_simulasi4: jumlah_kel_simulasi4,
                                  jumlah_anggota4: jumlah_anggota4,
                                  userID: id_laporan,
                                ).then(
                                  (value) => {
                                    print("Berhasil"),
                                    //Succes(),
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
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              "UPLOAD",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
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
