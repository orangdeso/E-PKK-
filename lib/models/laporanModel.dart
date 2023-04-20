import 'dart:convert';
import 'package:e_pkk/helpers/ApiHelper.dart';
import 'package:http/http.dart' as http;

class laporanModel {
  int? kode;
  String? pesan;
  List<LaporanData>? data;

  laporanModel({
    this.kode,
    this.pesan,
    this.data,
  });
}

Future<laporanModel> getRiwayat(String id_laporan) async {
  Uri url = Uri.parse(ApiHelper.url + 'getRiwayat.php');
  var response = await http.get(url);
  var data = (json.decode(response.body))["data"];

  print(data);

  return laporanModel(
    kode: data['kode'],
    pesan: data['pesan'],
    data: data['data'],
  );
}

class LaporanData {
  String? id_laporan;
  String? title_laporan;
  String? tanggal;
  String? deskripsi;
  String? image;
  String? status;
  String? id_kategori;
  String? id_user;

  LaporanData({
    this.id_laporan,
    this.title_laporan,
    this.tanggal,
    this.deskripsi,
    this.image,
    this.status,
    this.id_kategori,
    this.id_user,
  });
}
