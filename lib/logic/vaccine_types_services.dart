import 'dart:convert';
import 'package:epidemical_disease/models/vaccine_types.dart';
import 'package:http/http.dart' as http;

class VaccineTypesService {
  static const String baseUrl = 'https://10.0.2.2:7020/api/VaccineTypes';

  // GET: 
  static Future<List<VaccineTypes>> fetchAllVaccineTypes() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      Iterable jsonResponse = json.decode(response.body);
      return jsonResponse.map((vaccineType) => VaccineTypes.fromJson(vaccineType)).toList();
    } else {
      throw Exception('Aşı tipi yüklenemedi');
    }
  }

  // GET: Belirli bir aşı türünü id'ye göre getir
  static Future<VaccineTypes> fetchVaccineTypeById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));

    if (response.statusCode == 200) {
      return VaccineTypes.fromJson(json.decode(response.body));
    } else {
      throw Exception('Aşı tipini ID göre getirilemedi');
    }
  }

  // POST: Yeni bir aşı türü ekle
  static Future<VaccineTypes> createVaccineType(VaccineTypes vaccineType) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(vaccineType.toJson()),
    );

    if (response.statusCode == 201) {
      return VaccineTypes.fromJson(json.decode(response.body));
    } else {
      throw Exception('Aşı Tipi Oluşturulamadı');
    }
  }

  // PUT: Belirli bir aşı türünü güncelle
  static Future<VaccineTypes> updateVaccineType(VaccineTypes vaccineType) async {
    final response = await http.put(
      Uri.parse('$baseUrl/${vaccineType.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(vaccineType.toJson()),
    );

    if (response.statusCode == 200) {
      return VaccineTypes.fromJson(json.decode(response.body));
    } else {
      throw Exception('Aşı Tipini güncellenemedi');
    }
  }

  // DELETE: Belirli bir aşı türünü sil
  static Future<void> deleteVaccineType(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));

    if (response.statusCode != 204) {
      throw Exception('Aşı tipi silinemedi');
    }
  }
}
