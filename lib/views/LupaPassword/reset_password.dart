import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_pkk/models/LoginApi.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:e_pkk/views/LupaPassword/bg_password.dart';
import 'package:e_pkk/views/LupaPassword/succes_verification.dart';
import 'package:e_pkk/views/Registrasi/components/RegistrasiController.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  //ResetPassword({super.key});
  String noHp;

  ResetPassword({Key? key, required this.noHp}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final RegistrasiController controllerRegis = new RegistrasiController();
  late String noWa;

  var _formKey = GlobalKey<FormState>();
  TextEditingController tPw_baru = TextEditingController();
  TextEditingController tKonfirm_pw = TextEditingController();

  @override
  void initState() {
    super.initState();
    noWa = widget.noHp;
    print(widget.noHp);
  }

  void btUpdate(
    BuildContext context,
    String no_whatsapp,
    String password,
    String konfirm,
  ) {
    if (password != konfirm) {
      print("Password tidak sesuai");
      _alertPassword(context);
    } else {
      LoginApi.updateSandi(no_whatsapp, password).then((value) async {
        if (value.kode == 1) {
          print("berhasil");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return SuccesVerification();
              },
            ),
          );
        } else {
          print(value);
          _alertGagal(context);
        }
      });
    }
  }

  _alertPassword(context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.topSlide,
      showCloseIcon: true,
      title: "Gagal",
      desc: "Password yang Anda masukkan tidak sesuai",
      btnOkOnPress: () {},
    ).show();
  }

  _alertGagal(context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.topSlide,
      showCloseIcon: true,
      title: "Gagal",
      desc: "Password yang Anda masukkan adalah password lama. Silahkan gunakan password baru !",
      btnOkOnPress: () {},
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BgPassword(
        child: Form(
          key: _formKey,
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
                      "Atur Ulang",
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
                      "Password Baru",
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
                    padding: EdgeInsets.only(left: 20, top: 50, bottom: 5),
                    child: Text(
                      "Password baru",
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
                    controller: tPw_baru,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'password tidak boleh kosong';
                      } else if (value.length < 6) {
                        return 'password minimal 6 karakter';
                      }
                    },
                    obscureText: controllerRegis.getObscure1,
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
                        child: controllerRegis.obscure1
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                        onTap: () {
                          setState(() {
                            controllerRegis.toglePass1();
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
                    controller: tKonfirm_pw,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'password tidak boleh kosong';
                      } else if (value.length < 6) {
                        return 'password minimal 6 karakter';
                      }
                    },
                    obscureText: controllerRegis.getObscure2,
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
                        onTap: () {
                          setState(() {
                            controllerRegis.toglePass2();
                          });
                        },
                        child: controllerRegis.getObscure2
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 250, bottom: 5),
                  child: Container(
                    width: size.width * 0.9,
                    height: 47,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: AnimatedButton(
                      text: "KONFIRMASI",
                      color: ktextColor,
                      borderRadius: BorderRadius.circular(8),
                      buttonTextStyle: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: whiteColor,
                      ),
                      pressEvent: () {
                        if (_formKey.currentState!.validate()) {
                          btUpdate(
                            context,
                            noWa.toString(),
                            tPw_baru.text,
                            tKonfirm_pw.text,
                          );
                          print(noWa.toString());
                        }
                      },
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
