import 'dart:convert';
import 'package:e_pkk/helpers/ApiHelper.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  int? kode;
  String? pesan;
  int? id__akun;
  DataPatient? data;

  LoginApi({
    this.kode,
    this.pesan,
    this.id__akun,
    this.data,
  });

  static Future<LoginApi> updateSandi(
    String no_whatsapp,
    String password,
  ) async {
    Uri url = Uri.parse(ApiHelper.url + 'updateSandi.php');
    var response = await http.post(url, body: {
      'no_whatsapp': no_whatsapp,
      'password': password,
    });

    var body = json.decode(response.body);
    return LoginApi(
      kode: body['kode'],
      pesan: body['pesan'],
      data: body['data'],
    );
  }

  static Future<LoginApi> kirimUlangOtp(
    String no_whatsapp,
    String kode_otp,
  ) async {
    Uri url = Uri.parse(ApiHelper.url + 'updateOtpRegis.php');
    var response = await http.post(url, body: {
      'no_whatsapp': no_whatsapp,
      'kode_otp': kode_otp,
    });

    var body = json.decode(response.body);
    return LoginApi(
      kode: body['kode'],
      pesan: body['pesan'],
      data: body['data'],
    );
  }

  static Future<LoginApi> getOtp(
    String kode_otp,
  ) async {
    Uri url = Uri.parse(ApiHelper.url + 'getOtp.php');
    var response = await http.post(url, body: {
      'kode_otp': kode_otp,
    });

    var body = json.decode(response.body);
    return LoginApi(
      kode: body['kode'],
      pesan: body['pesan'],
      data: body['data'],
    );
  }

  static Future<LoginApi> getPengguna(String no_whatsapp) async {
    Uri url = Uri.parse(ApiHelper.url + 'getPengguna.php');
    var response = await http.post(url, body: {
      'no_whatsapp': no_whatsapp,
    });

    var body = json.decode(response.body);
    return LoginApi(
      kode: body['kode'],
      pesan: body['pesan'],
      data: body['data'],
    );
  }

  static Future<LoginApi> postData(String no_whatsapp, String password) async {
    Uri url = Uri.parse(ApiHelper.url + 'login1.php');
    var response = await http.post(url, body: {
      'no_whatsapp': no_whatsapp,
      'password': password,
    });

    var body = json.decode(response.body);
    return LoginApi(
      kode: body['kode'],
      pesan: body['pesan'],
      data: body['data'],
      id__akun: int.parse(body['id_akun'] == null ? "0" : body['id_akun']),
    );
  }

  static Future<LoginApi> registrasiPost(
    String nama_pengguna,
    String nama_kec,
    String no_whatsapp,
    String alamat,
    String password,
    String kode_otp,
    String status,
  ) async {
    Uri url = Uri.parse(ApiHelper.url + 'registrasi1.php');
    var response = await http.post(url, body: {
      'nama_pengguna': nama_pengguna,
      'nama_kec': nama_kec,
      'no_whatsapp': no_whatsapp,
      'alamat': alamat,
      'password': password,
      'kode_otp': kode_otp,
      'status': status,
    });

    var body = json.decode(response.body);
    return LoginApi(
      kode: body['kode'],
      pesan: body['pesan'],
      data: body['data'],
    );
  }
}

class DataPatient {
  String? nama_pengguna;
  String? nama_kec;
  String? no_whatsapp;
  String? alamat;
  String? password;
  String? kode_otp;
  String? status;

  DataPatient({
    this.nama_pengguna,
    this.nama_kec,
    this.no_whatsapp,
    this.alamat,
    this.password,
    this.kode_otp,
    this.status,
  });
}
