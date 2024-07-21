import 'package:e_pkk/models/ApiCancelLaporan.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:e_pkk/views/Riwayat/EditLaporan/edit_gotong.dart';
import 'package:flutter/material.dart';

class PageDetailGotongRoyong extends StatefulWidget {
  const PageDetailGotongRoyong({super.key});

  @override
  State<PageDetailGotongRoyong> createState() => _PageDetailGotongRoyongState();
}

class _PageDetailGotongRoyongState extends State<PageDetailGotongRoyong> {
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
    String id = getData?['id_pokja1_bidang2'];
    String kerja = getData?['kerja_bakti'];
    String rukun = getData?['rukun_kematian'];
    String keagamaan = getData?['keagamaan'];
    String jimpitan = getData?['jimpitan'];
    String arisan = getData?['arisan'];
    String note = getData?['catatan'];
    String status = getData?['status'];
    String tanggal = getData?['tanggal'];
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
        child: isLoading
            ? CircularProgressIndicator(
                color: ktextColor,
                backgroundColor: Colors.grey.shade400,
                semanticsLabel: 'Loading',
              )
            : Padding(
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
                          Row(
                            children: [
                              Container(
                                width: 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Kerja Bakti",
                                      style: TextStyle(
                                        color: Colors.grey.shade500,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Text(
                                        "${kerja}",
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
                                    "Rukun Kematian",
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text(
                                      "${rukun}",
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
                                width: 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Keagamaan",
                                      style: TextStyle(
                                        color: Colors.grey.shade500,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Text(
                                        "${keagamaan}",
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
                                    "jimpitan",
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text(
                                      "${jimpitan}",
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
                          Text(
                            "Arisan",
                            style: TextStyle(
                              color: Colors.grey.shade500,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              "${arisan}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
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
                              textAlign: TextAlign.justify,
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
                                      padding:
                                          EdgeInsets.only(top: 10, left: 10),
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
                                      padding:
                                          EdgeInsets.only(top: 5, left: 10),
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
                                      padding:
                                          EdgeInsets.only(top: 5, left: 10),
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
                                          setState(() =>
                                              this.isButtonBatalAktif =
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
                                                          padding:
                                                              EdgeInsets.only(
                                                                  bottom: 15),
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      20),
                                                          child: OutlinedButton(
                                                            onPressed:
                                                                () async {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            style:
                                                                OutlinedButton
                                                                    .styleFrom(
                                                              minimumSize: Size
                                                                  .fromHeight(
                                                                      50),
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              side: BorderSide(
                                                                width: 2,
                                                                color:
                                                                    ktextColor,
                                                              ),
                                                            ),
                                                            child: Text(
                                                              "TIDAK",
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                letterSpacing:
                                                                    2,
                                                                color:
                                                                    ktextColor,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  bottom: 15),
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      20),
                                                          child: ElevatedButton(
                                                            onPressed:
                                                                () async {
                                                              showDialog(
                                                                context:
                                                                    context,
                                                                barrierDismissible:
                                                                    false, // Tidak bisa ditutup selama menunggu
                                                                builder:
                                                                    (BuildContext
                                                                        context) {
                                                                  return Center(
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      color:
                                                                          ktextColor,
                                                                      backgroundColor: Colors
                                                                          .grey
                                                                          .shade400,
                                                                      semanticsLabel:
                                                                          'Loading',
                                                                    ),
                                                                  );
                                                                },
                                                              );

                                                              await Future.delayed(
                                                                  Duration(
                                                                      seconds:
                                                                          3));

                                                              EditBatalkanLaporan
                                                                  .cancelLaporanGotong(
                                                                context:
                                                                    context,
                                                                userID: id,
                                                              ).then(
                                                                (value) => {},
                                                              );
                                                              // CherryToast.info(
                                                              //   title: Text(
                                                              //     "Fitur masih tahap pengembangan",
                                                              //   ),
                                                              // ).show(context);
                                                            },
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              backgroundColor:
                                                                  Color
                                                                      .fromARGB(
                                                                          255,
                                                                          55,
                                                                          149,
                                                                          183),
                                                              minimumSize: Size
                                                                  .fromHeight(
                                                                      50),
                                                              elevation: 5,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                            ),
                                                            child: Text(
                                                              "IYA",
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                letterSpacing:
                                                                    2,
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
                                      borderRadius: BorderRadius.circular(8),
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
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: isButtonAktif
                                      ? () {
                                          setState(() => this.isButtonAktif =
                                              isButtonAktif);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return PageEditGotong(
                                                  id: id,
                                                  kerja: kerja,
                                                  rukun: rukun,
                                                  keagamaan: keagamaan,
                                                  jim: jimpitan,
                                                  arisan: arisan,
                                                );
                                              },
                                            ),
                                          );
                                        }
                                      : null,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(255, 55, 149, 183),
                                    minimumSize: Size.fromHeight(50),
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
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
                                ),
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
