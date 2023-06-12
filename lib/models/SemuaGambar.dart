import 'dart:convert';
import 'package:http/http.dart' as http;

import '../helpers/ApiHelper.dart';

class GetLinkGambar {
  final String? urlGambar;

  GetLinkGambar({required this.urlGambar});
  factory GetLinkGambar.fromjson(Map<String, dynamic> json) {
    return GetLinkGambar(urlGambar: json['gambar']);
  }
}

Future<List<GetLinkGambar>> fetchGambar({String? idGalery}) async {
  final response = await http.post(Uri.parse(ApiHelper.url + 'getAllFoto.php'),
      body: {"id": idGalery});

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body)['data'];
    print(data);
    List<GetLinkGambar> gambarrList = [];
    for (var i = 0; i < data.length; i++) {
      gambarrList.add(GetLinkGambar.fromjson(data[i]));
    }
    return gambarrList;
  } else {
    throw Exception('Failed boolo');
  }
}
