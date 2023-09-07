// ignore_for_file: must_be_immutable, body_might_complete_normally_nullable

import 'dart:convert';
import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_pkk/helpers/ApiHelper.dart';
import 'package:e_pkk/models/LoginApi.dart';
import 'package:e_pkk/views/Registrasi/berhasil_regis.dart';
import 'package:http/http.dart' as http;
import 'package:e_pkk/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class otpPageRegis extends StatefulWidget {
  String noHp, kodeOtp;

  otpPageRegis({
    Key? key,
    required this.noHp,
    required this.kodeOtp,
  }) : super(key: key);

  //const otpPageRegis({super.key});

  @override
  State<otpPageRegis> createState() => _otpPageRegisState();
}

class _otpPageRegisState extends State<otpPageRegis> {
  var _formkey = GlobalKey<FormState>();
  late String noHp;
  late String otpRegistrasi;

  TextEditingController kodeotptxt = TextEditingController();

  int randomNumber = 100000;
  String noWa = '';

  void random() {
    setState(() {
      Random random = new Random();
      randomNumber = random.nextInt(900000) + 100000;
    });
  }

  void _kirimUlangOTP() async {
    Uri url = Uri.parse(ApiHelper.url + 'otpWa.php');

    var data = {
      "kodeOtp": randomNumber.toString(),
      "noHp": noHp.toString(),
    };

    print(randomNumber);

    var response = await http.post(url, body: data);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      print('Respon dari server: $responseData');
    } else {
      print('gagal mengirim data. Kode status: ${response.statusCode}');
    }
  }

  void verifyCode() async {
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
    
    if (otpRegistrasi.toString() == kodeotptxt.text) {
      print("kode berhasil");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return BerhasilRegis();
          },
        ),
      );
    } else if (randomNumber.toString() == kodeotptxt.text) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return BerhasilRegis();
          },
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Kode verifikasi tidak sesuai!",
            textAlign: TextAlign.center,
          ),
        ),
      );
      Navigator.pop(context);
    }
  }

  void updateOtp(
    BuildContext context,
    String no_whatsapp,
    String kode_otp,
  ) {
    LoginApi.kirimUlangOtp(no_whatsapp, kode_otp).then((value) async {
      if (value.kode == 1) {
        print("Berhasil Masuk Database");
      } else {
        print(value);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    otpRegistrasi = widget.kodeOtp;
    noHp = widget.noHp;
    random();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 1,
        centerTitle: true,
        title: Text(
          "Verifikasi Daftar Akun",
          style: TextStyle(
            color: grey900,
          ),
        ),
        leading: BackButton(
          color: grey800,
        ),
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Lottie.asset(
                  "assets/lottie/otp.json",
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Align(
                  alignment: FractionalOffset.topCenter,
                  child: Text(
                    "Verifikasi Kode",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 10,
                ),
                child: Align(
                  alignment: FractionalOffset.topCenter,
                  child: Text(
                    "Periksa nomor whatsapp Anda untuk memverifikasi kode otp",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: FractionalOffset.center,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 16,
                    left: 10,
                    right: 10,
                    bottom: 10,
                  ),
                  child: PinCodeTextField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Harap isi';
                      }
                    },
                    controller: kodeotptxt,
                    appContext: context,
                    length: 6, // panjang kode OTP
                    onChanged: (value) {
                      // aksi yang dijalankan setiap kali kode OTP berubah
                    },
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(8),
                        fieldHeight: 56,
                        fieldWidth: 56,
                        activeFillColor: Colors.white,
                        inactiveFillColor: Colors.grey.shade100,
                        activeColor: Colors.grey.shade300,
                        inactiveColor: Colors.grey.shade300,
                        selectedColor: Colors.blue.shade500,
                        selectedFillColor: Colors.white,
                        borderWidth: 1.5),
                    animationDuration: Duration(milliseconds: 300),
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    // backgroundColor: Colors.grey.shade100,
                    enableActiveFill: true,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Belum menerima kode ? "),
                  GestureDetector(
                    onTap: () {
                      setState(() {});
                      _kirimUlangOTP();
                      updateOtp(
                        context,
                        noHp,
                        randomNumber.toString(),
                      );
                    },
                    child: Text(
                      " Kirim ulang",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: 50,
                  child: AnimatedButton(
                    text: "KONFIRMASI",
                    color: ktextColor,
                    borderRadius: BorderRadius.circular(8),
                    buttonTextStyle: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: whiteColor,
                    ),
                    pressEvent: () {
                      if (_formkey.currentState!.validate()) {
                        verifyCode();
                      }
                    },
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
