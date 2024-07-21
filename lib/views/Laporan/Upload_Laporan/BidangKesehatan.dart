// ignore_for_file: body_might_complete_normally_nullable, unused_field
// import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:e_pkk/models/DataAKun.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/ApiLaporan.dart';

class PageBidangKesehatan extends StatefulWidget {
  static String route = '/laporanBidangKesehatan';
  @override
  State<PageBidangKesehatan> createState() => _PageBidangKesehatanState();
}

class _PageBidangKesehatanState extends State<PageBidangKesehatan> {
  final _formKey = GlobalKey<FormState>();
  static String? randomValueAsalPelapor = "Topik lainnya";
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

  TextEditingController getJmlPosyandu = TextEditingController();
  TextEditingController getJmlPosyanduInterasi = TextEditingController();
  TextEditingController getJmlKLP = TextEditingController();
  TextEditingController getJmlAnggota = TextEditingController();
  TextEditingController getKartuBerobat = TextEditingController();

  final List<String> ListPosyandu = [
    'Posyandu Lansia',
    'Posyandu Remaja',
    'Posyandu Balita'
  ];

  // File? _file;
  // static String? namaFileInput;

  Succes() {
    getJmlPosyandu.text = "";
    getJmlPosyanduInterasi.text = "";
    getJmlKLP.text = "";
    getJmlAnggota.text = "";
    getKartuBerobat.text = "";
  }

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
          "Kesehatan",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
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
                                GetApi.LaporanBidangKesehatan(
                                  jumlah_posyandu: JumlahPosyandu,
                                  jumlah_anggota: JumlahAnggota,
                                  jumlah_posyandu_iterasi:
                                      JumlahPosyanduIterasi,
                                  jumlah_klp: JumlahKLP,
                                  jumlah_kartu_gratis: JumlahKartuGratis,
                                  context: context,
                                  userID: idAkun,
                                ).then(
                                  (value) => {
                                    print("awikwok"),
                                    print(idAkun),
                                    Succes(),
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
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  // Widget customDropDownLokasiAsalPelapor(
  //     {List<String>? listItem,
  //     String? namaLabel,
  //     String? hintText,
  //     String? randomlabel,
  //     String? errorKosong}) {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.start,
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       SizedBox(
  //         height: 10,
  //       ),
  //       Text(
  //         "$namaLabel",
  //         style: TextStyle(
  //           fontWeight: FontWeight.w500,
  //           fontSize: 15,
  //         ),
  //       ),
  //       SizedBox(
  //         height: 15,
  //       ),
  //       DropdownButtonFormField2(
  //         decoration: InputDecoration(
  //           filled: true,
  //           fillColor: Color.fromARGB(255, 235, 235, 235),
  //           isDense: true,
  //           contentPadding: EdgeInsets.only(
  //             bottom: 5.0,
  //             top: 5.0,
  //             right: 5.0,
  //           ),
  //           enabledBorder: OutlineInputBorder(
  //             borderSide: BorderSide(
  //                 width: 2, color: Color.fromARGB(255, 226, 226, 226)),
  //             borderRadius: BorderRadius.all(
  //               Radius.circular(8),
  //             ),
  //           ),
  //           border: OutlineInputBorder(
  //             borderSide: BorderSide(
  //                 width: 2, color: Color.fromARGB(255, 226, 226, 226)),
  //             borderRadius: BorderRadius.all(
  //               Radius.circular(8),
  //             ),
  //           ),
  //           focusedBorder: OutlineInputBorder(
  //             borderSide: BorderSide(
  //               width: 2,
  //               color: Color.fromARGB(255, 226, 226, 226),
  //             ),
  //           ),
  //         ),
  //         isExpanded: true,
  //         hint: Text(
  //           '$hintText',
  //           style: TextStyle(fontSize: 14),
  //         ),
  //         items: listItem
  //             ?.map(
  //               (item) => DropdownMenuItem<String>(
  //                 value: item,
  //                 child: Text(
  //                   item,
  //                   style: TextStyle(
  //                     fontSize: 14,
  //                   ),
  //                 ),
  //               ),
  //             )
  //             .toList(),
  //         validator: (value) {
  //           if (value == null) {
  //             return 'Harap Memilih $errorKosong !.';
  //           }
  //           return null;
  //         },
  //         onChanged: (value) {
  //           setState(() {
  //             randomValueAsalPelapor = value;
  //           });
  //         },
  //         buttonStyleData: ButtonStyleData(
  //           height: 50,
  //           padding: EdgeInsets.only(right: 10),
  //         ),
  //         iconStyleData: const IconStyleData(
  //           icon: Icon(
  //             Icons.keyboard_arrow_down,
  //             color: Colors.black45,
  //           ),
  //           iconSize: 30,
  //         ),
  //         dropdownStyleData: DropdownStyleData(
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(15),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
