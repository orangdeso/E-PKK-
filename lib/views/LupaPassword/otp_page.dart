import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:e_pkk/views/LupaPassword/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class otpPage extends StatefulWidget {
  String noHp, kodeOtp;

  // Passing Data
  otpPage({Key? key, required this.noHp, required this.kodeOtp})
      : super(key: key);

  @override
  State<otpPage> createState() => _otpPageState();
}

class _otpPageState extends State<otpPage> {
  var _formkey = GlobalKey<FormState>();
  TextEditingController kodeotptxt = TextEditingController();
  late String otpRegister;
  late String noHp;

  @override
  void initState() {
    super.initState();
    otpRegister = widget.kodeOtp;
    noHp = widget.noHp;
    random();
  }

  void verifyCode() {
    if (otpRegister.toString() == kodeotptxt.text) {
      //whenVerified();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return ResetPassword(noHp: noHp);
          },
        ),
      );
    } else if (randomNumber.toString() == kodeotptxt.text) {
      print("kondisi ke dua jalan");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
          "Kode verifikasi tidak sesuai!",
          textAlign: TextAlign.center,
        )),
      );
    }
  }

  int randomNumber = 100000;
  String noWa = '';

  void random() {
    setState(() {
      Random random = new Random();
      randomNumber = random.nextInt(900000) + 100000;
    });
  }

  void _kirimUlangOTP() async {
    var url = Uri.parse('http://172.16.110.130/vscode/api_rest_pkk/OtpWa.php');

    var data = {
      "kodeOtp": randomNumber.toString(),
      "noHp": noHp.toString(),
    };

    var response = await http.post(url, body: data);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      print('Respon dari server: $responseData');
    } else {
      print('gagal mengirim data. Kode status: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 4,
        title: Text(
          "Verifikasi Lupa Password",
          style: TextStyle(color: grey900),
        ),
        leading: BackButton(
          color: grey800,
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                  right: 20,
                  left: 20,
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
              // Padding(
              //   padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       SizedBox(
              //         height: 68,
              //         width: 55,
              //         child: TextFormField(
              //           controller: tPin1,
              //           onSaved: (pin1) {},
              //           onChanged: (value) {
              //             if (value.length == 1) {
              //               FocusScope.of(context).nextFocus();
              //             }
              //           },
              //           validator: (value) {
              //             if (value == null || value.isEmpty) {
              //               return '';
              //             }
              //           },
              //           decoration: const InputDecoration(
              //             hintText: "0",
              //             hintStyle: TextStyle(
              //               color: Colors.grey,
              //             ),
              //           ),
              //           style: Theme.of(context).textTheme.headline6,
              //           keyboardType: TextInputType.number,
              //           textAlign: TextAlign.center,
              //           inputFormatters: [
              //             LengthLimitingTextInputFormatter(1),
              //             FilteringTextInputFormatter.digitsOnly,
              //           ],
              //         ),
              //       ),
              //       SizedBox(
              //         height: 68,
              //         width: 55,
              //         child: TextFormField(
              //           controller: tPin2,
              //           onSaved: (pin2) {},
              //           onChanged: (value) {
              //             if (value.length == 1) {
              //               FocusScope.of(context).nextFocus();
              //             }
              //           },
              //           validator: (value) {
              //             if (value == null || value.isEmpty) {
              //               return '';
              //             }
              //           },
              //           decoration: const InputDecoration(
              //             hintText: "0",
              //             hintStyle: TextStyle(
              //               color: Colors.grey,
              //             ),
              //           ),
              //           style: Theme.of(context).textTheme.headline6,
              //           keyboardType: TextInputType.number,
              //           textAlign: TextAlign.center,
              //           inputFormatters: [
              //             LengthLimitingTextInputFormatter(1),
              //             FilteringTextInputFormatter.digitsOnly,
              //           ],
              //         ),
              //       ),
              //       SizedBox(
              //         height: 68,
              //         width: 55,
              //         child: TextFormField(
              //           controller: tPin3,
              //           onSaved: (pin3) {},
              //           onChanged: (value) {
              //             if (value.length == 1) {
              //               FocusScope.of(context).nextFocus();
              //             }
              //           },
              //           validator: (value) {
              //             if (value == null || value.isEmpty) {
              //               return '';
              //             }
              //           },
              //           decoration: const InputDecoration(
              //             hintText: "0",
              //             hintStyle: TextStyle(
              //               color: Colors.grey,
              //             ),
              //           ),
              //           style: Theme.of(context).textTheme.headline6,
              //           keyboardType: TextInputType.number,
              //           textAlign: TextAlign.center,
              //           inputFormatters: [
              //             LengthLimitingTextInputFormatter(1),
              //             FilteringTextInputFormatter.digitsOnly,
              //           ],
              //         ),
              //       ),
              //       SizedBox(
              //         height: 68,
              //         width: 55,
              //         child: TextFormField(
              //           controller: tPin4,
              //           onSaved: (pin4) {},
              //           onChanged: (value) {
              //             if (value.length == 1) {
              //               FocusScope.of(context).nextFocus();
              //             }
              //           },
              //           validator: (value) {
              //             if (value == null || value.isEmpty) {
              //               return '';
              //             }
              //           },
              //           decoration: const InputDecoration(
              //             hintText: "0",
              //             hintStyle: TextStyle(
              //               color: Colors.grey,
              //             ),
              //           ),
              //           style: Theme.of(context).textTheme.headline6,
              //           keyboardType: TextInputType.number,
              //           textAlign: TextAlign.center,
              //           inputFormatters: [
              //             LengthLimitingTextInputFormatter(1),
              //             FilteringTextInputFormatter.digitsOnly,
              //           ],
              //         ),
              //       ),
              //       SizedBox(
              //         height: 68,
              //         width: 55,
              //         child: TextFormField(
              //           controller: tPin5,
              //           onSaved: (pin5) {},
              //           onChanged: (value) {
              //             if (value.length == 1) {
              //               FocusScope.of(context).nextFocus();
              //             }
              //           },
              //           validator: (value) {
              //             if (value == null || value.isEmpty) {
              //               return '';
              //             }
              //           },
              //           decoration: const InputDecoration(
              //             hintText: "0",
              //             hintStyle: TextStyle(
              //               color: Colors.grey,
              //             ),
              //           ),
              //           style: Theme.of(context).textTheme.headline6,
              //           keyboardType: TextInputType.number,
              //           textAlign: TextAlign.center,
              //           inputFormatters: [
              //             LengthLimitingTextInputFormatter(1),
              //             FilteringTextInputFormatter.digitsOnly,
              //           ],
              //         ),
              //       ),
              //       SizedBox(
              //         height: 68,
              //         width: 55,
              //         child: TextFormField(
              //           controller: tPin6,
              //           onSaved: (pin6) {},
              //           onChanged: (value) {
              //             if (value.length == 1) {
              //               FocusScope.of(context).nextFocus();
              //             }
              //           },
              //           validator: (value) {
              //             if (value == null || value.isEmpty) {
              //               return '';
              //             }
              //           },
              //           decoration: const InputDecoration(
              //             hintText: "0",
              //             hintStyle: TextStyle(
              //               color: Colors.grey,
              //             ),
              //           ),
              //           style: Theme.of(context).textTheme.headline6,
              //           keyboardType: TextInputType.number,
              //           textAlign: TextAlign.center,
              //           inputFormatters: [
              //             LengthLimitingTextInputFormatter(1),
              //             FilteringTextInputFormatter.digitsOnly,
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Belum menerima kode ? "),
                  GestureDetector(
                    onTap: () {
                      _kirimUlangOTP();
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
