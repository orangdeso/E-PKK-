import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_pkk/helpers/ApiHelper.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../models/DataAKun.dart';

class API_CONTROLLER {
  static void editAkun(String id, String nama,
      String alamat, String noWa) async {
    final response = await http.post(
      Uri.parse(ApiHelper.url + "editakun.php"),
      body: {
        'id': id,
        "nama_pengguna": nama,
        "nama_kec": alamat,
        "no_whatsapp": noWa
      },
    );

    print(response.body.toString() + "RESPONSE STATUS");
  }

  Future<bool> gantiPasswordPost(
      String idUser, String passwordBaru, String passwordLama) async {
    var url = Uri.parse(ApiHelper.url +
        "gantiSandi.php"); // Ganti dengan URL endpoint yang sesuai
    var response = await http.post(url, body: {
      // Ganti dengan data yang ingin Anda kirimkan
      'id': idUser,
      'password': passwordBaru,
      'password_lama': passwordLama
    });

    if (response.statusCode == 200) {
      // Jika permintaan berhasil, tangkap responsnya
      var responseData = json.decode(response.body);
      var kode = responseData['kode'];
      var message = responseData['message'];
      int kode_statis = kode;
      print('Kode: $kode');
      print('Pesan: $message');
      if (kode_statis == 1) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  static Future<DataAkun> fetchData(String id) async {
    print(" id akun = " + id);
    final response = await http.post(
      Uri.parse(ApiHelper.url +
          "getAkun.php"), // Ganti URL_REST_API dengan URL REST API yang sesuai
      body: {'id': id}, // Ganti '1' dengan id yang diinginkan
    );

    final data = jsonDecode(response.body);
    final apiResponse = DataAkun.fromJson(data);
    return apiResponse;
    /*
    
    if (apiResponse.kode == 1) {
      final user = apiResponse.data;
1
      String idUser = user?.idUser ?? '';
      String namaPengguna = user?.namaPengguna ?? '';
      String namaKec = user?.namaKec ?? '';
      String noWhatsapp = user?.noWhatsapp ?? '';
      String alamat = user?.alamat ?? '';
      String password = user?.password ?? '';

      // Lakukan pemrosesan data sesuai kebutuhan Anda
      // ...

      print('Data Tersedia');
      print('id: $idUser');
      print('nama_pengguna: $namaPengguna');
      print('nama_kec: $namaKec');
      print('no_whatsapp: $noWhatsapp');
      print('alamat: $alamat');
      print('password: $password');
    } else {
      String pesan = apiResponse.pesan;
      print(pesan);
    }
    */
  }

  _showAlertSukses(context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.topSlide,
      showCloseIcon: true,
      title: "Berhasil",
      desc: "Klik tombol ok untuk diarahkan kehalaman beranda",
      btnOkOnPress: () {},
    ).show();
  }

  void show(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: whiteColor,
      textColor: textColor2,
    );
  }
}
