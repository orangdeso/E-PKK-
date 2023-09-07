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

  static Future<void> editLaporanPenghayatan(
      {String? jumlah_kel_simulasi1,
      String? jumlah_anggota1,
      String? jumlah_kel_simulasi2,
      String? jumlah_anggota2,
      String? jumlah_kel_simulasi3,
      String? jumlah_anggota3,
      String? jumlah_kel_simulasi4,
      String? jumlah_anggota4,
      String? userID,
      BuildContext? context}) async {
    final url = Uri.parse(ApiHelper.url + 'editPenghayatan.php');

    final request = http.MultipartRequest('POST', url)
      ..fields['jumlah_kel_simulasi1'] = jumlah_kel_simulasi1.toString()
      ..fields['jumlah_anggota1'] = jumlah_anggota1.toString()
      ..fields['jumlah_kel_simulasi2'] = jumlah_kel_simulasi2.toString()
      ..fields['jumlah_anggota2'] = jumlah_anggota2.toString()
      ..fields['jumlah_kel_simulasi3'] = jumlah_kel_simulasi3.toString()
      ..fields['jumlah_anggota3'] = jumlah_anggota3.toString()
      ..fields['jumlah_kel_simulasi4'] = jumlah_kel_simulasi4.toString()
      ..fields['jumlah_anggota4'] = jumlah_anggota4.toString()
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

  static Future<void> editLaporanGotong(
      {String? kerja_bakti,
      String? rukun_kematian,
      String? keagamaan,
      String? jimpitan,
      String? arisan,
      String? userID,
      BuildContext? context}) async {
    final url = Uri.parse(ApiHelper.url + 'editGotong.php');

    final request = http.MultipartRequest('POST', url)
      ..fields['kerja_bakti'] = kerja_bakti.toString()
      ..fields['rukun_kematian'] = rukun_kematian.toString()
      ..fields['keagamaan'] = keagamaan.toString()
      ..fields['jimpitan'] = jimpitan.toString()
      ..fields['arisan'] = arisan.toString()
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

  static Future<void> editLaporanPendidikan(
      {String? warga_buta,
      String? kel_belajarA,
      String? warga_belajarA,
      String? kel_belajarB,
      String? warga_belajarB,
      String? kel_belajarC,
      String? warga_belajarC,
      String? kel_belajarKF,
      String? warga_belajarKF,
      String? paud,
      String? taman_bacaan,
      String? jumlah_klp,
      String? jumlah_ibu_peserta,
      String? jumlah_ape,
      String? jumlah_kel_simulasi,
      String? KF,
      String? paud_tutor,
      String? BKB,
      String? koperasi,
      String? ketrampilan,
      String? LP3PKK,
      String? TP3PKK,
      String? damas_pkk,
      String? userID,
      BuildContext? context}) async {
    final url = Uri.parse(ApiHelper.url + 'editPendidikan.php');

    final request = http.MultipartRequest('POST', url)
      ..fields['warga_buta'] = warga_buta.toString()
      ..fields['kel_belajarA'] = kel_belajarA.toString()
      ..fields['warga_belajarA'] = warga_belajarA.toString()
      ..fields['kel_belajarB'] = kel_belajarB.toString()
      ..fields['warga_belajarB'] = warga_belajarB.toString()
      ..fields['kel_belajarC'] = kel_belajarC.toString()
      ..fields['warga_belajarC'] = warga_belajarC.toString()
      ..fields['kel_belajarKF'] = kel_belajarKF.toString()
      ..fields['warga_belajarKF'] = warga_belajarKF.toString()
      ..fields['paud'] = paud.toString()
      ..fields['taman_bacaan'] = taman_bacaan.toString()
      ..fields['jumlah_klp'] = jumlah_klp.toString()
      ..fields['jumlah_ibu_peserta'] = jumlah_ibu_peserta.toString()
      ..fields['jumlah_ape'] = jumlah_ape.toString()
      ..fields['jumlah_kel_simulasi'] = jumlah_kel_simulasi.toString()
      ..fields['KF'] = KF.toString()
      ..fields['paud_tutor'] = paud_tutor.toString()
      ..fields['BKB'] = BKB.toString()
      ..fields['koperasi'] = koperasi.toString()
      ..fields['ketrampilan'] = ketrampilan.toString()
      ..fields['LP3PKK'] = LP3PKK.toString()
      ..fields['TP3PKK'] = TP3PKK.toString()
      ..fields['damas_pkk'] = damas_pkk.toString()
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

  static Future<void> editLaporanPengembangan(
      {String? jumlah_kelompok_pemula,
      String? jumlah_peserta_pemula,
      String? jumlah_kelompok_madya,
      String? jumlah_peserta_madya,
      String? jumlah_kelompok_utama,
      String? jumlah_peserta_utama,
      String? jumlah_kelompok_mandiri,
      String? jumlah_peserta_mandiri,
      String? jumlah_kelompok_hukum,
      String? jumlah_peserta_hukum,
      String? userID,
      BuildContext? context}) async {
    final url = Uri.parse(ApiHelper.url + 'editPengembangan.php');

    final request = http.MultipartRequest('POST', url)
      ..fields['jumlah_kelompok_pemula'] = jumlah_kelompok_pemula.toString()
      ..fields['jumlah_peserta_pemula'] = jumlah_peserta_pemula.toString()
      ..fields['jumlah_kelompok_madya'] = jumlah_kelompok_madya.toString()
      ..fields['jumlah_peserta_madya'] = jumlah_peserta_madya.toString()
      ..fields['jumlah_kelompok_utama'] = jumlah_kelompok_utama.toString()
      ..fields['jumlah_peserta_utama'] = jumlah_peserta_utama.toString()
      ..fields['jumlah_kelompok_mandiri'] = jumlah_kelompok_mandiri.toString()
      ..fields['jumlah_peserta_mandiri'] = jumlah_peserta_mandiri.toString()
      ..fields['jumlah_kelompok_hukum'] = jumlah_kelompok_hukum.toString()
      ..fields['jumlah_peserta_hukum'] = jumlah_peserta_hukum.toString()
      ..fields['id_pokja2_bidang2'] = userID.toString();

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

  static Future<void> editLaporanKader3(
      {String? pangan,
      String? sandang,
      String? tata_laksana_rumah,
      String? userID,
      BuildContext? context}) async {
    final url = Uri.parse(ApiHelper.url + 'editKader3.php');

    final request = http.MultipartRequest('POST', url)
      ..fields['pangan'] = pangan.toString()
      ..fields['sandang'] = sandang.toString()
      ..fields['tata_laksana_rumah'] = tata_laksana_rumah.toString()
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

  static Future<void> editLaporanPangan(
      {String? beras,
      String? non_beras,
      String? peternakan,
      String? perikanan,
      String? warung_hidup,
      String? lumbung_hidup,
      String? toga,
      String? tanaman_keras,
      String? userID,
      BuildContext? context}) async {
    final url = Uri.parse(ApiHelper.url + 'editPangan.php');

    final request = http.MultipartRequest('POST', url)
      ..fields['beras'] = beras.toString()
      ..fields['non_beras'] = non_beras.toString()
      ..fields['peternakan'] = peternakan.toString()
      ..fields['perikanan'] = perikanan.toString()
      ..fields['warung_hidup'] = warung_hidup.toString()
      ..fields['lumbung_hidup'] = lumbung_hidup.toString()
      ..fields['toga'] = toga.toString()
      ..fields['tanaman_keras'] = tanaman_keras.toString()
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

  static Future<void> editLaporanIndustri(
      {String? pangan,
      String? sandang,
      String? jasa,
      String? userID,
      BuildContext? context}) async {
    final url = Uri.parse(ApiHelper.url + 'editIndustri.php');

    final request = http.MultipartRequest('POST', url)
      ..fields['pangan'] = pangan.toString()
      ..fields['sandang'] = sandang.toString()
      ..fields['jasa'] = jasa.toString()
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

  static Future<void> editLaporanPerumahan(
      {String? layak_huni,
      String? tidak_layak,
      String? userID,
      BuildContext? context}) async {
    final url = Uri.parse(ApiHelper.url + 'editPerumahan.php');

    final request = http.MultipartRequest('POST', url)
      ..fields['layak_huni'] = layak_huni.toString()
      ..fields['tidak_layak'] = tidak_layak.toString()
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

  static Future<void> editLaporanKader4({
    String? posyandu,
    String? gizi,
    String? kesling,
    String? penyuluhan,
    String? PHBS,
    String? KB,
    String? userID,
    BuildContext? context,
  }) async {
    final url = Uri.parse(ApiHelper.url + 'editKader4.php');

    final request = http.MultipartRequest('POST', url)
      ..fields['posyandu'] = posyandu.toString()
      ..fields['gizi'] = gizi.toString()
      ..fields['kesling'] = kesling.toString()
      ..fields['penyuluhan_narkoba'] = penyuluhan.toString()
      ..fields['PHBS'] = PHBS.toString()
      ..fields['KB'] = KB.toString()
      ..fields['id_user'] = userID.toString();

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
