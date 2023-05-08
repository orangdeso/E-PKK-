import 'dart:io';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../helpers/ApiHelper.dart';

class GetApi {
  static Future<void> LaporanBidangKesehatan(
      {File? fileBruh,
      String? kategori,
      String? jml_posyandu,
      String? posIterasi,
      String? jml_klp,
      String? jml_anggota,
      String? kartuFree,
      BuildContext? context}) async {
    final url = Uri.parse(
        ApiHelper.url+'insert_laporan_sehat.php');

    final request = http.MultipartRequest('POST', url)
      ..fields['kategori'] = kategori.toString()
      ..fields['jml_posyandu'] = jml_posyandu.toString()
      ..fields['jml_posyandu_iterasi'] = posIterasi.toString()
      ..fields['jml_klp'] = jml_klp.toString()
      ..fields['jml_anggota'] = jml_anggota.toString()
      ..fields['jml_kartu'] = kartuFree.toString()
      ..files.add(http.MultipartFile.fromBytes(
        'file',
        fileBruh!.readAsBytesSync(),
        filename: fileBruh.path.split('/').last,
      ));

    final response = await request.send();

    if (response.statusCode == 200) {
      // print('Data berhasil disimpan!');
      CherryToast.success(title: Text("Berhasil")).show(context!);
    } else {
      print('Data gagal disimpan!');
    }
  }

  static Future<void> LaporanBidangLingkuhanHidup(
      {File? fileBruh,
      String? jamban,
      String? spal,
      String? tps,
      String? mck,
      String? pdam,
      String? sumur,
      String? danlainlain}) async {
    final url = Uri.parse(
         ApiHelper.url+'insert_kelestarian_pangan.php');

    final request = http.MultipartRequest('POST', url)
      ..fields['jamban'] = jamban.toString()
      ..fields['Spal'] = spal.toString()
      ..fields['tps'] = tps.toString()
      ..fields['Mck'] = mck.toString()
      ..fields['Pdam'] = pdam.toString()
      ..fields['Sumur'] = sumur.toString()
      ..fields['dll'] = danlainlain.toString()
      ..files.add(http.MultipartFile.fromBytes(
        'file',
        fileBruh!.readAsBytesSync(),
        filename: fileBruh.path.split('/').last,
      ));

    final response = await request.send();

    if (response.statusCode == 200) {
      print('Data berhasil disimpan!');
    } else {
      print('Data gagal disimpan!');
    }
  }
}
