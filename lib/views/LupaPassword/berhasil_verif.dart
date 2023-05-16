import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BerhasilVerif extends StatefulWidget {
  const BerhasilVerif({super.key});

  @override
  State<BerhasilVerif> createState() => _BerhasilVerifState();
}

class _BerhasilVerifState extends State<BerhasilVerif> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Lottie.asset("assets/lottie/success.json"),
            Text("Anda berhasil mengubah password"),
          ],
        ),
      ),
    );
  }
}
