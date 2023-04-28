import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool no_whatsapp = false;

  void _initCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('no_whatsapp') != null) {
      setState(() {
        no_whatsapp = prefs.getBool('no_whatsapp')!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Home",
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
