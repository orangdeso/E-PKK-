import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:e_pkk/views/Login/login_screen.dart';
import 'package:e_pkk/views/navbar_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccesUploadGallery extends StatefulWidget {
  const SuccesUploadGallery({super.key});

  @override
  State<SuccesUploadGallery> createState() => _SuccesUploadGalleryState();
}

class _SuccesUploadGalleryState extends State<SuccesUploadGallery> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 200,
                child: Lottie.asset(
                  "assets/lottie/success.json",
                  height: 230,
                  width: 350,
                ),
              ),
              SizedBox(
                height: 50,
                child: Text(
                  "Upload Berhasil",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 60,
                  child: Text(
                    "Selamat Anda berhasil mengupload geleri. Silahkan cek riwayat Anda!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.3,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Container(
                  width: size.width * 0.9,
                  height: 47,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: AnimatedButton(
                    text: "Lanjut",
                    color: ktextColor,
                    borderRadius: BorderRadius.circular(8),
                    buttonTextStyle: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: whiteColor,
                    ),
                    pressEvent: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return navbarView();
                          },
                        ),
                      );
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
