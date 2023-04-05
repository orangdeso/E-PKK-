import 'package:e_pkk/views/Login/components/background.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class lupaPassword extends StatefulWidget {
  const lupaPassword({super.key});

  @override
  State<lupaPassword> createState() => _lupaPasswordState();
}

class _lupaPasswordState extends State<lupaPassword> {
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
                  validator: (value) {},
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
                      onPressed: () {},
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
