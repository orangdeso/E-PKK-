import 'package:e_pkk/views/LupaPassword/lupa_password_screen.dart';
import 'package:e_pkk/views/Welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:e_pkk/utils/constants.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'e_pkk',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: lupaPassword(),
      // routes: {
      //   'lupa_password_screen': (context) => const lupaPassword(),
      //   'welcome_screen': (context) => const WelcomeScreen(),
      // },
    );
  }
}
