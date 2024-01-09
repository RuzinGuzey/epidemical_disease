import 'dart:convert';
import 'package:epidemical_disease/models/vaccines.dart';
import 'package:http/http.dart' as http;

class VaccinesService {
  static const String baseUrl = 'https://10.0.2.2:7020/api/Vaccines';

  // GET: 
  static Future<List<Vaccines>> fetchAllVaccines() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      Iterable jsonResponse = json.decode(response.body);
      return jsonResponse.map((vaccine) => Vaccines.fromJson(vaccine)).toList();
    } else {
      throw Exception('Aşılar yüklenemedi');
    }
  }

  // GET By ID: 
  static Future<Vaccines> fetchVaccineById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));

    if (response.statusCode == 200) {
      return Vaccines.fromJson(json.decode(response.body));
    } else {
      throw Exception('Kimliğe göre aşı yüklenemedi');
    }
  }

  // POST: 
  static Future<Vaccines> createVaccine(Vaccines vaccine) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(vaccine.toJson()),
    );

    if (response.statusCode == 201) {
      return Vaccines.fromJson(json.decode(response.body));
    } else {
      throw Exception('Aşı oluşturulamadı');
    }
  }

  // PUT: Belirli bir aşıyı güncelle
  static Future<Vaccines> updateVaccine(Vaccines vaccine) async {
    final response = await http.put(
      Uri.parse('$baseUrl/${vaccine.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(vaccine.toJson()),
    );

    if (response.statusCode == 200) {
      return Vaccines.fromJson(json.decode(response.body));
    } else {
      throw Exception('Aşı güncellenemedi');
    }
  }

  // DELETE: Belirli bir aşıyı sil
  static Future<void> deleteVaccine(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));

    if (response.statusCode != 204) {
      throw Exception('Aşı silinemedi');
    }
  }
}
