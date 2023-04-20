import 'package:e_pkk/helpers/OkDialog.dart';
import 'package:e_pkk/models/LoginApi.dart';
import 'package:e_pkk/views/Login/login_screen.dart';
import 'package:flutter/material.dart';

class RegistrasiController {
  bool _isChecked = false;
  String? test;
  bool obscure1 = true;
  bool obscure2 = true;

  get isChecked => this._isChecked;

  set isChecked(value) => this._isChecked = value;

  get getObscure1 => this.obscure1;
  get getObscure2 => this.obscure2;

  void toglePass1() {
    obscure1 = !obscure1;
  }

  void toglePass2() {
    obscure2 = !obscure2;
  }

  void btRegister(BuildContext context, String nama_kec, String no_whatsapp,
      String alamat, String password, String konfirm) {
    final OkDialog okDialog;
    if (password != konfirm) {
      okDialog = new OkDialog(context, 'Konfirmasi Kata Sandi',
          'Konfirmasi kata sandi yang anda masukkan tidak sesuai.');
      // } else if (_isChecked == false) {
      //   okDialog = new OkDialog(context, 'Centang Persetujuan',
      //       'Klik jika anda menyetujui peraturan pada aplikasi ini.');
      // } else {
      LoginApi.registrasiPost(nama_kec, no_whatsapp, alamat, password)
          .then((value) {
        if (value.kode == 1) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => LoginScreen()));
        } else {
          OkDialog(context, 'Error', 'Gagal mendaftarkan akun.');
          print(value);
        }
      });
    }
  }
}
