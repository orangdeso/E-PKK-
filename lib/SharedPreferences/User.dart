import 'package:shared_preferences/shared_preferences.dart';

class User {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> addUser(String? id, String nama_pengguna, String nama_kec,
      String nomor_whatsapp, String alamat) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setInt('id', int.parse(id.toString()));
    await prefs.setString('nama_pengguna', nama_pengguna);
    await prefs.setString('nama_kec', nama_kec);
    await prefs.setString('nomor_whatsapp', nomor_whatsapp);
    await prefs.setString('alamat', alamat);
  }

  Future<void> udpateUser(String nama_pengguna, String nama_kec,
      String nomor_whatsapp, String alamat) async {
    final SharedPreferences pref = await _prefs;
    await pref.remove("nama_pengguna");
    await pref.remove("nama_kec");
    await pref.remove("nomor_whatsapp");
    await pref.remove("alamat");
    await pref.setString("nama_pengguna", nama_pengguna);
    await pref.setString("nama_kec", nama_kec);
    await pref.setString("nomor_whatsapp", nomor_whatsapp);
    await pref.setString("alamat", alamat);
  }

  Future<int> getUserId() async {
    return _prefs.then((SharedPreferences pref) {
      return pref.getInt('id') ?? 0;
    });
  }

  Future<String> getNama() async {
    return _prefs.then((SharedPreferences pref) {
      return pref.getString('nama_pengguna') ?? '';
    });
  }

  Future<String> getKec() async {
    return _prefs.then((SharedPreferences pref) {
      return pref.getString('nama_kec') ?? '';
    });
  }

  Future<String> getNoHp() async {
    return _prefs.then((SharedPreferences pref) {
      return pref.getString('no_whatsapp') ?? '';
    });
  }

  Future<String> getAlamat() async {
    return _prefs.then((SharedPreferences pref) {
      return pref.getString('alamat') ?? '';
    });
  }
}
