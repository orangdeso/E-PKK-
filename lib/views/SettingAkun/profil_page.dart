import 'package:e_pkk/utils/constants.dart';
import 'package:flutter/material.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profil Saya",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: ktextColor,
      ),
      backgroundColor: grey100,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              color: grey800,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              ),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      width: 5,
                      color: whiteColor,
                    ),
                    color: whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: grey100,
                        blurRadius: 20,
                        offset: const Offset(5, 5),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    "assets/icons/user512.png",
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
