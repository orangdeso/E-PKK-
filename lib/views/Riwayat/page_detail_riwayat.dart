import 'package:e_pkk/views/Riwayat/riwayat_page.dart';
import 'package:flutter/material.dart';

import '../navbar_view.dart';

class PageDetailRiwayat extends StatefulWidget {
  static String route = '/detailRiwayatLaporan';
  @override
  State<PageDetailRiwayat> createState() => _PageDetailRiwayatState();
}

String Kategori({String? kategori}) {
  if (kategori == 7) {
    return "Bidang Kesehatan";
  } else if (kategori == 8) {
    return "Bidang Kelestarian Lingkungan Hidup";
  } else {
    return "Perencanaan Sehat";
  }
}

Color bckGroundColor({String? status}) {
  if (status == "proses") {
    return Colors.blueAccent;
  } else if (status == "menunggu") {
    return Colors.amberAccent;
  } else {
    return Colors.greenAccent;
  }
}

class _PageDetailRiwayatState extends State<PageDetailRiwayat> {
  Map? getData;
  @override
  Widget build(BuildContext context) {
    getData = ModalRoute.of(context)?.settings.arguments as Map;
    String tittle = getData?['title'];
    String tanggall = getData?['tanggal'];
    String deskripsi = getData?['deskripsi'];
    String status = getData?['status'];
    String idKategori = getData?['idKategori'];
    String idUser = getData?['idUser'];
    String imageee = getData?['image'];

    print("Title Detail == ${tittle}");
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => navbarView()));
            },
            icon: Icon(Icons.arrow_back_ios)),
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Detail Laporan",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 250,
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(20)),
              child: imageee.isNotEmpty
                  ? Image.network(
                      height: 110,
                      width: 130,
                      fit: BoxFit.cover,
                      imageee.toString())
                  : Image.asset(
                      "assets/images/po.png",
                      height: 110,
                      width: 130,
                      fit: BoxFit.cover,
                    ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text("${tanggall}"),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    Kategori(kategori: idKategori),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Card(
                  color: bckGroundColor(status: "${status}"),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text("${status}"),
                  ),
                )
              ],
            ),
            Divider(
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${tittle}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${deskripsi} ",
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
