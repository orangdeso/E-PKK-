import 'package:cherry_toast/cherry_toast.dart';
import 'package:e_pkk/helpers/ApiHelper.dart';
import 'package:e_pkk/views/Laporan/Upload_Laporan/notifikasi_kesehatan.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditBatalkanLaporan {
  static Future<void> cancelLaporanKader1({
    String? userID,
    BuildContext? context,
  }) async {
    final url = Uri.parse(ApiHelper.url + 'editStatusKader1.php');

    final request = http.MultipartRequest('POST', url)
      ..fields['id_kader_pokja1'] = userID.toString();

    final response = await request.send();

    if (response.statusCode == 200) {
      print('Data berhasil disimpan!');
      //Navigator.of(context).pop();
      Navigator.push(
        context!,
        MaterialPageRoute(
          builder: (context) {
            return SuccesUploadKesehatan();
          },
        ),
      );
    } else {
      print('Data gagal disimpan!');
      //Navigator.of(context).pop();
      CherryToast.error(
        title: Text(
          "Gagal Upload. Silahkan Cek Kembali",
          style: TextStyle(
            fontSize: 13,
          ),
        ),
      ).show(context!);
    }
  }

  static Future<void> cancelLaporanPenghayatan({
    String? userID,
    BuildContext? context,
  }) async {
    final url = Uri.parse(ApiHelper.url + 'editStatusPenghayatan.php');

    final request = http.MultipartRequest('POST', url)
      ..fields['id_pokja1_bidang1'] = userID.toString();

    final response = await request.send();

    if (response.statusCode == 200) {
      print('Data berhasil disimpan!');
      //Navigator.of(context).pop();
      Navigator.push(
        context!,
        MaterialPageRoute(
          builder: (context) {
            return SuccesUploadKesehatan();
          },
        ),
      );
    } else {
      print('Data gagal disimpan!');
      //Navigator.of(context).pop();
      CherryToast.error(
        title: Text(
          "Gagal Upload. Silahkan Cek Kembali",
          style: TextStyle(
            fontSize: 13,
          ),
        ),
      ).show(context!);
    }
  }

  static Future<void> cancelLaporanGotong({
    String? userID,
    BuildContext? context,
  }) async {
    final url = Uri.parse(ApiHelper.url + 'editStatusGotong.php');

    final request = http.MultipartRequest('POST', url)
      ..fields['id_pokja1_bidang2'] = userID.toString();

    final response = await request.send();

    if (response.statusCode == 200) {
      print('Data berhasil disimpan!');
      //Navigator.of(context).pop();
      Navigator.push(
        context!,
        MaterialPageRoute(
          builder: (context) {
            return SuccesUploadKesehatan();
          },
        ),
      );
    } else {
      print('Data gagal disimpan!');
      //Navigator.of(context).pop();
      CherryToast.error(
        title: Text(
          "Gagal Upload. Silahkan Cek Kembali",
          style: TextStyle(
            fontSize: 13,
          ),
        ),
      ).show(context!);
    }
  }
}
