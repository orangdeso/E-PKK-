import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../models/ApiLaporan.dart';

class PageLingkunganHidup extends StatefulWidget {
  static String route = '/laporanBidangLingkunganHidup';
  @override
  State<PageLingkunganHidup> createState() => _PageLingkunganHidupState();
}

class _PageLingkunganHidupState extends State<PageLingkunganHidup> {
  final _formKey = GlobalKey<FormState>();
  File? _file;
  static String? namaFileInput;
  TextEditingController getJamban = TextEditingController();
  TextEditingController getSpal = TextEditingController();
  TextEditingController getTps = TextEditingController();
  TextEditingController getMck = TextEditingController();
  TextEditingController getPdam = TextEditingController();
  TextEditingController getSumur = TextEditingController();
  TextEditingController getDll = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 244, 244),
      appBar: AppBar(
        title: Text(
          "Bidang Kelestarian Lingkungan Hidup",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
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
                InkWell(
                  onTap: () async {
                    print("dek");
                    final FilePickerResult? result = await FilePicker.platform
                        .pickFiles(
                            type: FileType.custom,
                            allowedExtensions: ['jpg', 'jpeg', 'png']);

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
                        borderRadius: BorderRadius.circular(15)),
                    child: _file == null || _file == ""
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Upload Gambar",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Silakan Upload gambar di sini",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        : Container(
                            height: 200,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 217, 217, 217),
                                image: DecorationImage(
                                    image: FileImage(_file!),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Upload Laporan",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 217, 217, 217),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Jamban",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    TextFormField(
                                      controller: getJamban,
                                      validator: (value) {
                                        if (value.toString().isEmpty) {
                                          return "Jamban Kosong";
                                        }
                                      },
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      decoration: InputDecoration(
                                          fillColor: Color.fromARGB(
                                              255, 235, 235, 235),
                                          filled: true,
                                          hintText: "Masukkan Jumlah",
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 2,
                                                  color: Color.fromARGB(
                                                      255, 226, 226, 226)),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 2,
                                                  color: Color.fromARGB(
                                                      255, 226, 226, 226)),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)))),
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
                                      "SPAL",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    TextFormField(
                                      controller: getSpal,
                                      validator: (value) {
                                        if (value.toString().isEmpty) {
                                          return "Spal Kosong";
                                        }
                                      },
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      decoration: InputDecoration(
                                          fillColor: Color.fromARGB(
                                              255, 235, 235, 235),
                                          filled: true,
                                          hintText: "Masukkan Jumlah",
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 2,
                                                  color: Color.fromARGB(
                                                      255, 226, 226, 226)),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 2,
                                                  color: Color.fromARGB(
                                                      255, 226, 226, 226)),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)))),
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
                          "Tempat Pembuangan Sampah",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
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
                                  controller: getTps,
                                  validator: (value) {
                                    if (value.toString().isEmpty) {
                                      return "Tps Kosong";
                                    }
                                  },
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                      fillColor:
                                          Color.fromARGB(255, 235, 235, 235),
                                      filled: true,
                                      hintText: "Masukkan Jumlah",
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 2,
                                              color: Color.fromARGB(
                                                  255, 226, 226, 226)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 2,
                                              color: Color.fromARGB(
                                                  255, 226, 226, 226)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)))),
                                  // controller: nameController,
                                ),
                              ),
                            ),
                            Expanded(child: Container()),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Jumlah MCK",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
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
                              controller: getMck,
                              validator: (value) {
                                if (value.toString().isEmpty) {
                                  return "Mck Kosong";
                                }
                              },
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                  fillColor: Color.fromARGB(255, 235, 235, 235),
                                  filled: true,
                                  hintText: "Masukkan Jumlah",
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: Color.fromARGB(
                                              255, 226, 226, 226)),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: Color.fromARGB(
                                              255, 226, 226, 226)),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)))),
                              // controller: nameController,
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Jumlah yang menggunakan Air",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 217, 217, 217),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "PDAM",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        TextFormField(
                                          controller: getPdam,
                                          validator: (value) {
                                            if (value.toString().isEmpty) {
                                              return "Pdam Kosong";
                                            }
                                          },
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          decoration: InputDecoration(
                                              fillColor: Color.fromARGB(
                                                  255, 235, 235, 235),
                                              filled: true,
                                              hintText: "Masukkan Jumlah",
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 2,
                                                      color: Color.fromARGB(
                                                          255, 226, 226, 226)),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 2,
                                                      color: Color.fromARGB(
                                                          255, 226, 226, 226)),
                                                  borderRadius:
                                                      BorderRadius.all(Radius.circular(10)))),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Sumur",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        TextFormField(
                                          controller: getSumur,
                                          validator: (value) {
                                            if (value.toString().isEmpty) {
                                              return "Sumur Kosong";
                                            }
                                          },
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          decoration: InputDecoration(
                                              fillColor: Color.fromARGB(
                                                  255, 235, 235, 235),
                                              filled: true,
                                              hintText: "Masukkan Jumlah",
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 2,
                                                      color: Color.fromARGB(
                                                          255, 226, 226, 226)),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 2,
                                                      color: Color.fromARGB(
                                                          255, 226, 226, 226)),
                                                  borderRadius:
                                                      BorderRadius.all(Radius.circular(10)))),
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
                              "Dll",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
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
                                      controller: getDll,
                                      validator: (value) {
                                        if (value.toString().isEmpty) {
                                          return "Dan lain lain Kosong";
                                        }
                                      },
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      decoration: InputDecoration(
                                          fillColor: Color.fromARGB(
                                              255, 235, 235, 235),
                                          filled: true,
                                          hintText: "Masukkan Jumlah",
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 2,
                                                  color: Color.fromARGB(
                                                      255, 226, 226, 226)),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 2,
                                                  color: Color.fromARGB(
                                                      255, 226, 226, 226)),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)))),
                                      // controller: nameController,
                                    ),
                                  ),
                                ),
                                Expanded(child: Container()),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          GetApi.LaporanBidangLingkuhanHidup(
                              fileBruh: _file,
                              jamban: getJamban.text,
                              spal: getSpal.text,
                              mck: getMck.text,
                              tps: getTps.text,
                              IdUser: '5',
                              context: context,
                              pdam: getPdam.text,
                              sumur: getSumur.text,
                              danlainlain: getDll.text);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 55, 149, 183),
                          minimumSize: Size.fromHeight(50)),
                      child: Text("UPLOAD"),
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
