import 'dart:convert';

Riwayat riwayatDataFromJson(String str) => Riwayat.fromJson(json.decode(str));

class Riwayat {
  int? kode;
  String? message;
  List<Data>? data;

  Riwayat({this.kode, this.message, this.data});

  Riwayat.fromJson(Map<String, dynamic> json) {
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
}

class Data {
  String? idLaporan;
  String? titleLaporan;
  String? tanggal;
  String? deskripsi;
  String? image;
  String? status;
  String? idKategori;
  String? idUser;

  Data(
      {this.idLaporan,
      this.titleLaporan,
      this.tanggal,
      this.deskripsi,
      this.image,
      this.status,
      this.idKategori,
      this.idUser});

  Data.fromJson(Map<String, dynamic> json) {
    idLaporan = json['id_laporan'];
    titleLaporan = json['title_laporan'];
    tanggal = json['tanggal'];
    deskripsi = json['deskripsi'];
    image = json['image'];
    status = json['status'];
    idKategori = json['id_kategori'];
    idUser = json['id_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_laporan'] = this.idLaporan;
    data['title_laporan'] = this.titleLaporan;
    data['tanggal'] = this.tanggal;
    data['deskripsi'] = this.deskripsi;
    data['image'] = this.image;
    data['status'] = this.status;
    data['id_kategori'] = this.idKategori;
    data['id_user'] = this.idUser;
    return data;
  }
}
