import 'package:cherry_toast/cherry_toast.dart';
import 'package:e_pkk/models/ApiEditLaporan.dart';
import 'package:e_pkk/models/DataAKun.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:e_pkk/views/Riwayat/riwayat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageDetailKader1 extends StatefulWidget {
  const PageDetailKader1({super.key});

  @override
  State<PageDetailKader1> createState() => _PageDetailKader1State();
}

class _PageDetailKader1State extends State<PageDetailKader1> {
  final _formKey = GlobalKey<FormState>();
  String idAkun = '';
  late Future<DataAkun> futureAkun;

  // Shared Preferences untuk pemanggilan ID pengguna
  Future<void> getIdAkun() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String idAkunValue = prefs.getString("id_akun") ?? '';
    setState(() {
      idAkun = idAkunValue;
    });
  }

  bool isInputFilled = false;

  TextEditingController tPKBN = TextEditingController();
  TextEditingController tPKDRT = TextEditingController();
  TextEditingController tPola = TextEditingController();

  bool isButtonAktif = true;
  bool isButtonBatalAktif = true;

  Color WarnaButton({String? stts}) {
    if (stts == "Proses") {
      return Colors.orange.shade400;
    } else if (stts == "Dibatalkan") {
      setState(() => isButtonAktif = false);
      setState(() => isButtonBatalAktif = false);
      return Colors.red.shade400;
    } else if (stts == "Direview") {
      setState(() => isButtonBatalAktif = false);
      return Colors.blue.shade400;
    } else {
      setState(() => isButtonAktif = false);
      return Colors.green.shade500;
    }
  }

  @override
  void initState() {
    super.initState();
    getIdAkun();
    setState(() {});
  }

  void _onTextFieldChanged() {
    if (!isInputFilled) {
      setState(() {
        isInputFilled = true;
      });
    }
  }

  Map? getData;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    getData = ModalRoute.of(context)?.settings.arguments as Map;
    String id = getData?['id_kader_pokja1'];
    String pkbn = getData?['PKBN'];
    String pkdrt = getData?['PKDRT'];
    String polaAsuh = getData?['pola_asuh'];
    String note = getData?['catatan'];
    String status = getData?['status'];
    String tanggal = getData?['tanggal'];
    String waktu = getData?['waktu'];

    if (!isInputFilled) {
      tPKBN.text = pkbn;
      tPKDRT.text = pkdrt;
      tPola.text = polaAsuh;
    }

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
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "PKBN",
                              style: TextStyle(
                                color: Colors.grey.shade500,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                "${pkbn}",
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "PKDRT",
                              style: TextStyle(
                                color: Colors.grey.shade500,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                "${pkdrt}",
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Pola Asuh",
                              style: TextStyle(
                                color: Colors.grey.shade500,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                "${polaAsuh}",
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
                                                        CherryToast.info(
                                                          title: Text(
                                                            "Fitur masih tahap pengembangan",
                                                          ),
                                                        ).show(context);
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
                                  }
                                : null,
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
                                    //openDialog();
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          elevation: 5,
                                          title: Center(
                                            child: Text(
                                              "Edit Data",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                          ),
                                          content: Form(
                                            key: _formKey,
                                            child: Container(
                                              padding: EdgeInsets.only(top: 10),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Isi Data Dibawah ini",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16,
                                                        color: grey500,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Divider(
                                                      thickness: 1,
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text(
                                                      "PKBN",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Align(
                                                      alignment:
                                                          FractionalOffset
                                                              .topCenter,
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 20,
                                                                vertical: 2),
                                                        //width: size.width * 0.9,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: grey100,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          border: Border.all(
                                                            color: grey300,
                                                            width: 1.2,
                                                          ),
                                                        ),
                                                        child: TextFormField(
                                                          controller: tPKBN,
                                                          onChanged: (value) {
                                                            _onTextFieldChanged();
                                                          },
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Tidak boleh kosong';
                                                            }
                                                          },
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          inputFormatters: <
                                                              TextInputFormatter>[
                                                            FilteringTextInputFormatter
                                                                .digitsOnly
                                                          ],
                                                          decoration:
                                                              InputDecoration(
                                                            hintText:
                                                                "Masukkan jumlah PKBN",
                                                            hintStyle:
                                                                TextStyle(
                                                              color: grey400,
                                                              fontSize: 14,
                                                            ),
                                                            border: InputBorder
                                                                .none,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text(
                                                      "PKDRT",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Align(
                                                      alignment:
                                                          FractionalOffset
                                                              .topCenter,
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 20,
                                                                vertical: 2),
                                                        //width: size.width * 0.9,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: grey100,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          border: Border.all(
                                                            color: grey300,
                                                            width: 1.2,
                                                          ),
                                                        ),
                                                        child: TextFormField(
                                                          controller: tPKDRT,
                                                          onChanged: (value) {
                                                            _onTextFieldChanged();
                                                          },
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Tidak boleh kosong';
                                                            }
                                                          },
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          inputFormatters: <
                                                              TextInputFormatter>[
                                                            FilteringTextInputFormatter
                                                                .digitsOnly
                                                          ],
                                                          decoration:
                                                              InputDecoration(
                                                            hintText:
                                                                "Masukkan jumlah PKDRT",
                                                            hintStyle:
                                                                TextStyle(
                                                              color: grey400,
                                                              fontSize: 14,
                                                            ),
                                                            border: InputBorder
                                                                .none,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text(
                                                      "Pola Asuh",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Align(
                                                      alignment:
                                                          FractionalOffset
                                                              .topCenter,
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 20,
                                                                vertical: 2),
                                                        //width: size.width * 0.9,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: grey100,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          border: Border.all(
                                                            color: grey300,
                                                            width: 1.2,
                                                          ),
                                                        ),
                                                        child: TextFormField(
                                                          controller: tPola,
                                                          onChanged: (value) {
                                                            _onTextFieldChanged();
                                                          },
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Tidak boleh kosong';
                                                            }
                                                          },
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          inputFormatters: <
                                                              TextInputFormatter>[
                                                            FilteringTextInputFormatter
                                                                .digitsOnly
                                                          ],
                                                          decoration:
                                                              InputDecoration(
                                                            hintText:
                                                                "Masukkan jumlah pola asuh",
                                                            hintStyle:
                                                                TextStyle(
                                                              color: grey400,
                                                              fontSize: 14,
                                                            ),
                                                            border: InputBorder
                                                                .none,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 30,
                                                    ),
                                                    Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 50,
                                                              vertical: 0),
                                                      child: ElevatedButton(
                                                        onPressed: () async {
                                                          print(id);
                                                          if (_formKey
                                                              .currentState!
                                                              .validate()) {
                                                            String pkbn = tPKBN
                                                                .text
                                                                .toString();
                                                            String pkdrt =
                                                                tPKDRT.text
                                                                    .toString();
                                                            String pola = tPola
                                                                .text
                                                                .toString();
                                                            EditApiLaporan
                                                                .editLaporanKader1(
                                                              context: context,
                                                              PKBN: pkbn,
                                                              PKDRT: pkdrt,
                                                              pola_asuh: pola,
                                                              userID: id,
                                                            ).then(
                                                              (value) => {
                                                                print(
                                                                    "Berhasil"),
                                                              },
                                                            );
                                                          }
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              Color.fromARGB(
                                                                  255,
                                                                  55,
                                                                  149,
                                                                  183),
                                                          minimumSize:
                                                              Size.fromHeight(
                                                                  45),
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
                                                          "UPLOAD",
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            letterSpacing: 1,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
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

  Future openDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          elevation: 5,
          title: Center(
            child: Text(
              "Edit Data",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          content: Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.only(top: 10),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Isi Data Dibawah ini",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: grey500,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "PKBN",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: FractionalOffset.topCenter,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                        //width: size.width * 0.9,
                        decoration: BoxDecoration(
                          color: grey100,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: grey300,
                            width: 1.2,
                          ),
                        ),
                        child: TextFormField(
                          //controller: getPKBN,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Tidak boleh kosong';
                            }
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            hintText: "",
                            hintStyle: TextStyle(
                              color: grey400,
                              fontSize: 14,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "PKDRT",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: FractionalOffset.topCenter,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                        //width: size.width * 0.9,
                        decoration: BoxDecoration(
                          color: grey100,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: grey300,
                            width: 1.2,
                          ),
                        ),
                        child: TextFormField(
                          //controller: getPKBN,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Tidak boleh kosong';
                            }
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            hintText: "Masukkan jumlah PKDRT",
                            hintStyle: TextStyle(
                              color: grey400,
                              fontSize: 14,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Pola Asuh",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: FractionalOffset.topCenter,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                        //width: size.width * 0.9,
                        decoration: BoxDecoration(
                          color: grey100,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: grey300,
                            width: 1.2,
                          ),
                        ),
                        child: TextFormField(
                          //controller: getPKBN,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Tidak boleh kosong';
                            }
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            hintText: "Masukkan jumlah pola asuh",
                            hintStyle: TextStyle(
                              color: grey400,
                              fontSize: 14,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 0),
                      child: ElevatedButton(
                        onPressed: () async {
                          print(idAkun);
                          // if (_formKey.currentState!.validate()) {
                          //   String pkbn = getPKBN.text.toString();
                          //   String pkdrt = getPKDRT.text.toString();
                          //   String pola = getPola.text.toString();
                          //   GetApi.LaporanKader1(
                          //     context: context,
                          //     PKBN: pkbn,
                          //     PKDRT: pkdrt,
                          //     pola_asuh: pola,
                          //     userID: idAkun,
                          //   ).then(
                          //     (value) => {
                          //       print("Berhasil"),
                          //     },
                          //   );
                          // }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 55, 149, 183),
                          minimumSize: Size.fromHeight(45),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          "UPLOAD",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}