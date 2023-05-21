import 'package:flutter/material.dart';

import '../../helpers/ApiHelper.dart';
import '../navbar_view.dart';

class DetailGallery extends StatefulWidget {
  @override
  State<DetailGallery> createState() => _DetailGalleryState();
}

class _DetailGalleryState extends State<DetailGallery> {
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
    String stss = getData!['status'];
    String tglll = getData!['tanggal'];
    String juudull = getData!['judul'];
    String descc = getData!['deskripsi'];
    String gbrrr = getData!['gambar'];
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Gallery",
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
                                  "${ApiHelper.url}assets/gallery/${gbrrr}"),
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
                    Text("${tglll}"),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${juudull}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Card(
                      color: WarnaButton(stts: "${stss}"),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                        child: Text(
                          "${stss}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent, width: 2),
                    borderRadius: BorderRadius.circular(20)),
                height: 300,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("${descc}"),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}