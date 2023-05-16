import 'package:flutter/material.dart';

import 'BidangKelestarianHidup.dart';
import 'BidangKesehatan.dart';
import 'BidangPerencananSehat.dart';
// import 'package:insert_laporan/page_laporan_bidang_kesehatan.dart';
// import 'package:insert_laporan/page_laporan_kelestarianLH.dart';
// import 'package:insert_laporan/page_laporan_perencaanSehat.dart';

class PageLaporanMenu extends StatefulWidget {
  static String route = '/laporanUtama';
  @override
  State<PageLaporanMenu> createState() => _PageLaporanMenuState();
}

class _PageLaporanMenuState extends State<PageLaporanMenu> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Upload Laporan",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 54, 151, 186),
                    Color.fromARGB(255, 149, 210, 232)
                  ]),
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pokja IV",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 28,
                              fontFamily: 'Times New Roman'),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Container(
                            width: 200,
                            child: Text(
                              "Silakan pilih button sesuai dengan bidang yang ingin di lakukan upload laporan",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Text(
                              "Pelajari Selengkapnya",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 58, 153, 188)),
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                        width: 150,
                        height: 150,
                        child: Image(
                          image: AssetImage("assets/images/puan_kun.png"),
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                print("Bruh");
                Navigator.pushNamed(
                    context, PageBidangKesehatan.route.toString());
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(250, 247, 201, 204),
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  leading: Icon(Icons.heart_broken),
                  title: Text(
                    "Bidang Kesehatan",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text("Upload Laporan Kesehatan"),
                  ),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_circle_right_outlined)),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                print("p");
                Navigator.pushNamed(
                    context, PageLingkunganHidup.route.toString());
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(250, 187, 229, 194),
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  leading: Icon(Icons.heart_broken),
                  title: Text(
                    "Bidang Kelestarian Lingkungan Hidup",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text("Upload Laporan Kesehatan"),
                  ),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_circle_right_outlined)),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                print("object");
                Navigator.pushNamed(
                    context, PagePerencaanSehat.route.toString());
              },
              highlightColor: Colors.blue.withOpacity(0.4),
              splashColor: Colors.white.withOpacity(0.5),
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(250, 245, 229, 218),
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  leading: Icon(Icons.heart_broken),
                  title: Text(
                    "Bidang Perencanaan Sehat",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text("Upload Laporan Kesehatan"),
                  ),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_circle_right_outlined)),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
