import 'package:e_pkk/helpers/ApiHelper.dart';
import 'package:e_pkk/models/PengumumanModel.dart';
import 'package:e_pkk/models/Riwayat.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RouterModel {
  // getPengumuman
  static Future<PengumumanModel> getPengumuman() async {
    Uri url = Uri.parse(ApiHelper.url + 'getPengumuman.php');
    var response = await http.get(url);
    var body = json.decode(response.body);
    return PengumumanModel.fromJson(body);
  }

  // getRiwayat
  static Future<Riwayat> getRiwayat() async {
    Uri url = Uri.parse(ApiHelper.url + 'getRiwayat.php');
    var response = await http.get(url);
    var body = json.decode(response.body);
    return Riwayat.fromJson(body);
  }

}