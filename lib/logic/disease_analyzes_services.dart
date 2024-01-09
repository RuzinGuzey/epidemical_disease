import 'dart:convert';
import 'package:epidemical_disease/models/disease_analyse.dart';
import 'package:http/http.dart' as http;

class DiseaseAnalyzesApi {
  static const String baseUrl = 'https://10.0.2.2:7020/api/DiseaseAnalyzes';

  // GET isteği yapmak için
  static Future<List<DiseaseAnalyzes>> fetchDiseaseAnalyzes() async {
    final response = await http.get(
      Uri.parse(baseUrl),
    );
    //headers: {'Accept': '*/*'});
    print(response);
    if (response.statusCode == 200) {
      // Başarılı cevap alındığında 
      Iterable jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((analyze) => DiseaseAnalyzes.fromJson(analyze))
          .toList();
    } else {
      // Başarısız cevap alındığında 
      throw Exception('Hastalık analizleri yüklenemedi');
    }
  }

  // POST isteği yapmak için
  static Future<DiseaseAnalyzes> createDiseaseAnalyzes(
      DiseaseAnalyzes analyze) async {
    final response = await http.post(
      Uri.parse('$baseUrl/diseaseAnalyzes'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(analyze.toJson()),
    );

    if (response.statusCode == 201) {
      // Başarılı cevap alındığında 
      return DiseaseAnalyzes.fromJson(json.decode(response.body));
    } else {
      // Başarısız cevap alındığında 
      throw Exception('Hastalık analizleri oluşturulamadı');
    }
  }

  static Future<DiseaseAnalyzes> getDiseaseAnalyzesById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));

    if (response.statusCode == 200) {
      // Başarılı cevap alındığında 
      return DiseaseAnalyzes.fromJson(json.decode(response.body));
    } else {
      // Başarısız cevap alındığında 
      throw Exception('Kimliğe göre hastalık analizi yüklenemedi');
    }
  }

  // DELETE isteği yapmak için
  static Future<void> deleteDiseaseAnalyzes(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));

    if (response.statusCode != 204) {
      // Başarısız cevap alındığında 
      throw Exception('Hastalık analizi silinemedi');
    }
  }

  // PUSH (UPDATE) isteği yapmak için
  static Future<DiseaseAnalyzes> updateDiseaseAnalyzes(
      DiseaseAnalyzes analyze) async {
    final response = await http.put(
      Uri.parse(
          '$baseUrl/diseaseAnalyzes/,'), 
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(analyze.toJson()),
    );

    if (response.statusCode == 200) {
      // Başarılı cevap alındığında 
      return DiseaseAnalyzes.fromJson(json.decode(response.body));
    } else {
      // Başarısız cevap alındığında 
      throw Exception('Hastalık analizi güncellenemedi');
    }
  }
}
