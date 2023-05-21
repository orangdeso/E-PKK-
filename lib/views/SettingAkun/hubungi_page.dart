import 'package:e_pkk/utils/constants.dart';
import 'package:flutter/material.dart';

class HubungiKamiPage extends StatefulWidget {
  const HubungiKamiPage({super.key});

  @override
  State<HubungiKamiPage> createState() => _HubungiKamiPageState();
}

class _HubungiKamiPageState extends State<HubungiKamiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hubungi Kami"),
        centerTitle: true,
        backgroundColor: ktextColor,
      ),
    );
  }
}
