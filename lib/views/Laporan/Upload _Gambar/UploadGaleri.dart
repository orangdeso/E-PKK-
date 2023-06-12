import 'dart:io';
import 'package:e_pkk/models/ApiLaporan.dart';
import 'package:e_pkk/models/DataAkun.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageGaleri extends StatefulWidget {
  static String route = "/page_galeery";
  @override
  State<PageGaleri> createState() => _PageGaleriState();
}

class _PageGaleriState extends State<PageGaleri> {
  final _formKey = GlobalKey<FormState>();
  String idAkun = '';
  late Future<DataAkun> futureAkun;

  Future<void> getIdAkun() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String idAkunValue = prefs.getString("id_akun") ?? '';
    setState(() {
      idAkun = idAkunValue;
    });
  }

  //Get Multi Image
  // Future<List<String>> pickMultipleFiles({List<String>? imggg}) async {
  //   // List<String> paths = [];
  //   try {
  //     FilePickerResult? result = await FilePicker.platform
  //         .pickFiles(allowMultiple: true, type: FileType.image);
  //     if (result != null) {
  //       setState(() {
  //         for (PlatformFile file in result.files) {
  //           imggg!.add(file.path!);
  //         }
  //       });
  //     }
  //   } catch (e) {
  //     print('Error saat memilih file: $e');
  //   }
  //   return imggg;
  // }

