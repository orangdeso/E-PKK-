import 'package:e_pkk/models/LoginApi.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:e_pkk/views/navbar_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginController {
  bool _obscure = true;
  get getObscure => this._obscure;

  set setObscure(value) => this._obscure = value;

  void toglePass() {
    _obscure = !_obscure;
  }

  void btLogin(BuildContext context, String no_whatsapp, String password) {
    LoginApi.postData(no_whatsapp, password).then((value) {
      if (value.kode == 1) {
        show("Berhasil Login");
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => navbarView()));
      } else {
        show("No WhatsApp atau password Anda salah");
        // final myDialog;
        // myDialog = new OkDialog(context, 'Gagal Masuk', value.pesan.toString());
      }
    });
  }

  //Method untuk mengatur pesan toast
  void show(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: whiteColor,
      textColor: textColor2,
    );
  }
}
