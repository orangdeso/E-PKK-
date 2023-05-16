import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_pkk/views/Login/components/LoginController.dart';
import 'package:e_pkk/views/LupaPassword/lupa_password_screen.dart';
import 'package:e_pkk/models/LoginApi.dart';
import 'package:e_pkk/views/Login/components/background.dart';
import 'package:e_pkk/views/Registrasi/components/atau_divider.dart';
import 'package:e_pkk/views/Registrasi/registrasi_screen.dart';
import 'package:e_pkk/views/Welcome/welcome_screen.dart';
import 'package:e_pkk/widgets/rounded_password_field.dart';
import 'package:e_pkk/simpan_login.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool no_whatsapp = false;
  final LoginController controller = new LoginController();

  var _formKey = GlobalKey<FormState>();
  TextEditingController tNo_whatsapp = TextEditingController();
  TextEditingController tPassword = TextEditingController();

  // final Future<SharedPreferences> _sp = SharedPreferences.getInstance();

  // void addUser() async {
  //   SharedPreferences sp = await SharedPreferences.getInstance();
  //   // await sp.setInt('kode', kode);
  //   await sp.setString('no_whatsapp', tNo_whatsapp.text);
  //   // await sp.setString('nama_user', nama_user);
  // }

  // void _tes() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   pref.setString("nowa", tNo_whatsapp.toString());
  // }

  // //Method untuk menyimpan teks yang dimasukkan pada form
  // @override
  // void dispose() {
  //   super.dispose();
  //   no_whatsapp.dispose();
  //   password.dispose();
  // }

  // //Method untuk mengatur pesan toast
  // void show(String message) {
  //   Fluttertoast.showToast(
  //     msg: message,
  //     toastLength: Toast.LENGTH_SHORT,
  //     gravity: ToastGravity.BOTTOM,
  //     timeInSecForIosWeb: 1,
  //     backgroundColor: whiteColor,
  //     textColor: textColor2,
  //   );
  // }

  // //Method untuk navigasi button login
  // void navigate(BuildContext context) {
  //   if (no_whatsapp.text == null && password.text == null) {
  //     show("Berhasil Login");
  //     Navigator.of(context)
  //         .push(MaterialPageRoute(builder: (context) => WelcomeScreen()));
  //     // Navigator.push(
  //     //   context,
  //     //   MaterialPageRoute(
  //     //     builder: (context) {
  //     //       return WelcomeScreen();
  //     //     },
  //     //   ),
  //     // );
  //   } else {
  //     show("no_whatsapp atau password anda salah");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
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
                    "Selamat",
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
                    "Datang",
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
                    "Di E-PKK",
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
                  padding: EdgeInsets.only(left: 20, top: 45, bottom: 5),
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
                    controller: tNo_whatsapp,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Masukkan nomor WhatsApp Anda';
                      } else if (value.length < 12) {
                        return 'minimal 12 digit nomor';
                      }
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(13),
                    ],
                    cursorColor: ktextColor,
                    decoration: InputDecoration(
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
                  obscureText: controller.getObscure,
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
                          controller.toglePass();
                        });
                      },
                      child: controller.getObscure
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Align(
                alignment: FractionalOffset.topRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 20, top: 10),
                  child: GestureDetector(
                    onTap: () {
                      //Logic
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return lupaPassword();
                          },
                        ),
                      );
                    },
                    child: Text(
                      "Lupa Password ?",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        color: ktextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 5),
                child: Container(
                  width: size.width * 0.9,
                  height: 47,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: AnimatedButton(
                    text: "LOGIN",
                    color: ktextColor,
                    borderRadius: BorderRadius.circular(8),
                    buttonTextStyle: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: whiteColor,
                    ),
                    pressEvent: () {
                      if (_formKey.currentState!.validate()) {
                        controller.btLogin(
                          context,
                          tNo_whatsapp.text,
                          tPassword.text,
                        );
                      }
                    },
                  ),
                ),
              ),
              OrDivider(),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Container(
                  width: size.width * 0.9,
                  height: 47,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: grey100,
                        side: BorderSide(color: grey300),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/whatsapp5.png",
                          ),
                          SizedBox(width: 15),
                          Text(
                            "Login dengan WhatsApp",
                            style: TextStyle(
                              color: grey700,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Belum memiliki akun ? ",
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
                              return RegistrasiScreen();
                            },
                          ),
                        );
                      },
                      child: Text(
                        "Daftar",
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
    );
  }

  // LoginApi? la;
  // SharedPreferences? sp;

  // void postLogin() async {
  //   LoginApi.postData(no_whatsapp.text, password.text).then((value) {
  //     la = value;
  //     checkLoginCondition();
  //   });
  // }

  // void checkLoginCondition() {
  //   if (la != null) {
  //     if (la!.kode == 1) {
  //       Navigator.pushNamed(
  //         context,
  //         '/home',
  //       );
  //       simpanLogin().addUser(
  //           la!.kode, la!.no_whatsapp.toString(), la!.nama_user.toString());
  //     } else {
  //       debugPrint('akun tidak ditemukan');
  //     }
  //   } else {
  //     debugPrint('error');
  //   }
  // }
}
