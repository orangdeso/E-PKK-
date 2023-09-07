import 'package:e_pkk/models/SemuaGambar.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:flutter/material.dart';
import '../../helpers/ApiHelper.dart';

class DetailGallery extends StatefulWidget {
  @override
  State<DetailGallery> createState() => _DetailGalleryState();
}

class _DetailGalleryState extends State<DetailGallery> {
  Color WarnaButton({String? stts}) {
    if (stts == "Proses") {
      return Colors.orange.shade400;
    } else {
      return Colors.green.shade500;
    }
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

  Map? getData;
  late Future<List<GetLinkGambar>> listGambar;
  @override
  void initState() {
    super.initState();
    loadTampilan();
  }

  @override
  Widget build(BuildContext context) {
    getData = ModalRoute.of(context)?.settings.arguments as Map;
    String idGalery = getData!['idGalery'];
    listGambar = fetchGambar(idGalery: idGalery);
    String des = getData!['deskripsi'];
    //String gbr = getData!['gambar'];
    String pokja = getData!['pokja'];
    String bidang = getData!['bidang'];
    String stss = getData!['status'];
    String tglll = getData!['tanggal'];
    String waktu = getData!['waktu'];

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 244, 244),
      appBar: AppBar(
        title: Text(
          "Detail Galeri",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator(
                color: ktextColor,
                backgroundColor: Colors.grey.shade400,
                semanticsLabel: 'Loading',
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Detail Status",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_month,
                              //color: grey500,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Text(
                                "${tglll}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time_rounded,
                              //color: grey500,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Text(
                                "${waktu}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Card(
                          //elevation: 8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          color: WarnaButton(stts: stss),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            child: Text(
                              "${stss}",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "ID Galeri  :  ${idGalery}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: ktextColor,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Jenis Laporan",
                          style: TextStyle(
                            color: Colors.grey.shade500,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${pokja}",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Program Kerja",
                          style: TextStyle(
                            color: Colors.grey.shade500,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${bidang}",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Deskripsi",
                      style: TextStyle(
                        color: Colors.grey.shade500,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${des}",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FutureBuilder(
                      future: listGambar,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Container();
                        } else if (snapshot.hasError) {
                          return Text("Terjadi Eror ${snapshot.error}");
                        } else {
                          List<GetLinkGambar> dataa = snapshot.data!;
                          print("tess ${dataa.length}");
                          if (dataa.length != 0) {
                            return Expanded(
                              child: GridView.builder(
                                itemCount: dataa.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    //color: Colors.grey,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        "${ApiHelper.url}../public/frontend2/gallery2/${dataa[index].urlGambar}",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          }
                        }
                        return Container();
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // InkWell(
                    //   onTap: () async {},
                    //   child: Container(
                    //     height: 200,
                    //     decoration: BoxDecoration(
                    //       color: Color.fromARGB(255, 217, 217, 217),
                    //       borderRadius: BorderRadius.circular(20),
                    //     ),
                    //     child: Container(
                    //       height: 200,
                    //       decoration: BoxDecoration(
                    //         color: Color.fromARGB(255, 217, 217, 217),
                    //         image: DecorationImage(
                    //             image: NetworkImage(
                    //                 "${ApiHelper.url}assets/gallery/${gbrrr}"),
                    //             fit: BoxFit.cover),
                    //         borderRadius: BorderRadius.circular(20),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    // Container(
                    //   decoration: BoxDecoration(
                    //     border: Border.all(color: Colors.blueAccent, width: 2),
                    //     borderRadius: BorderRadius.circular(20),
                    //   ),
                    //   height: 300,
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(10.0),
                    //     // child: Text(
                    //     //   "${descc}",
                    //     // ),
                    //   ),
                    // ),
                  ],
                ),
              ),
      ),
    );
  }
}
