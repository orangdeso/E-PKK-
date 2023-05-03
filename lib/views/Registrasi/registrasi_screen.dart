import 'package:e_pkk/views/Login/login_screen.dart';
import 'package:e_pkk/views/Registrasi/components/RegistrasiController.dart';
import 'package:e_pkk/views/Registrasi/components/atau_divider.dart';
import 'package:e_pkk/views/Registrasi/components/background.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegistrasiScreen extends StatefulWidget {
  const RegistrasiScreen({super.key});

  @override
  State<RegistrasiScreen> createState() => _RegistrasiScreenState();
}

class _RegistrasiScreenState extends State<RegistrasiScreen> {
  final RegistrasiController controller = new RegistrasiController();
  //final dKecamatan = TextEditingController();

  var _formkey = GlobalKey<FormState>();

  TextEditingController tNamaKec = TextEditingController();
  TextEditingController tWa = TextEditingController();
  TextEditingController tAlamat = TextEditingController();
  TextEditingController tPassword = TextEditingController();
  TextEditingController tKonfirm = TextEditingController();

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
                    // optionsViewBuilder: (BuildContext context,
                    //     void Function(String) onSelected,
                    //     Iterable<String> options) {
                    //   return Material(
                    //     child: SizedBox(
                    //       height: size.height * 0.9,
                    //       child: SingleChildScrollView(
                    //         child: Column(
                    //           children: options.map(
                    //             (opt) {
                    //               return InkWell(
                    //                 onTap: () {
                    //                   onSelected(opt);
                    //                 },
                    //                 child: Container(
                    //                   padding: EdgeInsets.only(right: 75),
                    //                   child: Card(
                    //                     color: grey100,
                    //                     elevation: 2,
                    //                     child: Container(
                    //                       width: double.infinity,
                    //                       padding: EdgeInsets.all(13),
                    //                       child: Text(opt),
                    //                     ),
                    //                   ),
                    //                 ),
                    //               );
                    //             },
                    //           ).toList(),
                    //         ),
                    //       ),
                    //     ),
                    //   );
                    // },
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
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
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
                          elevation: 20,
                        ),
                        onPressed: () {
                          setState(() {
                            if (_formkey.currentState!.validate()) {
                              controller.btRegister(
                                context,
                                tNamaKec.text,
                                tWa.text,
                                tAlamat.text,
                                tPassword.text,
                                tKonfirm.text,
                              );
                              print(tNamaKec);
                              print(tWa);
                              print(tAlamat);
                              print(tPassword);
                              print(tKonfirm);
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
                              "Daftar dengan WhatsApp",
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
