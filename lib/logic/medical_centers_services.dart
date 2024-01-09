import 'dart:convert';

import 'package:epidemical_disease/models/medical_centers.dart';
import 'package:http/http.dart' as http;

class MedicalCentersApi {
  static const String baseUrl = 'https://10.0.2.2:7020/api/MedicalCenters'; 

  // GET isteği 
  static Future<List<MedicalCenters>> fetchMedicalCenters() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      // Başarılı cevap alındığında
      Iterable jsonResponse = json.decode(response.body);
      return jsonResponse.map((center) => MedicalCenters.fromJson(center)).toList();
    } else {
      // Başarısız cevap alındığında 
      throw Exception('Hastaneler Yüklenemedi');
    }
  }

  // GET (by ID) isteği yapmak için
  static Future<MedicalCenters> getMedicalCenterById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));

    if (response.statusCode == 200) {
      // Başarılı cevap alındığında 
      return MedicalCenters.fromJson(json.decode(response.body));
    } else {
      // Başarısız cevap alındığında 
      throw Exception('HAstaneler ID göre yüklenemedi');
    }
  }

  // POST isteği yapmak için
  static Future<MedicalCenters> createMedicalCenter(MedicalCenters center) async {
    final response = await http.post(
      Uri.parse('$baseUrl'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(center.toJson()),
    );

    if (response.statusCode == 201) {
      // Başarılı cevap alındığında 
      return MedicalCenters.fromJson(json.decode(response.body));
    } else {
      // Başarısız cevap alındığında 
      throw Exception('Hastane bilgisi oluşturulamadı');
    }
  }

  // PUT (UPDATE) isteği yapmak için
  static Future<MedicalCenters> updateMedicalCenter(MedicalCenters center) async {
    final response = await http.put(
      Uri.parse('$baseUrl/${center.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(center.toJson()),
    );

    if (response.statusCode == 200) {
      // Başarılı cevap alındığında 
      return MedicalCenters.fromJson(json.decode(response.body));
    } else {
      // Başarısız cevap alındığında 
      throw Exception('Hastane bilgisi güncellenemedi');
    }
  }

  // DELETE isteği yapmak için
  static Future<void> deleteMedicalCenter(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));

    if (response.statusCode != 204) {
      // Başarısız cevap alındığında 
      throw Exception('Hastane bilgisi');
    }
  }
}
