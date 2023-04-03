import 'package:e_pkk/Screens/Login/login_screen.dart';
import 'package:e_pkk/Screens/Registrasi/components/atau_divider.dart';
import 'package:e_pkk/Screens/Registrasi/components/background.dart';
import 'package:e_pkk/components/rounded_input_field.dart';
import 'package:e_pkk/components/rounded_password_field.dart';
import 'package:e_pkk/components/rounded_whatsapp_field.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Body extends StatefulWidget {
  final Widget child;

  const Body({super.key, required this.child});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  //Body({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
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
                  "Nama Anda",
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
                //controller: nama_anda,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'nama tidak boleh kosong';
                  }
                },
                decoration: InputDecoration(
                  hintText: "Muhammad Al-Kahfi",
                  hintStyle: TextStyle(
                    color: grey400,
                    fontSize: 15,
                  ),
                  icon: Icon(
                    Icons.person,
                    color: ktextColor,
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
            // RoundedWhatsAppField(
            //   onChanged: (value) {},
            // ),
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
                  //controller: no_whatsapp,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'No Whatsapp tidak boleh kosong';
                    } else if (value.length < 12) {
                      return 'minimal 12 digit nomor';
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
                      color: ktextColor,
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
                //controller: password,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'password tidak boleh kosong';
                  } else if (value.length < 6) {
                    return 'password minimal 6 karakter';
                  }
                },
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Masukkan password",
                  hintStyle: TextStyle(
                    color: grey400,
                    fontSize: 15,
                  ),
                  icon: Icon(
                    Icons.lock,
                    color: ktextColor,
                  ),
                  suffixIcon: Icon(
                    Icons.visibility_off,
                    color: ktextColor,
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
                //controller: password,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'password tidak boleh kosong';
                  } else if (value.length < 6) {
                    return 'password minimal 6 karakter';
                  }
                },
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Masukkan password",
                  hintStyle: TextStyle(
                    color: grey400,
                    fontSize: 15,
                  ),
                  icon: Icon(
                    Icons.lock,
                    color: ktextColor,
                  ),
                  suffixIcon: Icon(
                    Icons.visibility_off,
                    color: ktextColor,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            // RoundedPasswordField(
            //   hintText: "Konfirmasi password",
            //   onChanged: (value) {},
            // ),
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
                    onPressed: () {},
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
    );
  }
}
