// ignore_for_file: body_might_complete_normally_nullable

import 'package:e_pkk/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:e_pkk/controller/ApiController.dart';
import '../../models/DataAKun.dart';

class KeamananAkunPage extends StatefulWidget {
  const KeamananAkunPage({super.key});

  @override
  State<KeamananAkunPage> createState() => _KeamananAkunPageState();
}

class _KeamananAkunPageState extends State<KeamananAkunPage> {
  final TextEditingController passwordLama = TextEditingController();
  final TextEditingController passwordBaru_1 = TextEditingController();
  final TextEditingController passwordBaru_2 = TextEditingController();
  late Future<DataAkun> futureAkun;
  String idAkun = '';
  //Validasi form
  var _formkey = GlobalKey<FormState>();
  //Visit Password
  bool obscure1 = true;
  bool obscure2 = true;
  bool obscure3 = true;
  bool _isChecked = false;

  get isChecked => this._isChecked;
  set isChecked(value) => this._isChecked = value;

  get getObscure1 => this.obscure1;
  get getObscure2 => this.obscure2;
  get getObscure3 => this.obscure3;

  void toglePass1() {
    obscure1 = !obscure1;
  }

  void toglePass2() {
    obscure2 = !obscure2;
  }

  void toglePass3() {
    obscure3 = !obscure3;
  }

  Future<void> getIdAkunFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String idAkunValue = prefs.getString("id_akun") ??
        ''; // Menggunakan operator nullish coalescing untuk menetapkan nilai default jika kunci tidak ada
    setState(() {
      idAkun = idAkunValue;
    });
  }

  @override
  void initState() {
    super.initState();
    getIdAkunFromSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ktextColor,
        title: Text(
          "Keamanan Akun",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    'Masukkan Password Lama:',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                // TextFormField(
                //   controller: passwordLama,
                //   obscureText: true,
                //   decoration: InputDecoration(
                //     hintText: 'Password Lama',
                //   ),
                // ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    color: grey100,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: grey300,
                      width: 1.2,
                    ),
                  ),
                  child: TextFormField(
                    controller: passwordLama,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'password tidak boleh kosong';
                      } else if (value.length < 6) {
                        return 'password minimal 6 karakter';
                      }
                    },
                    obscureText: getObscure1,
                    decoration: InputDecoration(
                      hintText: "Masukkan password",
                      hintStyle: TextStyle(
                        color: grey400,
                        fontSize: 15,
                      ),
                      icon: Icon(
                        Icons.lock,
                        //color: ktextColor,
                      ),
                      suffixIcon: GestureDetector(
                        child: obscure1
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                        onTap: () {
                          setState(
                            () {
                              toglePass1();
                            },
                          );
                        },
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Masukkan Password Baru:',
                  style: TextStyle(fontSize: 16),
                ),
                // TextFormField(
                //   controller: passwordBaru_1,
                //   obscureText: true,
                //   decoration: InputDecoration(
                //     hintText: 'Password Baru',
                //   ),
                // ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    color: grey100,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: grey300,
                      width: 1.2,
                    ),
                  ),
                  child: TextFormField(
                    controller: passwordBaru_1,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'password tidak boleh kosong';
                      } else if (value.length < 6) {
                        return 'password minimal 6 karakter';
                      }
                    },
                    obscureText: getObscure2,
                    decoration: InputDecoration(
                      hintText: "Masukkan password",
                      hintStyle: TextStyle(
                        color: grey400,
                        fontSize: 15,
                      ),
                      icon: Icon(
                        Icons.lock,
                        //color: ktextColor,
                      ),
                      suffixIcon: GestureDetector(
                        child: obscure2
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                        onTap: () {
                          setState(
                            () {
                              toglePass2();
                            },
                          );
                        },
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Konfirmasi Password Baru:',
                  style: TextStyle(fontSize: 16),
                ),
                // TextFormField(
                //   controller: passwordBaru_2,
                //   obscureText: true,
                //   decoration: InputDecoration(
                //     hintText: 'Konfirmasi Password Baru',
                //   ),
                // ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    color: grey100,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: grey300,
                      width: 1.2,
                    ),
                  ),
                  child: TextFormField(
                    controller: passwordBaru_2,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'password tidak boleh kosong';
                      } else if (value.length < 6) {
                        return 'password minimal 6 karakter';
                      }
                    },
                    obscureText: getObscure3,
                    decoration: InputDecoration(
                      hintText: "Masukkan password",
                      hintStyle: TextStyle(
                        color: grey400,
                        fontSize: 15,
                      ),
                      icon: Icon(
                        Icons.lock,
                        //color: ktextColor,
                      ),
                      suffixIcon: GestureDetector(
                        child: obscure3
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                        onTap: () {
                          setState(
                            () {
                              toglePass3();
                            },
                          );
                        },
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Container(
                    height: 47,
                    width: size.width * 0.9,
                    child: ElevatedButton(
                      onPressed: () async {
                        // Logika untuk mengganti password
                        if (_formkey.currentState!.validate()) {
                          if (passwordBaru_1.text == passwordBaru_2.text) {
                            bool statusGanti = await API_CONTROLLER()
                                .gantiPasswordPost(idAkun, passwordBaru_1.text,
                                    passwordLama.text);
                            if (statusGanti == true) {
                              //toast apabila password benar dan berhasil di ganti
                              //Fluttertoast.showToast(msg: "Password berhasil Diganti ");
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Password berhasil Diganti",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            } else {
                              //toast apabila password lama tidak sesuai
                              //Fluttertoast.showToast(msg: "Password lama Tidak sesuai ");
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Password lama Tidak sesuai",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            }
                          } else {
                            //toast apabila password tidak sama
                            // Fluttertoast.showToast(
                            //     msg: "Password baru yang anda Masukkan tidak sama ");
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Password baru yang anda Masukkan tidak sama",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          }
                        }
                      },
                      // style: ElevatedButton.styleFrom(
                      //   backgroundColor: ktextColor,
                      //   elevation: 10,
                      // ),
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(10),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(ktextColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      child: Text(
                        'Ganti Password',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
