import 'package:e_pkk/utils/constants.dart';
import 'package:flutter/material.dart';

class NotifikasiPage extends StatefulWidget {
  const NotifikasiPage({super.key});

  @override
  State<NotifikasiPage> createState() => _NotifikasiPageState();
}

class _NotifikasiPageState extends State<NotifikasiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifikasi"),
        backgroundColor: ktextColor,
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "Notifikasi OMW",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
