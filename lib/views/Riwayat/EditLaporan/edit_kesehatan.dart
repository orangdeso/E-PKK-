// ignore_for_file: body_might_complete_normally_nullable

import 'package:cherry_toast/cherry_toast.dart';
import 'package:e_pkk/models/ApiEditLaporan.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PageEditKesehatan extends StatefulWidget {
  final String id;
  final String posyandu;
  final String terintegrasi;
  final String klp;
  final String anggota;
  final String kartu;

  PageEditKesehatan({
    Key? key,
    required this.id,
    required this.posyandu,
    required this.terintegrasi,
    required this.klp,
    required this.anggota,
    required this.kartu,
  }) : super(key: key);

  @override
  State<PageEditKesehatan> createState() => _PageEditKesehatanState();
}

class _PageEditKesehatanState extends State<PageEditKesehatan> {
  final _formKey = GlobalKey<FormState>();
  late String id_laporan;

  TextEditingController getJmlPosyandu = TextEditingController();
  TextEditingController getJmlPosyanduInterasi = TextEditingController();
  TextEditingController getJmlKLP = TextEditingController();
  TextEditingController getJmlAnggota = TextEditingController();
  TextEditingController getKartuBerobat = TextEditingController();

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
    getJmlPosyandu.text = widget.posyandu;
    getJmlPosyanduInterasi.text = widget.terintegrasi;
    getJmlKLP.text = widget.klp;
    getJmlAnggota.text = widget.anggota;
    getKartuBerobat.text = widget.kartu;
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
                        height: 30,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SizedBox(
                          //   height: 15,
                          // ),
                          // Text(
                          //   "Kategori",
                          //   style:
                          //       TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                          // ),
                          // SizedBox(
                          //   height: 15,
                          // ),
                          // TextFormField(
                          //   decoration: InputDecoration(
                          //       suffixIcon: IconButton(
                          //         onPressed: () {},
                          //         icon: Icon(Icons.keyboard_arrow_down),
                          //         color: Colors.black,
                          //       ),
                          //       fillColor: Color.fromARGB(255, 235, 235, 235),
                          //       filled: true,
                          //       hintText: "Pilih Kategori",
                          //       enabledBorder: OutlineInputBorder(
                          //           borderSide: BorderSide(
                          //               width: 2,
                          //               color: Color.fromARGB(255, 226, 226, 226)),
                          //           borderRadius:
                          //               BorderRadius.all(Radius.circular(10))),
                          //       focusedBorder: OutlineInputBorder(
                          //           borderSide: BorderSide(
                          //               width: 2,
                          //               color: Color.fromARGB(255, 226, 226, 226)),
                          //           borderRadius:
                          //               BorderRadius.all(Radius.circular(10)))),
                          // ),
                          // customDropDownLokasiAsalPelapor(
                          //   listItem: ListPosyandu,
                          //   namaLabel: "Kategori",
                          //   hintText: "Pilih Kategori",
                          //   randomlabel: "Posyandu Lansia",
                          //   errorKosong: "Harap Isi",
                          // ),
                          // SizedBox(
                          //   height: 20,
                          // ),
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
                                  "Posyandu",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Jumlah Posyandu",
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
                                      controller: getJmlPosyandu,
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
                                  height: 20,
                                ),
                                Text(
                                  "Posyandu Terintegrasi",
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
                                      controller: getJmlPosyanduInterasi,
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
                                        hintText:
                                            "Masukkan jumlah posyandu terintegrasi",
                                        hintStyle: TextStyle(
                                          color: grey400,
                                          fontSize: 15,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                                // Expanded(
                                //   child: Padding(
                                //     padding: EdgeInsets.only(right: 10),
                                //     child: Column(
                                //       crossAxisAlignment: CrossAxisAlignment.start,
                                //       children: [
                                //         Text(
                                //           "Jumlah posyandu",
                                //           style: TextStyle(
                                //             fontWeight: FontWeight.w500,
                                //             fontSize: 15,
                                //           ),
                                //         ),
                                //         SizedBox(
                                //           height: 15,
                                //         ),
                                //         TextFormField(
                                //           validator: (value) {
                                //             if (value.toString().isEmpty) {
                                //               return "Harap isi Jumlah Posyandu";
                                //             }
                                //           },
                                //           controller: getJmlPosyandu,
                                //           keyboardType: TextInputType.number,
                                //           inputFormatters: [
                                //             FilteringTextInputFormatter.digitsOnly
                                //           ],
                                //           decoration: InputDecoration(
                                //             fillColor:
                                //                 Color.fromARGB(255, 235, 235, 235),
                                //             filled: true,
                                //             hintText: "Masukkan Jumlah",
                                //             hintStyle: TextStyle(
                                //               fontSize: 14,
                                //             ),
                                //             enabledBorder: OutlineInputBorder(
                                //               borderSide: BorderSide(
                                //                 width: 2,
                                //                 color: Color.fromARGB(
                                //                     255, 226, 226, 226),
                                //               ),
                                //               borderRadius: BorderRadius.all(
                                //                 Radius.circular(8),
                                //               ),
                                //             ),
                                //             focusedBorder: OutlineInputBorder(
                                //               borderSide: BorderSide(
                                //                 width: 2,
                                //                 color: Color.fromARGB(
                                //                     255, 226, 226, 226),
                                //               ),
                                //               borderRadius: BorderRadius.all(
                                //                 Radius.circular(8),
                                //               ),
                                //             ),
                                //           ),
                                //           // controller: nameController,
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                                // Expanded(
                                //   child: Padding(
                                //     padding: EdgeInsets.only(left: 10),
                                //     child: Column(
                                //       crossAxisAlignment: CrossAxisAlignment.start,
                                //       children: [
                                //         Text(
                                //           "Posyandu terintengrasi",
                                //           style: TextStyle(
                                //             fontWeight: FontWeight.w500,
                                //             fontSize: 15,
                                //           ),
                                //         ),
                                //         SizedBox(
                                //           height: 15,
                                //         ),
                                //         TextFormField(
                                //           validator: (value) {
                                //             if (value.toString().isEmpty) {
                                //               return "Harap isi Jumlah Posyandu Terintegrasi";
                                //             }
                                //           },
                                //           controller: getJmlPosyanduInterasi,
                                //           keyboardType: TextInputType.number,
                                //           inputFormatters: <TextInputFormatter>[
                                //             FilteringTextInputFormatter.digitsOnly,
                                //             LengthLimitingTextInputFormatter(13),
                                //           ],
                                //           decoration: InputDecoration(
                                //             fillColor:
                                //                 Color.fromARGB(255, 235, 235, 235),
                                //             filled: true,
                                //             hintText: "Masukkan Jumlah",
                                //             hintStyle: TextStyle(
                                //               fontSize: 14,
                                //             ),
                                //             enabledBorder: OutlineInputBorder(
                                //               borderSide: BorderSide(
                                //                 width: 2,
                                //                 color: Color.fromARGB(
                                //                     255, 226, 226, 226),
                                //               ),
                                //               borderRadius: BorderRadius.all(
                                //                 Radius.circular(8),
                                //               ),
                                //             ),
                                //             focusedBorder: OutlineInputBorder(
                                //               borderSide: BorderSide(
                                //                   width: 2,
                                //                   color: Color.fromARGB(
                                //                       255, 226, 226, 226)),
                                //               borderRadius: BorderRadius.all(
                                //                 Radius.circular(8),
                                //               ),
                                //             ),
                                //           ),
                                //           // controller: emailController,
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // ),
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
                                  "Lansia",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
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
                                      controller: getJmlKLP,
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
                                        hintText: "Masukkan jumlah KLP",
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
                                  "Jumlah Anggota",
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
                                      controller: getJmlAnggota,
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
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Jumlah yang Memiliki Kartu Berobat Gratis",
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
                                      controller: getKartuBerobat,
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
                                        hintText:
                                            "Masukkan jumlah Kartu Berobat Gratis",
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

                                String JumlahPosyandu =
                                    getJmlPosyandu.text.toString();
                                String JumlahPosyanduIterasi =
                                    getJmlPosyanduInterasi.text.toString();
                                String JumlahAnggota =
                                    getJmlAnggota.text.toString();
                                String JumlahKLP = getJmlKLP.text.toString();
                                String JumlahKartuGratis =
                                    getKartuBerobat.text.toString();
                                //print("Tes Fileee :: ${_file}");
                                EditApiLaporan.editLaporanKesehatan(
                                  jumlah_posyandu: JumlahPosyandu,
                                  jumlah_anggota: JumlahAnggota,
                                  jumlah_posyandu_iterasi:
                                      JumlahPosyanduIterasi,
                                  jumlah_klp: JumlahKLP,
                                  jumlah_kartu_gratis: JumlahKartuGratis,
                                  context: context,
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
