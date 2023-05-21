class DataAkun {
  int? kode;
  String? pesan;
  Data? data;

  DataAkun({this.kode, this.pesan, this.data});

  DataAkun.fromJson(Map<String, dynamic> json) {
    kode = json['kode'];
    pesan = json['pesan'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kode'] = this.kode;
    data['pesan'] = this.pesan;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? namaPengguna;
  String? namaKec;
  String? noWhatsapp;
  String? alamat;
  String? password;

  Data(
      {this.id,
      this.namaPengguna,
      this.namaKec,
      this.noWhatsapp,
      this.alamat,
      this.password});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id_user'];
    namaPengguna = json['nama_pengguna'];
    namaKec = json['nama_kec'];
    noWhatsapp = json['no_whatsapp'];
    alamat = json['alamat'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_user'] = this.id;
    data['nama_pengguna'] = this.namaPengguna;
    data['nama_kec'] = this.namaKec;
    data['no_whatsapp'] = this.noWhatsapp;
    data['alamat'] = this.alamat;
    data['password'] = this.password;
    return data;
  }
}
