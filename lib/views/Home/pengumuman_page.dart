import 'package:e_pkk/utils/constants.dart';
import 'package:flutter/material.dart';

class PengumumanPage extends StatefulWidget {
  const PengumumanPage({super.key});

  @override
  State<PengumumanPage> createState() => _PengumumanPageState();
}

class _PengumumanPageState extends State<PengumumanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pengumuman"),
          backgroundColor: ktextColor,
          centerTitle: true,
        ),
        backgroundColor: grey100,
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: grey300,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 5), // changes position of shadow
                    ),
                  ],
                ),
                child: ListTile(
                  leading: Text(
                    "10-11-2023",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  title: Text(
                    "Program Kesehatan Imunisasi per desa di Kantor Balai Desa",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
