import 'dart:convert';
import 'package:e_pkk/helpers/ApiHelper.dart';
import 'package:e_pkk/models/DataAKun.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// class ApiBidang {
//   int? kode;
//   String? pesan;
//   DataBidang? data;

//   ApiBidang({
//     this.kode,
//     this.pesan,
//     this.data,
//   });

//   static Future<ApiBidang> getPengguna(String id) async {
//     Uri url = Uri.parse(ApiHelper.url + 'getBidang.php');
//     var response = await http.post(url, body: {
//       'id_detail_pokja': id,
//     });

//     var body = json.decode(response.body);
//     return ApiBidang(
//       kode: body['kode'],
//       pesan: body['pesan'],
//       data: body['data'],
//     );
//   }
// }

// class DataBidang {
//   String? id_detail_pokja;
//   String? bidang;
//   String? bidang1;
//   String? bidang2;
//   String? bidang3;

//   DataBidang({
//     this.id_detail_pokja,
//     this.bidang,
//     this.bidang1,
//     this.bidang2,
//     this.bidang3,
//   });
// }

class ApiBidang {
  int? kode;
  String? message;
  List<Data>? data;

  ApiBidang({this.kode, this.message, this.data});

  ApiBidang.fromJson(Map<String, dynamic> json) {
    kode = json['kode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

  static Future<ApiBidang> tampilLaporan(BuildContext context) async {
    try {
      Uri url = Uri.parse(ApiHelper.url + 'getPengumuman.php');
      var response = await http.get(url);
      var body = json.decode(response.body);
      return ApiBidang.fromJson(body);
    } catch (e) {
      throw Exception('$e');
    }
  }

  static Future<ApiBidang> getBidang(String id) async {
    try {
      Uri url = Uri.parse(ApiHelper.url + 'getBidang.php');
      var response = await http.post(url, body: {
        'id_detail_pokja1': id,
      });
      var body = json.decode(response.body);
      return ApiBidang.fromJson(body);
    } catch (e) {
      throw Exception('$e');
    }
  }
}

class DataBidang {
  String? idPokja1Bidang1;
  String? bidang;
  String? bidang1;
  String? bidang2;
  String? bidang3;

  DataBidang(
      {this.idPokja1Bidang1,
      this.bidang,
      this.bidang1,
      this.bidang2,
      this.bidang3});

  DataBidang.fromJson(Map<String, dynamic> json) {
    idPokja1Bidang1 = json['id_pokja1_bidang1'];
    bidang = json['bidang'];
    bidang1 = json['bidang1'];
    bidang2 = json['bidang2'];
    bidang3 = json['bidang3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_pokja1_bidang1'] = this.idPokja1Bidang1;
    data['bidang'] = this.bidang;
    data['bidang1'] = this.bidang1;
    data['bidang2'] = this.bidang2;
    data['bidang3'] = this.bidang3;
    return data;
  }
}
