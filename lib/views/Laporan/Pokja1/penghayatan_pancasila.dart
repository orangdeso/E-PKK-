import 'dart:io';
import 'package:e_pkk/models/DataAKun.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/ApiLaporan.dart';

class PagePokja1 extends StatefulWidget {
  static String route = '/laporanPokja1';
  @override
  State<PagePokja1> createState() => _PagePokja1State();
}

class _PagePokja1State extends State<PagePokja1> {
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

  TextEditingController getJmlSimulasi1 = TextEditingController();
  TextEditingController getJmlAnggota1 = TextEditingController();
  TextEditingController getJmlSimulasi2 = TextEditingController();
  TextEditingController getJmlAnggota2 = TextEditingController();
  TextEditingController getJmlSimulasi3 = TextEditingController();
  TextEditingController getJmlAnggota3 = TextEditingController();
  TextEditingController getJmlSimulasi4 = TextEditingController();
  TextEditingController getJmlAnggota4 = TextEditingController();

  Succes() {
    getJmlSimulasi1.text = "";
    getJmlAnggota1.text = "";
    getJmlSimulasi2.text = "";
    getJmlAnggota2.text = "";
    getJmlSimulasi3.text = "";
    getJmlAnggota3.text = "";
    getJmlSimulasi4.text = "";
    getJmlAnggota4.text = "";
  }

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
          "Penghayatan & Pengamalan Pancasila",
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
                // InkWell(
                //   onTap: () async {
                //     print("dek");
                //     final FilePickerResult? result =
                //         await FilePicker.platform.pickFiles(
                //       type: FileType.custom,
                //       allowedExtensions: ['jpg', 'jpeg', 'png'],
                //     );
                //     if (result != null) {
                //       setState(
                //         () {
                //           _file = File(result.files.single.path!);
                //           PlatformFile namaFile = result.files.first;
                //           namaFileInput = namaFile.name.toString();
                //         },
                //       );
                //     }
                //   },
                //   child: Container(
                //     height: 200,
                //     decoration: BoxDecoration(
                //       color: Color.fromARGB(255, 217, 217, 217),
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //     child: _file == null || _file == ""
                //         ? Column(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               Text(
                //                 "Upload Gambar",
                //                 style: TextStyle(
                //                   fontWeight: FontWeight.w600,
                //                   fontSize: 20,
                //                 ),
                //               ),
                //               SizedBox(
                //                 height: 20,
                //               ),
                //               Text(
                //                 "Silakan Upload gambar di sini",
                //                 style: TextStyle(
                //                   color: Colors.grey,
                //                   fontWeight: FontWeight.w500,
                //                 ),
                //               )
                //             ],
                //           )
                //         : Container(
                //             height: 200,
                //             decoration: BoxDecoration(
                //               color: Color.fromARGB(255, 217, 217, 217),
                //               image: DecorationImage(
                //                 image: FileImage(_file!),
                //                 fit: BoxFit.cover,
                //               ),
                //               borderRadius: BorderRadius.circular(10),
                //             ),
                //           ),
                //   ),
                // ),
                // SizedBox(
                //   height: 25,
                // ),
                ExpansionTile(
                  title: Text(
                    "Sosialisasi Pendidikan PKBN",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                  collapsedBackgroundColor: whiteColor,
                  collapsedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      width: 1,
                      color: Color.fromARGB(106, 172, 172, 172),
                    ),
                  ),
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
                          color: grey100,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: grey300,
                            width: 1.2,
                          ),
                        ),
                        child: TextFormField(
                          controller: getJmlSimulasi1,
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
                        padding: EdgeInsets.only(left: 15, top: 10, bottom: 15),
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
                          color: grey100,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: grey300,
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
                ExpansionTile(
                  title: Text(
                    "PKDRT",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                  collapsedBackgroundColor: whiteColor,
                  collapsedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      width: 1,
                      color: Color.fromARGB(106, 172, 172, 172),
                    ),
                  ),
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
                          color: grey100,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: grey300,
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
                        padding: EdgeInsets.only(left: 15, top: 10, bottom: 15),
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
                          color: grey100,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: grey300,
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
                ExpansionTile(
                  title: Text(
                    "Pola Asuh",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                  collapsedBackgroundColor: whiteColor,
                  collapsedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      width: 1,
                      color: Color.fromARGB(106, 172, 172, 172),
                    ),
                  ),
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
                          color: grey100,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: grey300,
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
                        padding: EdgeInsets.only(left: 15, top: 10, bottom: 15),
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
                          color: grey100,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: grey300,
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
                ExpansionTile(
                  title: Text(
                    "Lansia",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                  collapsedBackgroundColor: whiteColor,
                  collapsedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      width: 1,
                      color: Color.fromARGB(106, 172, 172, 172),
                    ),
                  ),
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
                          color: grey100,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: grey300,
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
                        padding: EdgeInsets.only(left: 15, top: 10, bottom: 15),
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
                          color: grey100,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: grey300,
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
                // SingleChildScrollView(
                //   child: ExpansionPanelList(
                //     expansionCallback: (panelIndex, isExpanded) {},
                //     children: [
                //       ExpansionPanel(
                //         headerBuilder: (context, isExpanded) {
                //           return ListTile(
                //             title: Text(
                //               "Sosialisasi Pendidikan PKBN",
                //               style: TextStyle(
                //                 fontWeight: FontWeight.w500,
                //                 fontSize: 17,
                //               ),
                //             ),
                //           );
                //         },
                //         isExpanded: true,
                //         body: Column(
                //           children: [],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          print("Test Laporan Pengahayatan");
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
                          GetApi.LaporanPenghayatan(
                            context: context,
                            jumlah_kel_simulasi1: jumlah_kel_simulasi1,
                            jumlah_anggota1: jumlah_anggota1,
                            jumlah_kel_simulasi2: jumlah_kel_simulasi2,
                            jumlah_anggota2: jumlah_anggota2,
                            jumlah_kel_simulasi3: jumlah_kel_simulasi3,
                            jumlah_anggota3: jumlah_anggota3,
                            jumlah_kel_simulasi4: jumlah_kel_simulasi4,
                            jumlah_anggota4: jumlah_anggota4,
                            userID: idAkun,
                          ).then(
                            (value) => {
                              print("Berhasil"),
                              //Succes(),
                            },
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 55, 149, 183),
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
