import 'package:flutter/material.dart';

import '../../helpers/ApiHelper.dart';
import '../navbar_view.dart';

class PageDetailPerencaanSehat extends StatefulWidget {
  @override
  State<PageDetailPerencaanSehat> createState() =>
      _PageDetailPerencaanSehatState();
}

class _PageDetailPerencaanSehatState extends State<PageDetailPerencaanSehat> {
  Color WarnaButton({String? stts}) {
    if (stts == "Proses") {
      return Colors.blueAccent;
    } else {
      return Colors.green;
    }
  }

  Map? getData;
  @override
  Widget build(BuildContext context) {
    getData = ModalRoute.of(context)?.settings.arguments as Map;
    String PriaSubur = getData?['jps'];
    String WanitaSubur = getData?['jws'];
    String KbPria = getData?['kbp'];
    String KbWanita = getData?['kbw'];
    String TabunganKeluarga = getData?['kk_tbg'];
    String tanggal = getData?['tgl'];
    String gambar = getData?['gbr'];
    String status = getData?['stss'];

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Bidang Perencanaan Sehat",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => navbarView(),
                ),
              );
            },
            icon: Icon(Icons.arrow_back),
          ),
          elevation: 1,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
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
                              "${ApiHelper.url}../public/frontend2/Bidang_Perencaan_Sehat/${gambar}"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.date_range_outlined),
                        SizedBox(
                          width: 10,
                        ),
                        Text("${tanggal}"),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Card(
                      color: WarnaButton(stts: "${status}"),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 10,
                        ),
                        child: Text(
                          "${status}",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Align(
              //   alignment: Alignment.topRight,
              //   child: Card(
              //     color: WarnaButton(stts: "${status}"),
              //     child: Padding(
              //       padding: const EdgeInsets.symmetric(
              //           horizontal: 40, vertical: 10),
              //       child: Text(
              //         "${status}",hfhfhf
              //         style: TextStyle(color: Colors.white),
              //       ),
              //     ),
              //   ),
              // ),
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
                            children: [
                              Text("Jumlah Pria Usia Subur (PUS)"),
                              Text("${PriaSubur}")
                            ],
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
                              Text("Jumlah Pria Wanita Subur (WUS)"),
                              Text("${WanitaSubur}")
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
                            children: [
                              Text("Aseptor KB Pria"),
                              Text("${KbPria}")
                            ],
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
                            children: [
                              Text("Aseptor KB Wanita"),
                              Text("${KbWanita}")
                            ],
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
                              Text("KK yang memiliki tabungan keluarga"),
                              Text("${TabunganKeluarga}")
                            ],
                          ),
                          Divider(
                            thickness: 2,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
        )));
  }
}
