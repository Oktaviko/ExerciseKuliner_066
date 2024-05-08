import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

class KulinerService {
  final String baseUrl = 'https://paml.tatiumy.com/api/';
  final String endPoint = 'people';

  Uri getUri(String path) {
    return Uri.parse("$baseUrl$path");
  }

  Future<http.Response> addKuliner(Map<String, String> data, File? file) async {
    var request = http.MultipartRequest(
      'POST',
      getUri(endPoint),
    )
      ..fields.addAll(data)
      ..headers['Content-Type'] = 'application/json';

    if (file != null) {
      request.files.add(await http.MultipartFile.fromPath('gambar', file.path));
    } else {
      request.files.add(http.MultipartFile.fromString('gambar', ''));
    }

    return await http.Response.fromStream(await request.send());
  }

  //Untuk mengambil data dari API
  Future<List<dynamic>> fetchPeople() async {
    var response = await http.get(
        getUri(
          endPoint,
        ),
        headers: {
          "Accept": "application/json",
        });

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedResponse = json.decode(response.body);
      return decodedResponse['people'];
    } else {
      throw Exception('Failed to load people: ${response.reasonPhrase}');
    }
  }
}
