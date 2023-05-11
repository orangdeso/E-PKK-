import 'package:e_pkk/views/Login/components/background.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:e_pkk/views/LupaPassword/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class lupaPassword extends StatefulWidget {
  const lupaPassword({super.key});

  @override
  State<lupaPassword> createState() => _lupaPasswordState();
}

class _lupaPasswordState extends State<lupaPassword> {
  var _formkey = GlobalKey<FormState>();
  TextEditingController tWane = TextEditingController();

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
              //SizedBox(height: size.height * 0.15),
              Positioned(
                child: Image.asset("assets/images/gambar2.png"),
              ),
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
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return otpPage();
                              },
                            ),
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
