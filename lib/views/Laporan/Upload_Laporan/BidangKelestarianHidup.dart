// ignore_for_file: body_might_complete_normally_nullable
import 'package:e_pkk/models/DataAKun.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/ApiLaporan.dart';

class PageLingkunganHidup extends StatefulWidget {
  static String route = '/laporanBidangLingkunganHidup';
  @override
  State<PageLingkunganHidup> createState() => _PageLingkunganHidupState();
}

class _PageLingkunganHidupState extends State<PageLingkunganHidup> {
  final _formKey = GlobalKey<FormState>();
  //File? _file;
  //static String? namaFileInput;
  String idAkun = '';
  late Future<DataAkun> futureAkun;

  Future<void> getIdAkun() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String idAkunValue = prefs.getString("id_akun") ??
        ''; // Menggunakan operator nullish coalescing untuk menetapkan nilai default jika kunci tidak ada
    setState(() {
      idAkun = idAkunValue;
    });
  }

  TextEditingController getJamban = TextEditingController();
  TextEditingController getSpal = TextEditingController();
  TextEditingController getTps = TextEditingController();
  TextEditingController getMck = TextEditingController();
  TextEditingController getPdam = TextEditingController();
  TextEditingController getSumur = TextEditingController();
  TextEditingController getDll = TextEditingController();

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
          "Kelestarian Lingkungan Hidup",
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
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
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
                      //       borderRadius: BorderRadius.circular(8),
                      //     ),
                      //     child: _file == null || _file == ""
                      //         ? Column(
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             children: [
                      //               Text(
                      //                 "Upload Gambar",
                      //                 style: TextStyle(
                      //                   fontWeight: FontWeight.bold,
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
                      //                   fontWeight: FontWeight.bold,
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
                      //               borderRadius: BorderRadius.circular(8),
                      //             ),
                      //           ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 30,
                      // ),
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
                                  "Jumlah Rumah Yang Memiliki",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Jamban",
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
                                      controller: getJamban,
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
                                        hintText: "Masukkan jumlah jamban",
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
                                  "SPAL",
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
                                      controller: getSpal,
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
                                        hintText: "Masukkan jumlah SPAL",
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
                                  "Tempat Pembuangan Sampah",
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
                                      controller: getTps,
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
                                            "Masukkan jumlah tempat pembuangan sampah",
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
                                  "Jumlah MCK",
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
                                      controller: getMck,
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
                                        hintText: "Masukkan jumlah MCK",
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
                                  "Jumlah KART Yang Menggunakan Air",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                
                                Text(
                                  "PDAM",
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
                                      controller: getPdam,
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
                                        hintText: "Masukkan jumlah PDAM",
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
                                  "Sumur",
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
                                      controller: getSumur,
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
                                        hintText: "Masukkan jumlah sumur",
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
                                  "Lain lainnya",
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
                                      controller: getDll,
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
                                            "Masukkan jumlah lain lainnya",
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
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
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

                            GetApi.LaporanBidangLingkuhanHidup(
                              jamban: getJamban.text,
                              spal: getSpal.text,
                              mck: getMck.text,
                              tps: getTps.text,
                              IdUser: idAkun,
                              context: context,
                              pdam: getPdam.text,
                              sumur: getSumur.text,
                              danlainlain: getDll.text,
                            );
                            print(idAkun);
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
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
