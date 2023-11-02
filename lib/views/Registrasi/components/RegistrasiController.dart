// ignore_for_file: unused_import

import 'package:awesome_dialog/awesome_dialog.dart';
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

  // void btRegister(
  //     BuildContext context,
  //     String nama_pengguna,
  //     String nama_kec,
  //     String no_whatsapp,
  //     String alamat,
  //     String password,
  //     String kode_otp,
  //     String status,
  //     String konfirm) {
  //   if (password != konfirm) {
  //     _alertGagalRegis(context);
  //   } else {
  //     LoginApi.registrasiPost(nama_pengguna, nama_kec, no_whatsapp, alamat,
  //             password, kode_otp, status)
  //         .then((value) {
  //       if (value.kode == 1) {
  //         kirimNotifikasi();
  //         _AlertBerhasilRegis(context);
  //       } else {
  //         new OkDialog(context, 'Error', 'Gagal mendaftarkan akun.');
  //         print(value);
  //       }
  //     });
  //   }
  // }

  // _alertGagalRegis(context) {
  //   AwesomeDialog(
  //     context: context,
  //     dialogType: DialogType.error,
  //     animType: AnimType.topSlide,
  //     showCloseIcon: true,
  //     title: "Gagal",
  //     desc: "Konfirmasi password yang Anda masukkan tidak sesuai",
  //     btnOkOnPress: () {},
  //   ).show();
  // }

  // _AlertBerhasilRegis(context) {
  //   AwesomeDialog(
  //     context: context,
  //     dialogType: DialogType.success,
  //     animType: AnimType.topSlide,
  //     showCloseIcon: true,
  //     title: "Berhasil Daftar Akun",
  //     desc: "Silahkan login dengan nomor whatsaap yang sudah didaftarkan",
  //     //btnCancelOnPress: () {},
  //     btnOkOnPress: () {
  //       Navigator.of(context)
  //           .push(MaterialPageRoute(builder: (context) => LoginScreen()));
  //     },
  //   ).show();
  // }
}
