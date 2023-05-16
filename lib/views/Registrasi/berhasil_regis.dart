import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BerhasilRegis extends StatefulWidget {
  const BerhasilRegis({super.key});

  @override
  State<BerhasilRegis> createState() => _BerhasilRegisState();
}

class _BerhasilRegisState extends State<BerhasilRegis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Lottie.asset("assets/lottie/success.json"),
            Text("Selamat Anda berhasil mendaftarkan akun di E-PKK"),
          ],
        ),
      ),
    );
  }
}