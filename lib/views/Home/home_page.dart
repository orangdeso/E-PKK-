import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_pkk/controller/ApiController.dart';
import 'package:e_pkk/models/DataAKun.dart';
import 'package:e_pkk/models/PengumumanModel.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:e_pkk/views/Home/detail_pengumuman.dart';
import 'package:e_pkk/views/Home/pengumuman_page.dart';
import 'package:e_pkk/views/Laporan/Upload%20_Gambar/UploadGaleri.dart';
import 'package:e_pkk/views/Laporan/Upload_Laporan/MenuLaporan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  List<DataVB> ListPengumuman = [];
  String idAkun = '';
  late Future<DataAkun> futureAkun;

  Future<void> getIdAkun() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String idAkunValue = prefs.getString("id_akun") ??
        ''; // Menggunakan operator nullish coalescing untuk menetapkan nilai default jika kunci tidak ada
    setState(() {
      idAkun = idAkunValue;
    });
  }

  final List<Widget> imgList = [
    Container(
      child: Image.asset(
        "assets/images/Banner1.png",
        fit: BoxFit.cover,
      ),
    ),
    Container(
      child: Image.asset(
        "assets/images/Banner2.png",
        fit: BoxFit.cover,
      ),
    ),
    Container(
      child: Image.asset(
        "assets/images/Banner3.png",
        fit: BoxFit.cover,
      ),
    ),
    Container(
      child: Image.asset(
        "assets/images/Banner4.png",
        fit: BoxFit.cover,
      ),
    ),
  ];

  void tampilkanData() async {
    PengumumanModel.tampilPengumuman(context).then((value) {
      ListPengumuman = value.data!;
      setState(() {});
    });
  }

  String greeting = '';

  void setGreeting() {
    var hour = DateTime.now().hour;
    if (hour < 11) {
      setState(() {
        greeting = 'Selamat Pagi, ';
      });
    } else if (hour < 18) {
      setState(() {
        greeting = 'Selamat Siang,';
      });
    } else {
      setState(() {
        greeting = 'Selamat Malam,';
      });
    }
  }

  String tanggalOtomatis = DateFormat('dd MMMM yyyy').format(DateTime.now());

  @override
  void initState() {
    super.initState();
    tampilkanData();
    setGreeting();
    getIdAkun();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    futureAkun = API_CONTROLLER.fetchData(idAkun);
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        backgroundColor: grey100,
        body: ListView(
          shrinkWrap: true,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: BoxDecoration(
                color: ktextColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: FutureBuilder<DataAkun>(
                future: futureAkun,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListTile(
                      title: Row(
                        children: [
                          Text(
                            "${greeting}",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "${snapshot.data!.data!.namaPengguna.toString()}",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     SizedBox(
                          //       height: 5,
                          //     ),
                          //     Text(
                          //       "${greeting} " +
                          //           "${snapshot.data!.data!.namaPengguna.toString()}",
                          //       style: TextStyle(
                          //         fontSize: 20,
                          //         color: whiteColor,
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          //     ),
                          //     SizedBox(
                          //       height: 5,
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_pin,
                              color: Colors.white,
                              size: 16,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              // tanggalOtomatis,
                              "${snapshot.data!.data!.namaKec.toString()}",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 16,
                right: 16,
              ),
              child: Container(
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
              children: imgList.asMap().entries.map(
                (entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 10.0,
                      height: 10.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : blueLight600)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4),
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 40,
                left: 16,
                right: 16,
              ),
              decoration: BoxDecoration(
                color: Color(0xFFEDF6FF),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Color.fromARGB(255, 192, 224, 255),
                  width: 1.2,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      PageLaporanMenu.route.toString(),
                    );
                  },
                  leading: Image.asset(
                    "assets/images/essay.png",
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    "Upload Laporan",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Container(
                    margin: EdgeInsets.only(top: 7),
                    child: Text(
                      "Upload Laporan PKK disini",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        PageLaporanMenu.route.toString(),
                      );
                    },
                    icon: Icon(Icons.keyboard_arrow_right_outlined),
                    iconSize: 24,
                    padding: EdgeInsets.all(8.0),
                    color: grey500,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 15,
                left: 16,
                right: 16,
              ),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 183, 235, 255),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Color.fromARGB(255, 108, 213, 255),
                    width: 1.2,
                  )),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      PageGaleri.route.toString(),
                    );
                  },
                  leading: Image.asset(
                    "assets/images/picture.png",
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    "Upload Galeri",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Container(
                    margin: EdgeInsets.only(top: 7),
                    child: Text(
                      "Upload Galeri kegiatan PKK",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        PageGaleri.route.toString(),
                      );
                    },
                    icon: Icon(Icons.keyboard_arrow_right_outlined),
                    iconSize: 24,
                    padding: EdgeInsets.all(8.0),
                    color: grey500,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 32,
                left: 16,
                right: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pengumuman",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: grey800,
                        ),
                      ),
                      Text(
                        "Daftar pengumuman dari pusat",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: grey500,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
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
                    child: Row(
                      children: [
                        Text(
                          "Lihat Semua",
                          style: TextStyle(
                            fontSize: 14,
                            color: ktextColor,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return PengumumanPage();
                                },
                              ),
                            );
                          },
                          icon: Icon(Icons.keyboard_arrow_right_outlined),
                          iconSize: 24,
                          color: ktextColor,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: ConditionalBuilder(
                condition: ListPengumuman.isNotEmpty,
                fallback: (context) {
                  return Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Lottie.asset(
                          "assets/lottie/no_data.json",
                          height: 100,
                          width: 100,
                        ),
                        Text(
                          'Tidak ada pengumuman',
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  );
                },
                builder: (context) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: ListPengumuman.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.grey.shade200,
                            width: 1.2,
                          ),
                        ),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return DetailPengumumanPage(
                                    id: ListPengumuman[index].id.toString(),
                                  );
                                },
                              ),
                            );
                          },
                          leading: Text(
                            '${ListPengumuman[index].tanggalPengumuman}',
                            style: TextStyle(
                              fontSize: 15,
                              color: ktextColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          title: Text(
                            '${ListPengumuman[index].judulPengumuman}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.location_on_sharp,
                                  size: 14,
                                  color: Colors.grey.shade500,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  '${ListPengumuman[index].tempatPengumuman}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
