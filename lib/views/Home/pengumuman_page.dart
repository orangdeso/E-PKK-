import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:e_pkk/helpers/ApiHelper.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../models/PengumumanModel.dart';

class PengumumanPage extends StatefulWidget {
  const PengumumanPage({super.key});

  @override
  State<PengumumanPage> createState() => _PengumumanPageState();
}

class _PengumumanPageState extends State<PengumumanPage> {
  int _current = 0;
  List<Data> myData = [];
  //List<Data> Data = [];
  //List<dynamic> listPengumuman = [];

  void tampilkanData() async {
    PengumumanModel.tampilPengumuman(context).then((value) {
      myData = value.data!;
      setState(() {});
    });
  }

  // Future<void> fetchData() async {
  //   final response =
  //       await http.get(Uri.parse(ApiHelper.url + "getPengumuman.php"));

  //   if (response.statusCode == 200) {
  //     final jsonData = json.decode(response.body);
  //     setState(() {
  //       listPengumuman = jsonData['data'];
  //     });
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }

  @override
  void initState() {
    super.initState();
    tampilkanData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pengumuman"),
          backgroundColor: ktextColor,
          centerTitle: true,
        ),
        backgroundColor: grey100,
        body: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: myData.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Padding(
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
                          '${myData[index].tanggalPengumuman}',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        title: Text(
                          '${myData[index].judulPengumuman}',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ));
  }
}
