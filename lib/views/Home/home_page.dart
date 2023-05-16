import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_pkk/helpers/ApiHelper.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:e_pkk/views/Home/notifikasi_page.dart';
import 'package:e_pkk/views/Home/pengumuman_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  //bool no_whatsapp = false;

  final List<Widget> imgList = [
    Container(
      width: 400,
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Image.asset(
        "assets/images/Banner1.png",
        fit: BoxFit.cover,
      ),
    ),
    Container(
      width: 400,
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Image.asset(
        "assets/images/po.png",
        fit: BoxFit.cover,
      ),
    ),
  ];

  //Pengumuman Data
  List<dynamic> _pengumumanList = [];

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse(ApiHelper.url + "getPengumuman.php"));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      setState(() {
        _pengumumanList = jsonData['data'];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  String nowa = '';

  void _initCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {});
    nowa = prefs.getString('no_whatsapp') ?? '';
    // if (prefs.getString('no_whatsapp') ?? '') {
    //   setState(() {
    //     no_whatsapp = prefs.getBool('no_whatsapp')!;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey100,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            decoration: BoxDecoration(
              color: ktextColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: ListTile(
              title: Text(
                "Mohammad Al - Kahfi",
                style: TextStyle(
                  //fontFamily: "Inter",
                  color: whiteColor,
                ),
              ),
              subtitle: Text(
                "Kediri",
                style: TextStyle(
                  color: whiteColor,
                ),
              ),
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/icons/user64.png"),
              ),
              trailing: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return NotifikasiPage();
                      },
                    ),
                  );
                },
                icon: Icon(Icons.notifications),
                iconSize: 32,
                color: whiteColor,
                padding: EdgeInsets.all(8.0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
            child: Expanded(
              child: CarouselSlider(
                items: imgList,
                carouselController: _controller,
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(
                      () {
                        _current = index;
                      },
                    );
                  },
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : blueLight600)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4),
                  ),
                ),
              );
            }).toList(),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 40,
              left: 10,
              right: 10,
            ),
            decoration: BoxDecoration(
              color: Color(0xFFEDF6FF),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              leading: Image.asset(
                "assets/images/po.png",
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              title: Text("Upload Laporan"),
              subtitle: Text("Upload Laporan dengan mudah"),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.keyboard_arrow_right_outlined),
                iconSize: 32,
                padding: EdgeInsets.all(8.0),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 15,
              left: 10,
              right: 10,
            ),
            decoration: BoxDecoration(
              color: Color(0xFF25BFFA).withOpacity(0.4),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              leading: Image.asset(
                "assets/images/po.png",
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              title: Text("Upload Galeri"),
              subtitle: Text("Upload Galeri dengan mudah"),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.keyboard_arrow_right_outlined),
                iconSize: 32,
                padding: EdgeInsets.all(8.0),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 40,
                  left: 10,
                ),
                child: Text(
                  "Pengumuman",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 40,
                  right: 10,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return PengumumanPage();
                        },
                      ),
                    );
                  },
                  child: Text(
                    "Lihat semua",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: grey300,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 5), // changes position of shadow
                  ),
                ],
              ),
              child: ListTile(
                leading: Text(
                  "10-11-2023",
                  // _pengumumanList[index]['tanggalPengumuman'] ??
                  //     'No Tanggal',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                title: Text(
                  "Program Kesehatan Imunisasi per desa di Kantor Balai Desa",
                  // _pengumumanList[index]['judulPengumuman'] ??
                  //     'No Title',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
