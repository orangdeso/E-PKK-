import 'package:e_pkk/helpers/ApiHelper.dart';
import 'package:e_pkk/models/LoginApi.dart';
import 'package:e_pkk/models/Riwayat.dart';
import 'package:e_pkk/models/laporanModel.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RiwayatPage extends StatefulWidget {
  const RiwayatPage({super.key});

  @override
  State<RiwayatPage> createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage> {
  int _current = 0;
  List<Data> listLaporan = [];
  List<dynamic> _data = [];

  //Repository repository = Repository();
  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse(ApiHelper.url + "getRiwayat.php"));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      setState(() {
        _data = jsonData['data'];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  // getData() async {
  //   listLaporan = await repository.getRiwayat();
  // }

  List<Tab> myTab = [
    Tab(
      child: Text(
        "Menunggu",
        style: GoogleFonts.inter(
          textStyle: TextStyle(),
        ),
      ),
    ),
    Tab(
      child: Text(
        "Proses",
        style: GoogleFonts.inter(
          textStyle: TextStyle(),
        ),
      ),
    ),
    Tab(
      child: Text(
        "Selesai",
        style: GoogleFonts.inter(
          textStyle: TextStyle(),
        ),
      ),
    ),
  ];

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: myTab.length,
        child: Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
            ),
            title: Text(
              "Riwayat",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: ktextColor,
            bottom: TabBar(
              indicatorColor: blueLight50,
              labelColor: whiteColor,
              unselectedLabelColor: grey400,
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.normal,
              ),
              tabs: myTab,
            ),
          ),
          resizeToAvoidBottomInset: true,
          body: TabBarView(
            children: [
              // ListView.builder(
              //   itemCount: _data.length,
              //   itemBuilder: (context, index) {
              //     return ListTile(
              //       title: Text(_data[index]['title_laporan']),
              //       subtitle: Text(_data[index]['tanggal']),
              //       leading: CircleAvatar(
              //         backgroundImage: NetworkImage(_data[index]['image']),
              //       ),
              //     );
              //   },
              // ),
              ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                itemCount: _data.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Container(
                          // height: 170,
                          // width: 300,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 10,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: _data[index]['image'].isNotEmpty
                                        ? Image.asset(
                                            _data[index]['image'],
                                            height: 110,
                                            width: 130,
                                            fit: BoxFit.cover,
                                          )
                                        : Image.asset(
                                            "assets/images/po.png",
                                            height: 110,
                                            width: 130,
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          // (listLaporan[index].titleLaporan ==
                                          //         null)
                                          //     ? "P"
                                          //     : "P : ${listLaporan[index].titleLaporan}",
                                          // listLaporan[index]
                                          //     .titleLaporan
                                          //     .toString(),
                                          _data[index]['title_laporan'] ??
                                              'Not Title',
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 5,
                                              horizontal: 5,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.greenAccent
                                                  .withOpacity(0.5),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Text(
                                              _data[index]['status'] ??
                                                  'Not Title',
                                              // listLaporan[index]
                                              //     .status
                                              //     .toString(),
                                              // (listLaporan[index].status ==
                                              //         null)
                                              //     ? "status"
                                              //     : "status : ${listLaporan[index].status}",
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Text(
                                    _data[index]['tanggal'] ?? 'Not Title',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              ListView(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                children: [
                  //for (int i = 0; i < 10; i++)
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          // height: 170,
                          // width: 300,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 10,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      "assets/images/po.png",
                                      height: 130,
                                      width: 130,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "Title Laporan Title Laporan Title Laporan",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 5,
                                              horizontal: 5,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.greenAccent
                                                  .withOpacity(0.5),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Text(
                                              "status",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5, top: 2),
                                  child: Text(
                                    "12-12-2023",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              ListView(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                children: [
                  //for (int i = 0; i < 10; i++)
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          // height: 170,
                          // width: 300,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 10,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      "assets/images/po.png",
                                      height: 130,
                                      width: 130,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "Title Laporan Title Laporan Title Laporan",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 5,
                                              horizontal: 5,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.greenAccent
                                                  .withOpacity(0.5),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Text(
                                              "status",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5, top: 2),
                                  child: Text(
                                    "12-12-2023",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
