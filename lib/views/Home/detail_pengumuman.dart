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
        title: Text(
          "Detail Pengumuman",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: ktextColor,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
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
                            color: Colors.grey.shade800,
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
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.calendar_month_outlined,
                                    color: ktextColor,
                                    size: 24,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      '${listData[index].tanggalPengumuman}',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: ktextColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.place_outlined,
                                    size: 24,
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
                                          color: ktextColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.grey.shade200,
                          width: 1.2,
                        ),
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
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade800,
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
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey.shade700,
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
