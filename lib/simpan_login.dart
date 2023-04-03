import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class simpanLogin {
  final Future<SharedPreferences> _sp = SharedPreferences.getInstance();

  Future<void> addUser(int kode, String no_whatsapp, String nama_user) async {
    final SharedPreferences sp = await _sp;
    await sp.setInt('kode', kode);
    await sp.setString('no_whatsapp', no_whatsapp);
    await sp.setString('nama_user', nama_user);
  }
}
