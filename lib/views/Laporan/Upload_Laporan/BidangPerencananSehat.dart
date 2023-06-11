import 'dart:io';
import 'package:e_pkk/models/ApiLaporan.dart';
import 'package:e_pkk/models/DataAKun.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PagePerencaanSehat extends StatefulWidget {
  static String route = '/perencanaanSehat';
  @override
  State<PagePerencaanSehat> createState() => _PagePerencaanSehatState();
}

class _PagePerencaanSehatState extends State<PagePerencaanSehat> {
  File? _file;
  static String? namaFileInput;
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

  TextEditingController? PriaSubur = TextEditingController();
  TextEditingController? WanitaSubur = TextEditingController();
  TextEditingController? KbPria = TextEditingController();
  TextEditingController? KbWanita = TextEditingController();
  TextEditingController? kkTabungan = TextEditingController();

  @override
  void initState() {
    super.initState();
    getIdAkun();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 244, 244),
      appBar: AppBar(
        title: Text(
          "Bidang Perencanaan Sehat",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  print("dek");
                  final FilePickerResult? result =
                      await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['jpg', 'jpeg', 'png'],
                  );
                  if (result != null) {
                    setState(() {
                      _file = File(result.files.single.path!);
                      PlatformFile namaFile = result.files.first;
                      namaFileInput = namaFile.name.toString();
                    });
                  }
                },
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 217, 217, 217),
                      borderRadius: BorderRadius.circular(10)),
                  child: _file == null || _file == ""
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Upload Gambar",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Silakan Upload gambar di sini",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        )
                      : Container(
                          height: 200,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 217, 217, 217),
                            image: DecorationImage(
                                image: FileImage(_file!), fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Jumlah Pria Usia Subur (PUS)",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: TextFormField(
                        controller: PriaSubur,
                        decoration: InputDecoration(
                          fillColor: Color.fromARGB(255, 235, 235, 235),
                          filled: true,
                          hintText: "Masukkan Jumlah",
                          hintStyle: TextStyle(
                            fontSize: 14,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color.fromARGB(255, 226, 226, 226)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 226, 226, 226),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                        ),
                        // controller: nameController,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Jumlah Wanita Usia Subur (WUS)",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: TextFormField(
                        controller: WanitaSubur,
                        decoration: InputDecoration(
                          fillColor: Color.fromARGB(255, 235, 235, 235),
                          filled: true,
                          hintText: "Masukkan Jumlah",
                          hintStyle: TextStyle(
                            fontSize: 14,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 226, 226, 226),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 226, 226, 226),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                        ),
                        // controller: nameController,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
              //ll
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Anggota KB Pria",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: KbPria,
                            decoration: InputDecoration(
                              fillColor: Color.fromARGB(255, 235, 235, 235),
                              filled: true,
                              hintText: "Masukkan Jumlah",
                              hintStyle: TextStyle(
                                fontSize: 14,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Color.fromARGB(255, 226, 226, 226),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Color.fromARGB(255, 226, 226, 226),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                            ),
                            // controller: nameController,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Anggota KB Wanita",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: KbWanita,
                            decoration: InputDecoration(
                              fillColor: Color.fromARGB(255, 235, 235, 235),
                              filled: true,
                              hintText: "Masukkan Jumlah",
                              hintStyle: TextStyle(
                                fontSize: 14,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Color.fromARGB(255, 226, 226, 226),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Color.fromARGB(255, 226, 226, 226),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                            ),
                            // controller: emailController,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "KK yang memiliki tabungan keluarga",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: TextFormField(
                        controller: kkTabungan,
                        decoration: InputDecoration(
                          fillColor: Color.fromARGB(255, 235, 235, 235),
                          filled: true,
                          hintText: "Masukkan Jumlah",
                          hintStyle: TextStyle(
                            fontSize: 14,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 226, 226, 226),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color.fromARGB(255, 226, 226, 226)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                        ),
                        // controller: nameController,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
              //ll

              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    GetApi.LaporanBidangPerencaanKesehatan(
                            fileBruh: _file,
                            PriaSubur: PriaSubur!.text,
                            WanitaSubur: WanitaSubur!.text,
                            Kb_Pria: KbPria!.text,
                            context: context,
                            userID: idAkun,
                            Kb_Wanita: KbWanita!.text,
                            Tabungan_Kk: kkTabungan!.text)
                        .then(
                      (value) => {
                        print('pppppppp'),
                        print(idAkun),
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
        ),
      ),
    );
  }
}
