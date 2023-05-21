import 'package:e_pkk/utils/constants.dart';
import 'package:flutter/material.dart';

class SyaratKetentuanPage extends StatelessWidget {
  const SyaratKetentuanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Syarat dan Ketentuan"),
        centerTitle: true,
        backgroundColor: ktextColor,
      ),
    );
  }
}
