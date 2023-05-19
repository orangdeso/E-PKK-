import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PageGaleri extends StatefulWidget {
  @override
  State<PageGaleri> createState() => _PageGaleriState();
}

class _PageGaleriState extends State<PageGaleri> {
  TextEditingController? getJmlKLP = TextEditingController();
  File? _file;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                      controller: getJmlKLP,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
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
                      controller: getJmlKLP,
                      keyboardType: TextInputType.number,
                      readOnly: true,

                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.date_range),
                            color: Colors.grey,
                          ),
                          fillColor: Color.fromARGB(255, 235, 235, 235),
                          filled: true,
                          hintText: "Masukkan Jumlah",
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
