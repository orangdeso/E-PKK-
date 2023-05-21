import 'package:e_pkk/utils/constants.dart';
import 'package:flutter/material.dart';
import '../../models/PengumumanModel.dart';

class DetailPengumumanPage extends StatefulWidget {
  final String id;

  DetailPengumumanPage({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailPengumumanPage> createState() => _DetailPengumumanPageState();
}

class _DetailPengumumanPageState extends State<DetailPengumumanPage> {
  late String id;
  List<DataVB> listData = [];

  void tampilData() async {
    PengumumanModel.tampilDetail(id).then((value) {
      listData = value.data!;
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    id = widget.id;
    tampilData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Pengumuman"),
        centerTitle: true,
        backgroundColor: ktextColor,
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          ListView.builder(
            shrinkWrap: true,
            itemCount: listData.length,
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Align(
                        alignment: FractionalOffset.topLeft,
                        child: Text(
                          '${listData[index].judulPengumuman}',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.calendar_month_outlined,
                                color: ktextColor,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Align(
                                  alignment: FractionalOffset.topLeft,
                                  child: Text(
                                    '${listData[index].tanggalPengumuman}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Row(
                            children: [
                              Icon(
                                Icons.place_outlined,
                                color: ktextColor,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Align(
                                  alignment: FractionalOffset.topLeft,
                                  child: Text(
                                    '${listData[index].tempatPengumuman}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: grey100,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: grey300,
                          width: 2.0,
                        ),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.grey,
                        //     spreadRadius: 2,
                        //     blurRadius: 2.0,
                        //     offset: Offset(0.0, 1.0),
                        //   ),
                        // ],
                      ),
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Align(
                              alignment: FractionalOffset.topLeft,
                              child: Text(
                                "Deskripsi :",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Align(
                                alignment: FractionalOffset.topLeft,
                                child: Text(
                                  '${listData[index].deskripsiPengumuman}',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