//Convert Type File
  Future<List<File>> convertPathsToFiles(List<String> paths) async {
    List<File> files = [];

    for (String path in paths) {
      File file = File(path);
      files.add(file);
    }

    return files;
  }

  TextEditingController? getJudul = TextEditingController();
  TextEditingController? getDesc = TextEditingController();
  TextEditingController? getTgl = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    getIdAkun();
    setState(() {});
  }

  File? _file;
  PlatformFile? _fileP;
  List<File> kumpulanImage = [];
  List<String> selectedPaths = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 244, 244),
      appBar: AppBar(
        title: Text(
          "Upload Galery",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
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
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: InkWell(
                    onTap: () async {
                      //Single
                      // final FilePickerResult? result =
                      //     await FilePicker.platform.pickFiles(
                      //   type: FileType.custom,
                      //   allowedExtensions: ['jpg', 'jpeg', 'png'],
                      // );
                      // if (result != null) {
                      //   setState(
                      //     () {
                      //       _file = File(result.files.single.path!);
                      //       PlatformFile namaFile = result.files.first;
                      //       // namaFileInput = namaFile.name.toString();
                      //     },
                      //   );
                      // }
                      //End Single
                      //Multi Imageeee
                      try {
                        FilePickerResult? result = await FilePicker.platform
                            .pickFiles(
                                allowMultiple: true, type: FileType.image);
                        if (result != null) {
                          setState(() {
                            for (PlatformFile file in result.files) {
                              selectedPaths.add(file.path!);
                            }
                            // _file = File(result.files.single.path!);
                          });
                          kumpulanImage =
                              await convertPathsToFiles(selectedPaths);
                          setState(() {
                            _file = kumpulanImage.isNotEmpty
                                ? kumpulanImage[0]
                                : null;
                          });
                        }
                      } catch (e) {
                        print('Error saat memilih file: $e');
                      }
                    },
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color:
                            kumpulanImage.isEmpty || kumpulanImage.length == 0
                                ? Color.fromARGB(255, 217, 217, 217)
                                : Color.fromARGB(255, 244, 244, 244),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: kumpulanImage.isEmpty ||
                              kumpulanImage.length == 0 ||
                              kumpulanImage == null
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
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: kumpulanImage.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                      kumpulanImage[index],
                                      fit: BoxFit.cover,
                                      width: 300,
                                      height: 50,
                                    ),
                                  ),
                                );
                                // return Container(
                                //   height: 200,
                                //   decoration: BoxDecoration(
                                //     color: Color.fromARGB(255, 217, 217, 217),
                                //     image: DecorationImage(
                                //       image: FileImage(kumpulanImage[index]),
                                //       fit: BoxFit.cover,
                                //     ),
                                //     borderRadius: BorderRadius.circular(10),
                                //   ),
                                // );
                              },
                            ),
                      // Container(
                      //     height: 200,
                      //     decoration: BoxDecoration(
                      //       color: Color.fromARGB(255, 217, 217, 217),
                      //       image: DecorationImage(
                      //         image: FileImage(_file!),
                      //         fit: BoxFit.cover,
                      //       ),
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //   ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                    right: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Judul",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
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
                        maxLines: 4,
                        textAlignVertical: TextAlignVertical.top,
                        controller: getJudul,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          fillColor: Color.fromARGB(255, 235, 235, 235),
                          filled: true,
                          hintText: "Masukkan Judul",
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
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 20),
                      //   child: Text(
                      //     "Nama kegiatan",
                      //     style: TextStyle(
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 15,
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      // TextFormField(
                      //   validator: (value) {
                      //     if (value.toString().isEmpty) {
                      //       return "Isi nama kegiatan";
                      //     }
                      //   },
                      //   maxLines: 4,
                      //   textAlignVertical: TextAlignVertical.top,
                      //   controller: getDesc,
                      //   decoration: InputDecoration(
                      //     fillColor: Color.fromARGB(255, 235, 235, 235),
                      //     filled: true,
                      //     hintText: "Isi nama kegiatan",
                      //     enabledBorder: OutlineInputBorder(
                      //       borderSide: BorderSide(
                      //         width: 2,
                      //         color: Color.fromARGB(255, 226, 226, 226),
                      //       ),
                      //       borderRadius: BorderRadius.all(
                      //         Radius.circular(8),
                      //       ),
                      //     ),
                      //     focusedBorder: OutlineInputBorder(
                      //       borderSide: BorderSide(
                      //         width: 2,
                      //         color: Color.fromARGB(255, 226, 226, 226),
                      //       ),
                      //       borderRadius: BorderRadius.all(
                      //         Radius.circular(8),
                      //       ),
                      //     ),
                      //   ),
                      //   // controller: nameController,
                      // ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Tanggal",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return "Harap pilih Tanggal";
                          }
                        },
                        controller: getTgl,
                        keyboardType: TextInputType.number,
                        readOnly: true,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
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
                              color: Color.fromARGB(255, 226, 226, 226),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 226, 226, 226),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        // controller: nameController,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Text(
                      //   "Masukkan beberapa foto kegiatan",
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.w500,
                      //     fontSize: 15,
                      //   ),
                      // ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: ElevatedButton(
                          onPressed: () async {
                            String pp =
                                DateFormat('yyyy-MM-dd').format(selectedDate);
                            print("tanggal == ${pp}");
                            print("judul == ${getJudul!.text}");
                            //print("desk == ${getDesc!.text}");
                            print("tes path single == $_file");
                            for (String item in selectedPaths) {
                              print("gambar terpilih == $item");
                            }
                            kumpulanImage =
                                await convertPathsToFiles(selectedPaths);
                            for (File file in kumpulanImage) {
                              print("fileterpilih == $file.path ");
                            }
                            if (_formKey.currentState!.validate()) {
                              GetApi.DoubleuploadDataImage(
                                imageFiles: kumpulanImage,
                                judul: getJudul!.text,
                                //desc: getDesc!.text,
                                tanggal: pp,
                                idUser: idAkun,
                                context: context,
                              ).then((value) => {
                                    _file == null,
                                    kumpulanImage.clear(),
                                    selectedPaths.clear(),
                                    getJudul!.clear(),
                                    //getDesc!.clear(),
                                    getTgl!.clear(),
                                    pp == ""
                                  });
                            }
                            // GetApi.InsertGallery(
                            //   file: _file,
                            //   judul: getJudul!.text,
                            //   desc: getDesc!.text,
                            //   tanggal: pp,
                            //   idUser: idAkun,
                            //   context: context,
                            // );
                            print(idAkun);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 55, 149, 183),
                            minimumSize: Size.fromHeight(50),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
