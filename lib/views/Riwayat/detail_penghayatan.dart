import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:e_pkk/views/Laporan/Upload_Laporan/notifikasi_kesehatan.dart';
import 'package:e_pkk/views/Riwayat/riwayat_page.dart';
import 'package:flutter/material.dart';

class PageDetailPenghayatan extends StatefulWidget {
  const PageDetailPenghayatan({super.key});

  @override
  State<PageDetailPenghayatan> createState() => _PageDetailPenghayatanState();
}

class _PageDetailPenghayatanState extends State<PageDetailPenghayatan> {
  bool isButtonAktif = true;

  Color WarnaButton({String? stts}) {
    if (stts == "Proses") {
      return Colors.orange.shade400;
    } else {
      setState(() => isButtonAktif = false);
      return Colors.green.shade500;
    }
  }

  Map? getData;
  @override
  Widget build(BuildContext context) {
    getData = ModalRoute.of(context)?.settings.arguments as Map;
    String id = getData?['id_pokja1_bidang1'];
    String kel1 = getData?['jumlah_kel_simulasi1'];
    String anggota1 = getData?['jumlah_anggota1'];
    String kel2 = getData?['jumlah_kel_simulasi2'];
    String anggota2 = getData?['jumlah_anggota2'];
    String kel3 = getData?['jumlah_kel_simulasi3'];
    String anggota3 = getData?['jumlah_anggota3'];
    String kel4 = getData?['jumlah_kel_simulasi4'];
    String anggota4 = getData?['jumlah_anggota4'];
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
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RiwayatPage()));
          },
          icon: Icon(Icons.arrow_back),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        elevation: 1,
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
                          horizontal: 25,
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
                      "Sosialisasi Pendidikan PKBN ",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Jumlah Kel Simulasi",
                            style: TextStyle(
                              color: Colors.grey.shade500,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              "${kel1}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              "Jumlah Anggota",
                              style: TextStyle(
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              "${anggota1}",
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
                        ],
                      ),
                    ),
                    Text(
                      "PKDRT ",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Jumlah Kel Simulasi",
                            style: TextStyle(
                              color: Colors.grey.shade500,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              "${kel2}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              "Jumlah Anggota",
                              style: TextStyle(
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              "${anggota2}",
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
                        ],
                      ),
                    ),
                    Text(
                      "Pola Asuh ",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Jumlah Kel Simulasi",
                            style: TextStyle(
                              color: Colors.grey.shade500,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              "${kel3}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              "Jumlah Anggota",
                              style: TextStyle(
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              "${anggota3}",
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
                        ],
                      ),
                    ),
                    Text(
                      "Lansia",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Jumlah Kel Simulasi",
                            style: TextStyle(
                              color: Colors.grey.shade500,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              "${kel4}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              "Jumlah Anggota",
                              style: TextStyle(
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              "${anggota4}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
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
                                  "Button Edit aktif jika status laporan masih dalam tahap proses.",
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
                                  "Button Edit tidak aktif jika status laporan sudah dalam tahap selesai.",
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
                          child: OutlinedButton(
                            onPressed: () {
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
                                                  EdgeInsets.only(bottom: 15),
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 20),
                                              child: OutlinedButton(
                                                onPressed: () async {
                                                  Navigator.of(context).pop();
                                                },
                                                style: OutlinedButton.styleFrom(
                                                  minimumSize:
                                                      Size.fromHeight(50),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
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
                                                    fontWeight: FontWeight.w600,
                                                    letterSpacing: 2,
                                                    color: ktextColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 15),
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 20),
                                              child: ElevatedButton(
                                                onPressed: () async {
                                                  CherryToast.info(
                                                    title: Text(
                                                      "Fitur masih tahap pengembangan",
                                                    ),
                                                  ).show(context);
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Color.fromARGB(
                                                          255, 55, 149, 183),
                                                  minimumSize:
                                                      Size.fromHeight(50),
                                                  elevation: 5,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                ),
                                                child: Text(
                                                  "IYA",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    letterSpacing: 2,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      // Padding(
                                      //   padding:
                                      //       const EdgeInsets.only(right: 15),
                                      //   child: InkWell(
                                      //     onTap: () {
                                      //       Navigator.of(context).pop();
                                      //     },
                                      //     child: Text(
                                      //       "Tidak",
                                      //       style: TextStyle(fontSize: 15),
                                      //     ),
                                      //   ),
                                      // ),
                                      // AnimatedButton(
                                      //   pressEvent: () {
                                      //     // Navigator.of(context).push(MaterialPageRoute(
                                      //     //     builder: (context) => LoginScreen()));
                                      //   },
                                      //   text: "Ya",
                                      //   width: 70,
                                      //   color: ktextColor,
                                      //   borderRadius: BorderRadius.circular(10),
                                      //   buttonTextStyle: TextStyle(
                                      //     fontSize: 15,
                                      //   ),
                                      // ),
                                    ],
                                  );
                                },
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              minimumSize: Size.fromHeight(50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              side: BorderSide(
                                width: 2,
                                color: ktextColor,
                              ),
                            ),
                            child: Text(
                              "BATAL",
                              style: TextStyle(
                                fontSize: 18,
                                letterSpacing: 2,
                                fontWeight: FontWeight.w600,
                                color: ktextColor,
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
                                    setState(() =>
                                        this.isButtonAktif = isButtonAktif);
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) {
                                    //       return SuccesUploadKesehatan();
                                    //     },
                                    //   ),
                                    // );
                                    CherryToast.info(
                                      title: Text(
                                        "Fitur masih tahap pengembangan",
                                      ),
                                    ).show(context);
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
