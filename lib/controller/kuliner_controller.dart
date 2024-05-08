import 'dart:convert';
import 'dart:io';

import 'package:exercise2/model/kontak.dart';
import 'package:exercise2/model/kuliner.dart';
import 'package:exercise2/service/kuliner_service.dart';


class KulinerController {
  final kulinerService = KulinerService();

  Future<Map<String, dynamic>> addKuliner(Kuliner person, File? file) async {
    Map<String, String> data = {
      'nama_tempat': person.namatempatkuliner,
      'kisaran_harga': person.kisaranharga,
      'alamat': person.alamat,
      'no_telepon': person.telepon,
    };

    try {
      var response = await kulinerService.addKuliner(data, file);

      if (response.statusCode == 201) {
        return {
          'success': true,
          'message': 'Data berhasil disimpan',
        };
      } else {
        if (response.headers['content-type']!.contains('application/json')) {
          var decodedJson = jsonDecode(response.body);
          return {
            'success': false,
            'message': decodedJson['message'] ?? 'Terjadi kesalahan',
          };
        }

        var decodedJson = jsonDecode(response.body);
        return {
          'success': false,
          'message':
              decodedJson['message'] ?? 'Terjadi kesalahan saat menyimpan data'
        };
      }
    } catch (e) {
      return {"success": false, "message": 'Terjadi kesalahan: $e'};
    }
  }

  Future<List<Kontak>> getPeople() async {
    try {
      List<dynamic> peopleData = await kontakService.fetchPeople();
      List<Kontak> people =
          peopleData.map((json) => Kontak.fromMap(json)).toList();
      return people;
    } catch (e) {
      print(e);
      throw Exception('Failed to get people');
    }
  }
}
