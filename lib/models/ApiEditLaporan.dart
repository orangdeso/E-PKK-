import 'package:cherry_toast/cherry_toast.dart';
import 'package:e_pkk/helpers/ApiHelper.dart';
import 'package:e_pkk/views/Laporan/Upload_Laporan/notifikasi_kesehatan.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditApiLaporan {
  static Future<void> editLaporanKader1(
      {String? PKBN,
      String? PKDRT,
      String? pola_asuh,
      String? userID,
      BuildContext? context}) async {
    final url = Uri.parse(ApiHelper.url + 'editKader1.php');

    final request = http.MultipartRequest('POST', url)
      ..fields['PKBN'] = PKBN.toString()
      ..fields['PKDRT'] = PKDRT.toString()
      ..fields['pola_asuh'] = pola_asuh.toString()
      ..fields['id_kader_pokja1'] = userID.toString();

    //Loading cirle
    showDialog(
      context: context!,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    final response = await request.send();

    if (response.statusCode == 200) {
      print('Data berhasil disimpan!');
      Navigator.of(context).pop();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return SuccesUploadKesehatan();
          },
        ),
      );
    } else {
      print('Data gagal disimpan!');
      Navigator.of(context).pop();
      CherryToast.error(
        title: Text(
          "Gagal Upload. Silahkan Cek Kembali",
          style: TextStyle(
            fontSize: 13,
          ),
        ),
      ).show(context);
    }
  }
}