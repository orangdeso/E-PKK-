// ignore_for_file: unused_field

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_pkk/views/Home/detail_pengumuman.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import '../../models/PengumumanModel.dart';

class PengumumanPage extends StatefulWidget {
  const PengumumanPage({super.key});

  @override
  State<PengumumanPage> createState() => _PengumumanPageState();
}

class _PengumumanPageState extends State<PengumumanPage> {
  int _current = 0;
  List<DataVB> myData = [];

  void tampilkanData() async {
    PengumumanModel.tampilPengumuman(context).then((value) {
      myData = value.data!;
      setState(() {});
    });
  }

  var isLoading = true;

  void loadTampilan() {
    setState(() {
      Future.delayed(Duration(seconds: 3), () {
        setState(() {
          isLoading = false;
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    tampilkanData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pengumuman",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: BackButton(
          color: Colors.white,
        ),
        backgroundColor: ktextColor,
        centerTitle: true,
      ),
      backgroundColor: grey100,
      body: ConditionalBuilder(
        condition: myData.isNotEmpty,
        fallback: (context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 5,
                ),
                Lottie.asset(
                  "assets/lottie/no_data.json",
                  height: 140,
                  width: 140,
                ),
                Text(
                  'Tidak ada pengumuman',
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
        },
        builder: (context) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 16,
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: myData.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 8,
                      ),
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
                                  id: myData[index].id.toString(),
                                );
                              },
                            ),
                          );
                        },
                        leading: Text(
                          '${myData[index].tanggalPengumuman}',
                          style: TextStyle(
                            fontSize: 15,
                            color: ktextColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        title: Text(
                          '${myData[index].judulPengumuman}',
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
                                '${myData[index].tempatPengumuman}',
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
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
