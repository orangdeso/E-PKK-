import 'package:e_pkk/views/Home/detail_pengumuman.dart';
import 'package:e_pkk/utils/constants.dart';
import 'package:flutter/material.dart';
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
        title: Text("Pengumuman"),
        backgroundColor: ktextColor,
        centerTitle: true,
      ),
      backgroundColor: grey100,
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: myData.length,
            itemBuilder: (context, index) {
              return Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: grey100,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 2,
                          blurRadius: 3.0,
                          offset: Offset(0.0, 1.0),
                        ),
                      ],
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
                        print(myData[index].id.toString());
                      },
                      leading: Text(
                        '${myData[index].tanggalPengumuman}',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      title: Text(
                        '${myData[index].judulPengumuman}',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
