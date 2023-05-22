import 'dart:io';
import 'package:e_pkk/models/ApiLaporan.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class PageGaleri extends StatefulWidget {
  static String route = "/page_galeery";
  @override
  State<PageGaleri> createState() => _PageGaleriState();
}

class _PageGaleriState extends State<PageGaleri> {
  TextEditingController? getJudul = TextEditingController();
  TextEditingController? getDesc = TextEditingController();
  TextEditingController? getTgl = TextEditingController();
  DateTime selectedDate = DateTime.now();

  File? _file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 244, 244),
      appBar: AppBar(
        title: Text(
          "Upload Galery",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              InkWell(
                onTap: () async {
                  final FilePickerResult? result = await FilePicker.platform
                      .pickFiles(
                          type: FileType.custom,
                          allowedExtensions: ['jpg', 'jpeg', 'png']);
                  if (result != null) {
                    setState(() {
                      _file = File(result.files.single.path!);
                      PlatformFile namaFile = result.files.first;
                      // namaFileInput = namaFile.name.toString();
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
                                  image: FileImage(_file!), fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Judul",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "Harap isi Judul";
                        }
                      },
                      controller: getJudul,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          fillColor: Color.fromARGB(255, 235, 235, 235),
                          filled: true,
                          hintText: "Masukkan Judul",
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Color.fromARGB(255, 226, 226, 226)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Color.fromARGB(255, 226, 226, 226)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                      // controller: nameController,
                    ),
                    Text(
                      "Nama kegiatan",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "Isi nama kegiatan";
                        }
                      },
                      maxLines: 4,
                      textAlignVertical: TextAlignVertical.top,
                      controller: getDesc,
                      //keyboardType: TextInputType.number,
                      //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                          // contentPadding: EdgeInsets.symmetric(
                          // horizontal: 20.0, vertical: 30.0),
                          fillColor: Color.fromARGB(255, 235, 235, 235),
                          filled: true,
                          hintText: "Isi nama kegiatan",
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Color.fromARGB(255, 226, 226, 226)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Color.fromARGB(255, 226, 226, 226)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                      // controller: nameController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Tanggal",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "Harap isi Jumlah KLP";
                        }
                      },
                      controller: getTgl,
                      keyboardType: TextInputType.number,
                      readOnly: true,

                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () async {
                              final DateTime? picked = await showDatePicker(
                                  context: context,
                                  initialDate: selectedDate,
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2025));
                              if (picked != null && picked != selectedDate) {
                                setState(() {
                                  selectedDate = picked;
                                  getTgl!.text = DateFormat('yyyy-MM-dd')
                                      .format(selectedDate);
                                });
                              }
                            },
                            icon: Icon(Icons.date_range),
                            color: Colors.grey,
                          ),
                          fillColor: Color.fromARGB(255, 235, 235, 235),
                          filled: true,
                          hintText: "Pilih Tanggal",
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Color.fromARGB(255, 226, 226, 226)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Color.fromARGB(255, 226, 226, 226)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                      // controller: nameController,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        String pp =
                            DateFormat('yyyy-MM-dd').format(selectedDate);
                        print("tanggal == ${pp}");
                        print("judul == ${getJudul!.text}");
                        print("desk == ${getDesc!.text}");

                        GetApi.InsertGallery(
                            file: _file,
                            judul: getJudul!.text,
                            desc: getDesc!.text,
                            tanggal: pp,
                            idUser: '5',
                            context: context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 55, 149, 183),
                          minimumSize: Size.fromHeight(50)),
                      child: Text("UPLOAD"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
