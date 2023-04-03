import 'package:e_pkk/Screens/Login/login_screen.dart';
import 'package:e_pkk/Screens/Registrasi/registrasi_screen.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:flutter/material.dart';
import 'background.dart';

class Body extends StatelessWidget {
  // const Body({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 100, bottom: 10),
            child: Text(
              "SELAMAT  DATANG",
              style: TextStyle(
                color: ktextColor,
                fontSize: 30.0,
                fontWeight: bold,
              ),
            ),
          ),
          Positioned(
            child: Image.asset(
              "assets/images/pkk.png",
              width: size.width * 0.80,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Text(
              "PKK",
              style: TextStyle(
                color: ktextColor,
                fontSize: 29.0,
                fontWeight: bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
            child: Text(
              "PEMBERDAYAAN KESEJAHTERAAN KELUARGA",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ktextColor,
                fontSize: 20.0,
              ),
            ),
          ),
          Container(
            width: size.width * 0.8,
            height: 47,
            // padding: EdgeInsets.only(top: 10.0),
            margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ktextColor,
                ),
                // Logic ngelink ke button lainnya.
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 18.0,
                    fontWeight: bold,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: size.width * 0.8,
            height: 47,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: color2,
                  side: BorderSide(color: color3),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return RegistrasiScreen();
                      },
                    ),
                  );
                },
                child: Text(
                  "DAFTAR",
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 18.0,
                    fontWeight: bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
