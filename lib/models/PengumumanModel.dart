import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:e_pkk/helpers/ApiHelper.dart';
import 'package:flutter/material.dart';

PengumumanModel pengumumanModelFromJson(String str) =>
    PengumumanModel.fromJson(json.decode(str));

class PengumumanModel {
  int? kode;
  String? message;
  List<DataVB>? data;

  PengumumanModel({
    this.kode,
    this.message,
    this.data,
  });

  PengumumanModel.fromJson(Map<String, dynamic> json) {
    kode = json['kode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataVB>[];
      json['data'].forEach((v) {
        data!.add(new DataVB.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kode'] = this.kode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  static Future<PengumumanModel> tampilDetail(String id) async {
    try {
      Uri url = Uri.parse(ApiHelper.url + 'detailPengumuman.php');
      var response = await http.post(url, body: {
        'id': id,
      });
      var body = json.decode(response.body);
      return PengumumanModel.fromJson(body);
    } catch (e) {
      throw Exception('$e');
    }
  }

  static Future<PengumumanModel> tampilPengumuman(BuildContext context) async {
    try {
      // final Future<Map<String, String>> myToken = ModelToken.getToken();
      // final storage = new FlutterSecureStorage();
      // String? jsonString = await storage.read(key: 'userdata');
      // UserResponse myObject = UserResponse.fromJson(json.decode(jsonString!));
      // String idPasien = myObject.user_id.toString();
      Uri url = Uri.parse(ApiHelper.url + 'getPengumuman.php');
      var response = await http.get(url);
      var body = json.decode(response.body);
      return PengumumanModel.fromJson(body);
    } catch (e) {
      _alertGagal(context);
      throw Exception('$e');
    }
  }
}

_alertGagal(context) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.error,
    animType: AnimType.topSlide,
    showCloseIcon: true,
    title: "Gagal",
    desc: "Klik tombol ok untuk diarahkan kehalaman beranda",
    btnOkOnPress: () {},
  ).show();
}

class DataVB {
  String? id;
  String? judulPengumuman;
  String? deskripsiPengumuman;
  String? tempatPengumuman;
  String? tanggalPengumuman;
  String? updatedAt;
  String? createdAt;

  DataVB(
      {this.id,
      this.judulPengumuman,
      this.deskripsiPengumuman,
      this.tempatPengumuman,
      this.tanggalPengumuman,
      this.updatedAt,
      this.createdAt});

  DataVB.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    judulPengumuman = json['judulPengumuman'];
    deskripsiPengumuman = json['deskripsiPengumuman'];
    tempatPengumuman = json['tempatPengumuman'];
    tanggalPengumuman = json['tanggalPengumuman'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['judulPengumuman'] = this.judulPengumuman;
    data['deskripsiPengumuman'] = this.deskripsiPengumuman;
    data['tempatPengumuman'] = this.tempatPengumuman;
    data['tanggalPengumuman'] = this.tanggalPengumuman;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    return data;
  }
}
