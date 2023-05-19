import 'package:e_pkk/views/navbar_view.dart';
import 'package:flutter/material.dart';

import '../../helpers/ApiHelper.dart';

class PageDetailSehat extends StatefulWidget {
  @override
  State<PageDetailSehat> createState() => _PageDetailSehatState();
}

class _PageDetailSehatState extends State<PageDetailSehat> {
  Map? getData;
  @override
  Widget build(BuildContext context) {
    getData = ModalRoute.of(context)?.settings.arguments as Map;
    String gbr = getData?['gambar'];
    String tgl = getData?['tanggal'];
    String ktg = getData?['kategori_laporan'];
    String psy = getData?['jml_posyandu'];
    String psy_i = getData?['jml_posint'];
    String klp = getData?['jml_klp'];
    String agt = getData?['jml_anggota'];
    String krt = getData?['jml_kartu'];
    String sts = getData?['stss'];
    // TODO: implement build
    Color WarnaButton({String? stts}) {
      if (stts == "Proses") {
        return Colors.blueAccent;
      } else {
        return Colors.green;
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Detail Bidang Kesehatan",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => navbarView()));
              },
              icon: Icon(Icons.arrow_back_ios)),
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          // iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
        ),
        body: Center(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
              child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {},
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 217, 217, 217),
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 217, 217, 217),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "${ApiHelper.url}assets/Bidang_kesehatan/$gbr"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.date_range_outlined),
                    SizedBox(
                      width: 10,
                    ),
                    Text("${tgl}"),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${ktg}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Card(
                  color: WarnaButton(stts: sts),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    child: Text(
                      "${sts}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 2.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //pertama Jumlah Posyandu
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text("Jumlah Posyandu"), Text("${psy}")],
                          ),
                          Divider(
                            thickness: 2,
                          )
                        ],
                      ),
                      //pertama Jumlah Posyandu Integrasi
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Jumlah Posyandu terintegrasi"),
                              Text("${psy_i}")
                            ],
                          ),
                          Divider(
                            thickness: 2,
                          )
                        ],
                      ),
                      //pertama Jumlah KLP
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text("Jumlah KLP"), Text("${klp}")],
                          ),
                          Divider(
                            thickness: 2,
                          )
                        ],
                      ),
                      //pertama Jumlah Posyandu Anggota
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text("Jumlah anggota"), Text("${agt}")],
                          ),
                          Divider(
                            thickness: 2,
                          )
                        ],
                      ),
                      //pertama Jumlah Posyandu Integrasi
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Jumlah yang memiliki kartu Berobat Gratis"),
                              Text("${krt}")
                            ],
                          ),
                          Divider(
                            thickness: 2,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
        )));
  }
}
