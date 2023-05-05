import 'dart:convert';
import 'package:e_pkk/helpers/ApiHelper.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  int? kode;
  String? pesan;
  DataPatient? data;

  LoginApi({
    this.kode,
    this.pesan,
    this.data,
  });

  // factory LoginApi.createLoginApi(Map<String, dynamic> object) {
  //   return LoginApi(
  //     kode: object['kode'],
  //     pesan:
  //     DataPatien object['message'],
  //     no_whatsapp: object['no_whatsapp'],
  //     nama_user: object['nama_user'],
  //     tanggal_lahir: object['tanggal_lahir'],
  //     alamat: object['alamat'],
  //     password: object['password'],
  //   );
  // }

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
    );
    //String apiURL = "http://172.16.109.54/vscode/api_rest_pkk/login.php";
    // Uri uri = Uri.parse(apiURL);

    // var apiResult = await http
    //     .post(uri, body: {"no_whatsapp": no_whatsapp, "password": password});
    // var jsonObject = json.decode(apiResult.body);

    // return LoginApi.createLoginApi(jsonObject);
  }

  static Future<LoginApi> registrasiPost(
    String nama_pengguna,
    String nama_kec,
    String no_whatsapp,
    String alamat,
    String password,
  ) async {
    Uri url = Uri.parse(ApiHelper.url + 'registrasi1.php');
    var response = await http.post(url, body: {
      'nama_pengguna': nama_pengguna,
      'nama_kec': nama_kec,
      'no_whatsapp': no_whatsapp,
      'alamat': alamat,
      'password': password,
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

  DataPatient({
    this.nama_pengguna,
    this.nama_kec,
    this.no_whatsapp,
    this.alamat,
    this.password,
  });
}
