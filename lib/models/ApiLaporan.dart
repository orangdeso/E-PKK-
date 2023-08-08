import 'dart:io';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:e_pkk/views/Laporan/Upload%20_Gambar/notifikasi_sukses.dart';
import 'package:e_pkk/views/Laporan/Upload_Laporan/notifikasi_kelestarian_LH.dart';
import 'package:e_pkk/views/Laporan/Upload_Laporan/notifikasi_kesehatan.dart';
import 'package:e_pkk/views/Laporan/Upload_Laporan/notifikasi_perencanaan_sehat.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../helpers/ApiHelper.dart';

class GetApi {
  static Future<void> LaporanKader1(
      {String? PKBN,
      String? PKDRT,
      String? pola_asuh,
      String? userID,
      BuildContext? context}) async {
    final url = Uri.parse(ApiHelper.url + 'insert_kader1.php');

    final request = http.MultipartRequest('POST', url)
      ..fields['PKBN'] = PKBN.toString()
      ..fields['PKDRT'] = PKDRT.toString()
      ..fields['pola_asuh'] = pola_asuh.toString()
      ..fields['id_user'] = userID.toString();

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

  static Future<void> LaporanPenghayatan(
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
    final url = Uri.parse(ApiHelper.url + 'insert_penghayatan.php');

    final request = http.MultipartRequest('POST', url)
      ..fields['jumlah_kel_simulasi1'] = jumlah_kel_simulasi1.toString()
      ..fields['jumlah_anggota1'] = jumlah_anggota1.toString()
      ..fields['jumlah_kel_simulasi2'] = jumlah_kel_simulasi2.toString()
      ..fields['jumlah_anggota2'] = jumlah_anggota2.toString()
      ..fields['jumlah_kel_simulasi3'] = jumlah_kel_simulasi3.toString()
      ..fields['jumlah_anggota3'] = jumlah_anggota3.toString()
      ..fields['jumlah_kel_simulasi4'] = jumlah_kel_simulasi4.toString()
      ..fields['jumlah_anggota4'] = jumlah_anggota4.toString()
      ..fields['id_user'] = userID.toString();

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

  static Future<void> LaporanGotongRoyong(
      {String? kerja_bakti,
      String? rukun_kematian,
      String? keagamaan,
      String? jimpitan,
      String? arisan,
      String? userID,
      BuildContext? context}) async {
    final url = Uri.parse(ApiHelper.url + 'insert_gotong_royong.php');

    final request = http.MultipartRequest('POST', url)
      ..fields['kerja_bakti'] = kerja_bakti.toString()
      ..fields['rukun_kematian'] = rukun_kematian.toString()
      ..fields['keagamaan'] = keagamaan.toString()
      ..fields['jimpitan'] = jimpitan.toString()
      ..fields['arisan'] = arisan.toString()
      ..fields['id_user'] = userID.toString();

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

  static Future<void> LaporanPendidikan(
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
    final url = Uri.parse(ApiHelper.url + 'insert_pendidikan_ketrampilan.php');

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
      ..fields['id_user'] = userID.toString();

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

  static Future<void> LaporanPengembangan(
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
    final url = Uri.parse(ApiHelper.url + 'insert_pengembangan.php');

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
      ..fields['id_user'] = userID.toString();

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

  static Future<void> LaporanPangan(
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
    final url = Uri.parse(ApiHelper.url + 'insert_pangan.php');

    final request = http.MultipartRequest('POST', url)
      ..fields['beras'] = beras.toString()
      ..fields['non_beras'] = non_beras.toString()
      ..fields['peternakan'] = peternakan.toString()
      ..fields['perikanan'] = perikanan.toString()
      ..fields['warung_hidup'] = warung_hidup.toString()
      ..fields['lumbung_hidup'] = lumbung_hidup.toString()
      ..fields['toga'] = toga.toString()
      ..fields['tanaman_keras'] = tanaman_keras.toString()
      ..fields['id_user'] = userID.toString();

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

  static Future<void> LaporanIndustri(
      {String? pangan,
      String? sandang,
      String? jasa,
      String? userID,
      BuildContext? context}) async {
    final url = Uri.parse(ApiHelper.url + 'insert_industri.php');

    final request = http.MultipartRequest('POST', url)
      ..fields['pangan'] = pangan.toString()
      ..fields['sandang'] = sandang.toString()
      ..fields['jasa'] = jasa.toString()
      ..fields['id_user'] = userID.toString();

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

  static Future<void> LaporanPerumahan(
      {String? layak_huni,
      String? tidak_layak,
      String? userID,
      BuildContext? context}) async {
    final url = Uri.parse(ApiHelper.url + 'insert_perumahan.php');

    final request = http.MultipartRequest('POST', url)
      ..fields['layak_huni'] = layak_huni.toString()
      ..fields['tidak_layak'] = tidak_layak.toString()
      ..fields['id_user'] = userID.toString();

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

  static Future<void> LaporanBidangKesehatan(
      {File? fileBruh,
      String? kategori,
      String? jml_posyandu,
      String? posIterasi,
      String? jml_klp,
      String? jml_anggota,
      String? kartuFree,
      String? userID,
      BuildContext? context}) async {
    final url = Uri.parse(ApiHelper.url + 'insert_laporan_sehat.php');

    final request = http.MultipartRequest('POST', url)
      ..fields['kategori'] = kategori.toString()
      ..fields['jml_posyandu'] = jml_posyandu.toString()
      ..fields['jml_posyandu_iterasi'] = posIterasi.toString()
      ..fields['jml_klp'] = jml_klp.toString()
      ..fields['jml_anggota'] = jml_anggota.toString()
      ..fields['jml_kartu'] = kartuFree.toString()
      ..fields['id_user'] = userID.toString()
      ..files.add(http.MultipartFile.fromBytes(
        'file',
        fileBruh!.readAsBytesSync(),
        filename: fileBruh.path.split('/').last,
      ));

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

  static Future<void> LaporanBidangLingkuhanHidup(
      {File? fileBruh,
      String? jamban,
      String? spal,
      String? tps,
      String? mck,
      String? IdUser,
      String? pdam,
      String? sumur,
      BuildContext? context,
      String? danlainlain}) async {
    final url = Uri.parse(ApiHelper.url + 'insert_kelestarian_LH.php');

    final request = http.MultipartRequest('POST', url)
      ..fields['jamban'] = jamban.toString()
      ..fields['Spal'] = spal.toString()
      ..fields['tps'] = tps.toString()
      ..fields['Mck'] = mck.toString()
      ..fields['Pdam'] = pdam.toString()
      ..fields['Sumur'] = sumur.toString()
      ..fields['dll'] = danlainlain.toString()
      ..fields['id_user'] = IdUser.toString()
      ..files.add(http.MultipartFile.fromBytes(
        'file',
        fileBruh!.readAsBytesSync(),
        filename: fileBruh.path.split('/').last,
      ));

    final response = await request.send();

    if (response.statusCode == 200) {
      print('Data berhasil disimpan!');
      Navigator.push(
        context!,
        MaterialPageRoute(
          builder: (context) {
            return SuccesUploadKelestarian();
          },
        ),
      );
    } else {
      CherryToast.error(
        title: Text(
          "Gagal Upload. Silahkan Cek Kembali",
          style: TextStyle(
            fontSize: 13,
          ),
        ),
      ).show(context!);
      print('Data gagal disimpan!');
    }
  }

  static Future<void> LaporanBidangPerencaanSehat({
    File? fileBruh,
    String? PriaSubur,
    String? WanitaSubur,
    String? Kb_Pria,
    String? Kb_Wanita,
    String? Tabungan_Kk,
    String? userID,
    BuildContext? context,
  }) async {
    final url = Uri.parse(ApiHelper.url + 'insert_laporan_Psehat.php');

    final request = http.MultipartRequest('POST', url)
      ..fields['J_Psubur'] = PriaSubur.toString()
      ..fields['J_Wsubur'] = WanitaSubur.toString()
      ..fields['Kb_p'] = Kb_Pria.toString()
      ..fields['Kb_w'] = Kb_Wanita.toString()
      ..fields['Kk_tbg'] = Tabungan_Kk.toString()
      ..fields['id_user'] = userID.toString()
      ..files.add(http.MultipartFile.fromBytes(
        'file',
        fileBruh!.readAsBytesSync(),
        filename: fileBruh.path.split('/').last,
      ));

    //Loading cirle
    showDialog(
      context: context!,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    //Kirim data
    final response = await request.send();

    if (response.statusCode == 200) {
      print('Data berhasil disimpan!');
      Navigator.of(context).pop();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return SuccesUploadPerencanaan();
          },
        ),
      );
    } else {
      Navigator.of(context).pop();
      CherryToast.error(
        title: Text(
          "Gagal Upload. Silahkan Cek Kembali",
          style: TextStyle(
            fontSize: 13,
          ),
        ),
      ).show(context);
      print('Data gagal disimpan!');
    }
    // pop the loading circle
    //Navigator.of(context).pop();
  }

  static Future<void> DoubleuploadDataImage(
      {List<File>? imageFiles,
      String? judul,
      String? pokja,
      String? bidang,
      String? tanggal,
      String? idUser,
      BuildContext? context}) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse(ApiHelper.url + 'multiImage.php'));

    for (var i = 0; i < imageFiles!.length; i++) {
      var file = imageFiles[i];
      request.files
          .add(await http.MultipartFile.fromPath('image[]', file.path));
    }
    request.fields['judul'] = judul.toString();
    request.fields['pokja'] = pokja.toString();
    request.fields['bidang'] = bidang.toString();
    request.fields['tanggal'] = tanggal.toString();
    request.fields['id_user'] = idUser.toString();

    var response = await request.send();

    if (response.statusCode == 200) {
      print('Upload berhasil');

      Navigator.push(
        context!,
        MaterialPageRoute(
          builder: (context) {
            return SuccesUploadGallery();
          },
        ),
      );
    } else {
      print('Upload gagal');
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

  //   static Future<void> InsertGallery(
  //     {File? file,
  //     String? judul,
  //     String? desc,
  //     String? tanggal,
  //     String? idUser,
  //     BuildContext? context}) async {
  //   final url = Uri.parse(ApiHelper.url + 'insert_galery.php');
  //   final request = http.MultipartRequest('POST', url)
  //     ..fields['judul'] = judul.toString()
  //     ..fields['deskripsi'] = desc.toString()
  //     ..fields['tanggal'] = tanggal.toString()
  //     ..fields['id_user'] = idUser.toString()
  //     ..files.add(http.MultipartFile.fromBytes(
  //       'file',
  //       file!.readAsBytesSync(),
  //       filename: file.path.split('/').last,
  //     ));
  //   final response = await request.send();

  //   if (response.statusCode == 200) {
  //     print('Data berhasil disimpan!');
  //     CherryToast.success(title: Text("Berhasil")).show(context!);
  //   } else {
  //     print('Data gagal disimpan!');
  //   }
  // }
}

