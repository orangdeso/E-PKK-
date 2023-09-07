// ignore_for_file: body_might_complete_normally_nullable

import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_pkk/helpers/ApiHelper.dart';
import 'package:e_pkk/models/LoginApi.dart';
import 'package:e_pkk/views/Login/login_screen.dart';
import 'package:e_pkk/views/Registrasi/components/RegistrasiController.dart';
import 'package:e_pkk/views/Registrasi/components/background.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:e_pkk/views/Registrasi/otp_page_regis.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

class RegistrasiScreen extends StatefulWidget {
  const RegistrasiScreen({super.key});

  @override
  State<RegistrasiScreen> createState() => _RegistrasiScreenState();
}

class _RegistrasiScreenState extends State<RegistrasiScreen> {
  final RegistrasiController controller = new RegistrasiController();

  var _formkey = GlobalKey<FormState>();

  TextEditingController tNama = TextEditingController();
  TextEditingController tNamaKec = TextEditingController();
  TextEditingController tWa = TextEditingController();
  TextEditingController tAlamat = TextEditingController();
  TextEditingController tPassword = TextEditingController();
  TextEditingController tKonfirm = TextEditingController();

  void _kirimNotifikasi() async {
    Uri url = Uri.parse(ApiHelper.url + 'otpWa.php');

    var data = {
      "kodeOtp": randomNumber.toString(),
      "noHp": tWa.text,
    };
    var response = await http.post(url, body: data);
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      print('Respon dari server: $responseData');
    } else {
      print('Gagal mengirim data. Kode status: ${response.statusCode}');
    }
  }

  String status = 'Unverified';
  int randomNumber = 100000;

  void random() {
    setState(() {
      Random random = new Random();
      randomNumber = random.nextInt(900000) + 100000;
    });
  }

  void btRegister(
      BuildContext context,
      String nama_pengguna,
      String nama_kec,
      String no_whatsapp,
      String alamat,
      String password,
      String konfirm,
      String kode_otp,
      String status) async {
    showDialog(
      context: context,
      barrierDismissible: false, // Tidak bisa ditutup selama menunggu
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(
            color: ktextColor,
            backgroundColor: Colors.grey.shade400,
            semanticsLabel: 'Loading',
          ),
        );
      },
    );
    // await Future.delayed(Duration(seconds: 2));
    if (password != konfirm) {
      _alertPassword(context);
    } else {
      LoginApi.registrasiPost(
        nama_pengguna,
        nama_kec,
        no_whatsapp,
        alamat,
        password,
        kode_otp,
        status,
      ).then((value) async {
        if (value.kode == 1) {
          _kirimNotifikasi();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return otpPageRegis(
                  noHp: tWa.text,
                  kodeOtp: randomNumber.toString(),
                );
              },
            ),
          );
        } else {
          _alertGagal(context);
          print(value);
        }
      });
    }
  }

  _alertPassword(context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.topSlide,
      showCloseIcon: false,
      title: "Gagal",
      desc: "Konfirmasi password yang Anda masukkan tidak sesuai",
      btnOkOnPress: () {
        Navigator.pop(context);
      },
    ).show();
  }

  _alertGagal(context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.topSlide,
      showCloseIcon: false,
      title: "Gagal mendaftarkan akun",
      desc:
          "Nomor WhatsApp atau nama kecamatan sudah digunakan. Silahkan cek kembali !",
      btnOkOnPress: () {
        Navigator.pop(context);
      },
    ).show();
  }

  @override
  void initState() {
    random();
    super.initState();
  }

  @override
  Widget build(BuildContext contextp) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: size.height * 0.15),
                Align(
                  alignment: FractionalOffset.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Pendaftaran",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        color: ktextColor,
                        fontSize: 30,
                        fontWeight: bold,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: FractionalOffset.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, top: 5),
                    child: Text(
                      "Akun",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        color: ktextColor,
                        fontSize: 30,
                        fontWeight: bold,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: FractionalOffset.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, top: 30, bottom: 5),
                    child: Text(
                      "Nama",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        color: grey800,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: FractionalOffset.topCenter,
                  child: Container(
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
                      controller: tNama,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama tidak boleh kosong';
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Masukkan nama",
                        hintStyle: TextStyle(
                          color: grey400,
                          fontSize: 15,
                        ),
                        icon: Icon(
                          Icons.person,
                          //color: ktextColor,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: FractionalOffset.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, top: 15, bottom: 5),
                    child: Text(
                      "Kecamatan",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        color: grey800,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
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
                  child: Autocomplete(
                    optionsBuilder: (TextEditingValue textValue) {
                      return cities.where(
                        (String value) => value.toLowerCase().startsWith(
                              textValue.text.toLowerCase(),
                            ),
                      );
                    },
                    //Cek kondisi apakah sudah sesuai dengan value
                    onSelected: (option) {
                      print(option);
                    },
                    fieldViewBuilder: (BuildContext context,
                        TextEditingController textEditingController,
                        FocusNode focusNode,
                        VoidCallback onFieldSubmitted) {
                      tNamaKec = textEditingController;
                      return TextFormField(
                        controller: tNamaKec,
                        focusNode: focusNode,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nama kecamatan tidak boleh kosong';
                          }
                        },
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          hintText: "Pilih kecamatan",
                          hintStyle: TextStyle(
                            color: grey400,
                            fontSize: 15,
                          ),
                          icon: Icon(
                            Icons.location_city_outlined,
                          ),
                          border: InputBorder.none,
                        ),
                      );
                    },
                  ),
                ),
                Align(
                  alignment: FractionalOffset.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, top: 15, bottom: 5),
                    child: Text(
                      "Nomor WhatsApp",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        color: grey800,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: FractionalOffset.topCenter,
                  child: Container(
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
                      controller: tWa,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'No Whatsapp tidak boleh kosong';
                        } else if (value.length < 12) {
                          return 'minimal 12 digit nomor';
                        } else if (value.length > 13) {
                          return 'nomor melebihi 13 digit';
                        }
                      },
                      maxLength: 13,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        counterText: "",
                        hintText: "0821xxx",
                        hintStyle: TextStyle(
                          color: grey400,
                          fontSize: 15,
                        ),
                        icon: Icon(
                          Icons.tablet_android,
                          //color: ktextColor,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: FractionalOffset.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, top: 15, bottom: 5),
                    child: Text(
                      "Alamat",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        color: grey800,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: FractionalOffset.topCenter,
                  child: Container(
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
                      controller: tAlamat,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Alamat tidak boleh kosong';
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Jl. Mayan",
                        hintStyle: TextStyle(
                          color: grey400,
                          fontSize: 15,
                        ),
                        icon: Icon(
                          Icons.location_on,
                          //color: ktextColor,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: FractionalOffset.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, top: 15, bottom: 5),
                    child: Text(
                      "Password",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        color: grey800,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
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
                    controller: tPassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'password tidak boleh kosong';
                      } else if (value.length < 6) {
                        return 'password minimal 6 karakter';
                      }
                    },
                    obscureText: controller.getObscure1,
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
                        child: controller.obscure1
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                        onTap: () {
                          setState(() {
                            controller.toglePass1();
                          });
                        },
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Align(
                  alignment: FractionalOffset.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, top: 15, bottom: 5),
                    child: Text(
                      "Konfirmasi password",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        color: grey800,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
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
                    controller: tKonfirm,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'password tidak boleh kosong';
                      } else if (value.length < 6) {
                        return 'password minimal 6 karakter';
                      }
                    },
                    obscureText: controller.getObscure2,
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
                        child: controller.obscure2
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                        onTap: () {
                          setState(() {
                            controller.toglePass2();
                          });
                        },
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 5),
                  child: Container(
                    width: size.width * 0.9,
                    height: 47,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ktextColor,
                          elevation: 10,
                        ),
                        onPressed: () {
                          setState(() {
                            if (_formkey.currentState!.validate()) {
                              btRegister(
                                context,
                                tNama.text,
                                tNamaKec.text,
                                tWa.text,
                                tAlamat.text,
                                tPassword.text,
                                tKonfirm.text,
                                randomNumber.toString(),
                                status,
                              );
                              print(tNama);
                              print(tNamaKec);
                              print(tWa);
                              print(tAlamat);
                              print(tPassword);
                              print(randomNumber.toString());
                              print(status);
                            }
                          });
                        },
                        child: Text(
                          "DAFTAR",
                          style: TextStyle(
                            color: whiteColor,
                            fontSize: 18.0,
                            fontWeight: bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // OrDivider(),
                // Padding(
                //   padding: EdgeInsets.only(top: 5),
                //   child: Container(
                //     width: size.width * 0.9,
                //     height: 47,
                //     margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                //     child: ClipRRect(
                //       borderRadius: BorderRadius.circular(8),
                //       child: ElevatedButton(
                //         style: ElevatedButton.styleFrom(
                //           backgroundColor: grey100,
                //           side: BorderSide(color: grey300),
                //         ),
                //         onPressed: () {},
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Image.asset(
                //               "assets/images/whatsapp5.png",
                //             ),
                //             SizedBox(width: 15),
                //             Text(
                //               "Daftar dengan WhatsApp",
                //               style: TextStyle(
                //                 color: grey700,
                //                 fontSize: 16,
                //                 fontWeight: FontWeight.w600,
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Sudah memiliki akun ? ",
                        style: TextStyle(
                          color: grey500,
                          fontSize: 15,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          //Link ke button lainnya
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return LoginScreen();
                              },
                            ),
                          );
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: ktextColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
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

const List<String> cities = <String>[
  "Bagor",
  "Baron",
  "Berbek",
  "Gondang",
  "Jatikalen",
  "Kertosono",
  "Lengkong",
  "Loceret",
  "Nganjuk",
  "Ngetos",
  "Ngluyu",
  "Ngronggot",
  "Pace",
  "Patianrowo",
  "Prambon",
  "Rejoso",
  "Sawahan",
  "Sukomoro",
  "Tanjunganom",
  "Wilangan",
];
