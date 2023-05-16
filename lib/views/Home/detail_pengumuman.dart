import 'package:e_pkk/utils/constants.dart';
import 'package:flutter/material.dart';

class DetailPengumumanPage extends StatefulWidget {
  const DetailPengumumanPage({super.key});

  @override
  State<DetailPengumumanPage> createState() => _DetailPengumumanPageState();
}

class _DetailPengumumanPageState extends State<DetailPengumumanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Pengumuman"),
        centerTitle: true,
        backgroundColor: ktextColor,
      ),
    );
  }
}