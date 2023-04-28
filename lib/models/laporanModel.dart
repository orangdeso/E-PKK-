import 'dart:convert';
import 'package:e_pkk/helpers/ApiHelper.dart';
import 'package:http/http.dart' as http;

// laporanModel laporanModelFromJson(String str) =>
//     laporanModel.fromJson(json.decode(str));

class laporanModel {
  int? kode;
  String? pesan;
  List<LaporanData>? data;

  laporanModel({
    this.kode,
    this.pesan,
    this.data,
  });

  factory laporanModel.fromJson(Map<String, dynamic> json) {
    if (json["data"]?.isEmpty ?? true) {
      return laporanModel(kode: json["kode"]);
    } else {
      return laporanModel(
        kode: json["kode"],
        pesan: json["pesan"],
        data: List<LaporanData>.from(
          json["data"].map(
            (x) => LaporanData.fromJson(x),
          ),
        ),
      );
    }
  }

  // Future<laporanModel> getRiwayat(String id_laporan) async {
  //   Uri url = Uri.parse(ApiHelper.url + 'getRiwayat.php');
  //   var response = await http.get(url);
  //   var data = (json.decode(response.body))["data"];

  //   print(data);

  //   return laporanModel(
  //     kode: data['kode'],
  //     pesan: data['pesan'],
  //     data: data['data'],
  //   );
  // }
}

class LaporanData {
  int? id_laporan;
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

  factory LaporanData.fromJson(Map<String, dynamic> json) => LaporanData(
        id_laporan: json["id_laporan"],
        title_laporan: json["title_laporan"],
        tanggal: json["tanggal"],
        deskripsi: json["deskripsi"],
        image: json["image"],
        status: json["status"],
        id_kategori: json["id_kategori"],
        id_user: json["id_user"],
      );
}

class Repository {
  Uri url = Uri.parse(ApiHelper.url + 'getRiwayat.php');

  Future getRiwayat() async {
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<laporanModel> LD =
            it.map((e) => laporanModel.fromJson(e)).toList();
        return LD;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
