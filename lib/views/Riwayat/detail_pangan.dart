import 'package:e_pkk/models/ApiCancelLaporan.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:e_pkk/views/Riwayat/EditLaporan/edit_pangan.dart';
import 'package:flutter/material.dart';

class PageDetailPangan extends StatefulWidget {
  const PageDetailPangan({super.key});

  @override
  State<PageDetailPangan> createState() => _PageDetailPanganState();
}

class _PageDetailPanganState extends State<PageDetailPangan> {
  bool isButtonAktif = true;
  bool isButtonBatalAktif = true;

  Color WarnaButton({String? stts}) {
    if (stts == "Proses") {
      return Colors.orange.shade400;
    } else if (stts == "Dibatalkan") {
      setState(() => isButtonAktif = false);
      setState(() => isButtonBatalAktif = false);
      return Colors.red.shade400;
    } else if (stts == "Revisi") {
      setState(() => isButtonBatalAktif = false);
      return Colors.blue.shade400;
    } else {
      setState(() => isButtonAktif = false);
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

  @override
  void initState() {
    super.initState();
    loadTampilan();
    setState(() {});
  }

  Map? getData;
  @override
  Widget build(BuildContext context) {
    getData = ModalRoute.of(context)?.settings.arguments as Map;
    String id = getData?['id_pokja3_bidang1'];
    String beras = getData?['beras'];
    String nonBeras = getData?['non_beras'];
    String peter = getData?['peternakan'];
    String peri = getData?['perikanan'];
    String warung = getData?['warung_hidup'];
    String lumbung = getData?['lumbung_hidup'];
    String toga = getData?['toga'];
    String tanaman = getData?['tanaman_keras'];
    String status = getData?['status'];
    String tanggal = getData?['tanggal'];
    String note = getData?['catatan'];
    String waktu = getData?['waktu'];
    // String created_at = getData?['created_at'];
    // String updated_at = getData?['updated_at'];

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 244, 244),
      appBar: AppBar(
        title: Text(
          "Detail Laporan",
          style: TextStyle(
            color: Colors.grey.shade800,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        iconTheme: IconThemeData(
          color: Colors.grey.shade800,
        ),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        shadowColor: Colors.grey.shade200,
      ),
      body: Center(
        child:
            isLoading
                ? CircularProgressIndicator(
                    color: ktextColor,
                    backgroundColor: Colors.grey.shade300,
                    semanticsLabel: 'Loading',
                  )
                :
            Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            child: ListView(
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
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                            "${tanggal}",
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
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: WarnaButton(stts: status),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        child: Text(
                          "${status}",
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
                  "ID Laporan  :  ${id}",
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Detail Data",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Makanan Pokok",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15, left: 10),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Beras",
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Text(
                                  "${beras}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              Text(
                                "Non Beras",
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Text(
                                  "${nonBeras}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
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
                    Text(
                      "Pemanfaatan Pekarangan / Hatinya PKK",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 120,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Peternakan",
                                      style: TextStyle(
                                        color: Colors.grey.shade500,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Text(
                                        "${peter}",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Perikanan",
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text(
                                      "${peri}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 120,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Warung Hidup",
                                      style: TextStyle(
                                        color: Colors.grey.shade500,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Text(
                                        "${warung}",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Lumbung Hidup",
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text(
                                      "${lumbung}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 120,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Toga",
                                      style: TextStyle(
                                        color: Colors.grey.shade500,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Text(
                                        "${toga}",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Tanaman Keras",
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text(
                                      "${tanaman}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
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
                    SizedBox(
                      height: 15,
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Catatan",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        "${note}",
                        style: TextStyle(
                          color: Colors.grey.shade500,
                        ),
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "* Informasi",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10, left: 15),
                              child: Text(
                                "-",
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Container(
                              width: 300,
                              child: Padding(
                                padding: EdgeInsets.only(top: 10, left: 10),
                                child: Text(
                                  "Button Edit aktif jika status laporan dalam tahap proses dan review.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 5, left: 15),
                              child: Text(
                                "-",
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Container(
                              width: 300,
                              child: Padding(
                                padding: EdgeInsets.only(top: 5, left: 10),
                                child: Text(
                                  "Button Batal aktif jika status laporan masih dalam tahap proses.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 5, left: 15),
                              child: Text(
                                "-",
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Container(
                              width: 300,
                              child: Padding(
                                padding: EdgeInsets.only(top: 5, left: 10),
                                child: Text(
                                  "Button Batal digunakan untuk membatalkan upload laporan.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: isButtonBatalAktif
                                ? () {
                                    setState(() => this.isButtonBatalAktif =
                                        isButtonBatalAktif);
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          elevation: 10,
                                          title: Text("Konfirmasi"),
                                          content: Text(
                                            "Apakah Anda ingin membatalkan Upload Laporan ?",
                                            style: TextStyle(
                                              letterSpacing: 1,
                                              height: 1.5,
                                            ),
                                          ),
                                          actions: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                        bottom: 15),
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20),
                                                    child: OutlinedButton(
                                                      onPressed: () async {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      style: OutlinedButton
                                                          .styleFrom(
                                                        minimumSize:
                                                            Size.fromHeight(50),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        side: BorderSide(
                                                          width: 2,
                                                          color: ktextColor,
                                                        ),
                                                      ),
                                                      child: Text(
                                                        "TIDAK",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          letterSpacing: 2,
                                                          color: ktextColor,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                        bottom: 15),
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20),
                                                    child: ElevatedButton(
                                                      onPressed: () async {
                                                        showDialog(
                                                          context: context,
                                                          barrierDismissible:
                                                              false, // Tidak bisa ditutup selama menunggu
                                                          builder: (BuildContext
                                                              context) {
                                                            return Center(
                                                              child:
                                                                  CircularProgressIndicator(
                                                                color:
                                                                    ktextColor,
                                                                backgroundColor:
                                                                    Colors.grey
                                                                        .shade400,
                                                                semanticsLabel:
                                                                    'Loading',
                                                              ),
                                                            );
                                                          },
                                                        );

                                                        await Future.delayed(
                                                            Duration(
                                                                seconds: 3));

                                                        EditBatalkanLaporan
                                                            .cancelLaporanPangan(
                                                          context:
                                                              context,
                                                          userID: id,
                                                        ).then(
                                                          (value) => {
                                                            print(
                                                                "Berhasil")
                                                          },
                                                        );
                                                        // CherryToast.info(
                                                        //   title: Text(
                                                        //     "Fitur masih tahap pengembangan",
                                                        //   ),
                                                        // ).show(context);
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            Color.fromARGB(255,
                                                                55, 149, 183),
                                                        minimumSize:
                                                            Size.fromHeight(50),
                                                        elevation: 5,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                      ),
                                                      child: Text(
                                                        "IYA",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          letterSpacing: 2,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size.fromHeight(50),
                              backgroundColor: Colors.redAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              // side: BorderSide(
                              //   width: 2,
                              //   color: ktextColor,
                              // ),
                            ),
                            child: Text(
                              "BATAL",
                              style: TextStyle(
                                fontSize: 18,
                                letterSpacing: 2,
                                fontWeight: FontWeight.w600,
                                //color: ktextColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Builder(builder: (context) {
                            return ElevatedButton(
                              onPressed: isButtonAktif
                                  ? () {
                                      setState(() =>
                                          this.isButtonAktif = isButtonAktif);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return PageEditPangan(
                                              id: id,
                                              beras: beras,
                                              noBeras: nonBeras,
                                              peter: peter,
                                              peri: peri,
                                              waru: warung,
                                              lum: lumbung,
                                              toga: toga,
                                              tanaman: tanaman,
                                            );
                                          },
                                        ),
                                      );
                                      print(id);
                                    }
                                  : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 55, 149, 183),
                                minimumSize: Size.fromHeight(50),
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                "EDIT",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 2,
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
