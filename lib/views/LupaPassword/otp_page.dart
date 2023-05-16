import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class otpPage extends StatefulWidget {
  const otpPage({super.key});

  @override
  State<otpPage> createState() => _otpPageState();
}

class _otpPageState extends State<otpPage> {
  var _formkey = GlobalKey<FormState>();

  TextEditingController tPin1 = TextEditingController();
  TextEditingController tPin2 = TextEditingController();
  TextEditingController tPin3 = TextEditingController();
  TextEditingController tPin4 = TextEditingController();
  TextEditingController tPin5 = TextEditingController();
  TextEditingController tPin6 = TextEditingController();

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
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 68,
                      width: 55,
                      child: TextFormField(
                        controller: tPin1,
                        onSaved: (pin1) {},
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          }
                        },
                        decoration: const InputDecoration(
                          hintText: "0",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        style: Theme.of(context).textTheme.headline6,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 68,
                      width: 55,
                      child: TextFormField(
                        controller: tPin2,
                        onSaved: (pin2) {},
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          }
                        },
                        decoration: const InputDecoration(
                          hintText: "0",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        style: Theme.of(context).textTheme.headline6,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 68,
                      width: 55,
                      child: TextFormField(
                        controller: tPin3,
                        onSaved: (pin3) {},
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          }
                        },
                        decoration: const InputDecoration(
                          hintText: "0",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        style: Theme.of(context).textTheme.headline6,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 68,
                      width: 55,
                      child: TextFormField(
                        controller: tPin4,
                        onSaved: (pin4) {},
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          }
                        },
                        decoration: const InputDecoration(
                          hintText: "0",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        style: Theme.of(context).textTheme.headline6,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 68,
                      width: 55,
                      child: TextFormField(
                        controller: tPin5,
                        onSaved: (pin5) {},
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          }
                        },
                        decoration: const InputDecoration(
                          hintText: "0",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        style: Theme.of(context).textTheme.headline6,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 68,
                      width: 55,
                      child: TextFormField(
                        controller: tPin6,
                        onSaved: (pin6) {},
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          }
                        },
                        decoration: const InputDecoration(
                          hintText: "0",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        style: Theme.of(context).textTheme.headline6,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Belum menerima kode ? "),
                  GestureDetector(
                    onTap: () {},
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
                      if (_formkey.currentState!.validate()) {}
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
