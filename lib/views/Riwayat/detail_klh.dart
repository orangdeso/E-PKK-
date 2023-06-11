import 'package:e_pkk/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../helpers/ApiHelper.dart';
import '../navbar_view.dart';

class PageDetailKlh extends StatefulWidget {
  @override
  State<PageDetailKlh> createState() => _PageDetailKlhState();
}

class _PageDetailKlhState extends State<PageDetailKlh> {
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
    String jbn = getData?['jamban'];
    String tgl = getData?['tanggal'];
    String spl = getData?['spal'];
    String tps = getData?['tps'];
    String mck = getData?['mck'];
    String pdam = getData?['pdam'];
    String smr = getData?['sumur'];
    String dll = getData?['dll'];
    String gbr = getData?['gambar'];
    String stss = getData?['stss'];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Bidang Kelestarian L H",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
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
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 217, 217, 217),
                        image: DecorationImage(
                            image: NetworkImage(
                                "${ApiHelper.url}assets/Bidang_LingkunganHidup/${gbr}"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: grey500,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "${tgl}",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Card(
                        color: WarnaButton(stts: "${stss}"),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 10,
                          ),
                          child: Text(
                            "${stss}",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
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
                              children: [
                                Text("Jumlah rumah dengan jamban"),
                                Text("${jbn}")
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
                                Text("Jumlah rumah dengan spal"),
                                Text("${spl}")
                              ],
                            ),
                            Divider(
                              thickness: 2,
                            ),
                          ],
                        ),
                        //pertama Jumlah KLP
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Jumlah rumah dengan tps"),
                                Text("${tps}")
                              ],
                            ),
                            Divider(
                              thickness: 2,
                            ),
                          ],
                        ),
                        //pertama Jumlah Posyandu Anggota
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Jumlah rumah dengan mck"),
                                Text("${mck}")
                              ],
                            ),
                            Divider(
                              thickness: 2,
                            ),
                          ],
                        ),
                        //pertama Jumlah Posyandu Integrasi
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Jumlah rumah dengan pdam"),
                                Text("${pdam}")
                              ],
                            ),
                            Divider(
                              thickness: 2,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Jumlah rumah dengan dll"),
                                Text("${dll}")
                              ],
                            ),
                            Divider(
                              thickness: 2,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
