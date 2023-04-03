import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginApi {
  int kode;
  String? message;
  String? no_whatsapp;
  String? nama_user;
  String? tanggal_lahir;
  String? alamat;
  String? password;

  LoginApi({
    required this.kode,
    this.message,
    this.no_whatsapp,
    this.nama_user,
    this.tanggal_lahir,
    this.alamat,
    this.password,
  });

  factory LoginApi.createLoginApi(Map<String, dynamic> object) {
    return LoginApi(
      kode: object['kode'],
      message: object['message'],
      no_whatsapp: object['no_whatsapp'],
      nama_user: object['nama_user'],
      tanggal_lahir: object['tanggal_lahir'],
      alamat: object['alamat'],
      password: object['password'],
    );
  }

  static Future<LoginApi> postData(String no_whatsapp, String password) async {
    String apiURL = "http://192.168.137.1/vscode/api_rest_pkk/login.php";
    Uri uri = Uri.parse(apiURL);

    var apiResult = await http
        .post(uri, body: {"no_whatsapp": no_whatsapp, "password": password});
    var jsonObject = json.decode(apiResult.body);

    return LoginApi.createLoginApi(jsonObject);
  }
}
