// ignore_for_file: body_might_complete_normally_nullable

import 'dart:convert';
import 'dart:math';
import 'package:e_pkk/helpers/ApiHelper.dart';
import 'package:e_pkk/models/LoginApi.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:e_pkk/views/LupaPassword/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;

class lupaPassword extends StatefulWidget {
  const lupaPassword({super.key});

  @override
  State<lupaPassword> createState() => _lupaPasswordState();
}

class _lupaPasswordState extends State<lupaPassword> {
  var _formkey = GlobalKey<FormState>();

  TextEditingController tWane = TextEditingController();

  @override
  void initState() {
    random();
    super.initState();
  }

  int randomNumber = 100000;
  String noWa = '';

  void random() {
    setState(() {
      Random random = new Random();
      randomNumber = random.nextInt(900000) + 100000;
    });
  }

  void _kirimOTP() async {
    Uri url = Uri.parse(ApiHelper.url + 'otpWa.php');

    var data = {
      "kodeOtp": randomNumber.toString(),
      "noHp": tWane.text,
    };

    var response = await http.post(url, body: data);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      print('Respon dari server: $responseData');
    } else {
      print('gagal mengirim data. Kode status: ${response.statusCode}');
    }
  }

  // late String kodeOtpLuar;

  void updateOtp(
    BuildContext context,
    String no_whatsapp,
    String kode_otp,
  ) {
    LoginApi.kirimUlangOtp(no_whatsapp, kode_otp).then((value) async {
      if (value.kode == 1) {
        //kodeOtpLuar = kode_otp;
        print("Berhasil Masuk Database");
      } else {
        print(value);
      }
    });
  }

  void btKirim(BuildContext context, String no_whatsapp) {
    LoginApi.getPengguna(no_whatsapp).then((value) async {
      showDialog(
        context: context,
        barrierDismissible: false, // Tidak bisa ditutup selama menunggu
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(
              color: ktextColor,
              backgroundColor: Colors.grey.shade400,
              semanticsLabel: 'Loading',
            ),
          );
        },
      );

      await Future.delayed(Duration(seconds: 2));

      if (value.kode == 1) {
        print("Nomor Terdaftar");
        _kirimOTP();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Nomor Terdaftar",
              textAlign: TextAlign.center,
            ),
          ),
        );
        updateOtp(
          context,
          tWane.text,
          randomNumber.toString(),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return otpPage(
                kodeOtp: randomNumber.toString(),
                noHp: tWane.text,
              );
            },
          ),
        );
      } else {
        print("Nomor tidak terdaftar");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Nomor tidak terdaftar. Silahkan cek kembali !",
              textAlign: TextAlign.center,
            ),
          ),
        );
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Lupa Password"),
        centerTitle: true,
        backgroundColor: ktextColor,
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Lottie.asset("assets/lottie/security.json"),
              Align(
                alignment: FractionalOffset.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    "Masukkan nomor Whatsapp pendaftaran",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: grey800,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 15,
                  bottom: 20,
                  left: 10,
                  right: 10,
                ),
                child: Text(
                  "Masukkan nomor whatsapp Anda untuk melakukan verifikasi lupa password.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: grey700,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                width: size.width * 0.9,
                decoration: BoxDecoration(
                  color: grey100,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: grey300,
                    width: 1.2,
                  ),
                ),
                child: TextFormField(
                  controller: tWane,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan nomor WhatsApp Anda';
                    } else if (value.length < 12) {
                      return 'minimal 12 digit nomor';
                    }
                  },
                  maxLength: 13,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    counterText: "",
                    hintText: "0821xxx",
                    hintStyle: TextStyle(
                      color: grey400,
                      fontSize: 15,
                    ),
                    icon: Icon(
                      Icons.tablet_android,
                      //color: ktextColor,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 5),
                child: Container(
                  width: size.width * 0.9,
                  height: 47,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ktextColor,
                        elevation: 20,
                      ),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          btKirim(
                            context,
                            tWane.text,
                          );
                        }
                      },
                      child: Text(
                        "KIRIM",
                        style: TextStyle(
                          color: whiteColor,
                          fontSize: 18.0,
                          fontWeight: bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
