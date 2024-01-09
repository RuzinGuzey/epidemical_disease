import 'dart:convert';
import 'package:epidemical_disease/models/persons.dart';
import 'package:http/http.dart' as http;

class PersonsService {
  static const String baseUrl = 'https://10.0.2.2:7020/api/Persons';

  // GET: Tüm kişileri getir
  static Future<List<Persons>> fetchAllPersons() async {
    final response = await http.get(Uri.parse(baseUrl));


    if (response.statusCode == 200) {
      Iterable jsonResponse = json.decode(response.body);
      return jsonResponse.map((person) => Persons.fromJson(person)).toList();
    } else {
      throw Exception('Kişi bilgisi yüklenemedi');
    }
  }

  // GET: Belirli bir kişiyi id'ye göre 
  static Future<Persons> fetchPersonById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));

    if (response.statusCode == 200) {
      return Persons.fromJson(json.decode(response.body));
    } else {
      throw Exception('Kişi kimliğe göre yüklenemedi');
    }
  }

  // POST: Yeni bir kişi ekle
  static Future<Persons> createPerson(Persons person) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(person.toJson()),
    );

    if (response.statusCode == 201) {
      return Persons.fromJson(json.decode(response.body));
    } else {
      throw Exception('Kişi oluşturulamadı');
    }
  }

  // PUT: Belirli bir kişiyi güncelle
  static Future<Persons> updatePerson(Persons person) async {
    final response = await http.put(
      Uri.parse('$baseUrl/${person.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(person.toJson()),
    );

    if (response.statusCode == 200) {
      return Persons.fromJson(json.decode(response.body));
    } else {
      throw Exception('Kişi bilgisi güncellenemedi');
    }
  }

  // DELETE: Belirli bir kişiyi sil
  static Future<void> deletePerson(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));

    if (response.statusCode != 204) {
      throw Exception('Kişi şilinemedi');
    }
  }
}
