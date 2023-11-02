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

  static Future<void> cancelLaporanPendidikan({
    String? userID,
    BuildContext? context,
  }) async {
    final url = Uri.parse(ApiHelper.url + 'editStatusPendidikan.php');

    final request = http.MultipartRequest('POST', url)
      ..fields['id_pokja2_bidang1'] = userID.toString();

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

  static Future<void> cancelLaporanPengembangan({
    String? userID,
    BuildContext? context,
  }) async {
    final url = Uri.parse(ApiHelper.url + 'editStatusPengembangan.php');

    final request = http.MultipartRequest('POST', url)
      ..fields['id_pok2_bidang2'] = userID.toString();

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

  static Future<void> cancelLaporanKader3({
    String? userID,
    BuildContext? context,
  }) async {
    final url = Uri.parse(ApiHelper.url + 'editStatusKader3.php');

    final request = http.MultipartRequest('POST', url)
      ..fields['id_kader_pokja3'] = userID.toString();

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

  static Future<void> cancelLaporanPangan(
      {String? userID, BuildContext? context}) async {
    final url = Uri.parse(ApiHelper.url + 'editStatusPangan.php');

    final request = http.MultipartRequest('POST', url)
      ..fields['id_pokja3_bidang1'] = userID.toString();

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

  static Future<void> cancelLaporanIndustri({
    String? userID,
    BuildContext? context,
  }) async {
    final url = Uri.parse(ApiHelper.url + 'editStatusIndustri.php');

    final request = http.MultipartRequest('POST', url)
      ..fields['id_pokja3_bidang2'] = userID.toString();

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

  static Future<void> cancelLaporanPerumahan({
    String? userID,
    BuildContext? context,
  }) async {
    final url = Uri.parse(ApiHelper.url + 'editStatusPerumahan.php');

    final request = http.MultipartRequest('POST', url)
      ..fields['id_pokja3_bidang3'] = userID.toString();

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

  static Future<void> cancelLaporanKader4({
    String? userID,
    BuildContext? context,
  }) async {
    final url = Uri.parse(ApiHelper.url + 'editStatusKader4.php');

    final request = http.MultipartRequest('POST', url)
      ..fields['id_kader_pokja4'] = userID.toString();

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

  static Future<void> cancelLaporanKesehatan({
    String? userID,
    BuildContext? context,
  }) async {
    final url = Uri.parse(ApiHelper.url + 'editStatusKesehatan.php');

    final request = http.MultipartRequest('POST', url)
      ..fields['id_laporan_sehat'] = userID.toString();

    final response = await request.send();

    if (response.statusCode == 200) {
      print('Data berhasil disimpan!');
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
