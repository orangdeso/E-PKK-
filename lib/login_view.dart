import 'package:e_pkk/utils/constants.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget> [
            Center(
              child: Column(
                children: <Widget> [
                  _gambarLogin(),
                  _titleDescription(),
                  _textField(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _gambarLogin() {
  return Image.asset(
    "assets/images/login1.png",
    height: 150.0,
    width: 150.0,
  );
}

Widget _titleDescription() {
  return Column(
    children: <Widget>[
      Padding(padding: EdgeInsets.only(top: 16.0)),
      Text(
        "Selamat Datang Di E-PKK",
        style: TextStyle(
          color: ktextColor,
          fontSize: 32.0,
          fontWeight: bold
        ),
        textAlign: TextAlign.left,
      ),
    ],
  );
}

Widget _textField() {
  return Column(
    children: <Widget>[
      Column(
        children: [
          Text(
            "Nomor WhatsApp", 
            style: TextStyle(
              color: textColor2,
              fontSize: 15.0,
              fontWeight: bold
            ),
          )
        ],
      ),
    ],
  );
}
