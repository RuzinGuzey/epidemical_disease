import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddDiseaseAnalysisPage extends StatefulWidget {
  @override
  _AddDiseaseAnalysisPageState createState() => _AddDiseaseAnalysisPageState();
}

class _AddDiseaseAnalysisPageState extends State<AddDiseaseAnalysisPage> {
  final TextEditingController medicalCenterIdController = TextEditingController();
  final TextEditingController personIdController = TextEditingController();
  final TextEditingController analysisAppointmentController = TextEditingController();
  final TextEditingController analysisDateController = TextEditingController();
  final TextEditingController analysisResultController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  Future<void> addDiseaseAnalysis() async {
    final response = await http.post(
      Uri.parse('https://10.0.2.2:7020/api/DiseaseAnalyzes'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'medicalCenterId': int.parse(medicalCenterIdController.text),
        'personId': int.parse(personIdController.text),
        'analysisAppointment': analysisAppointmentController.text,
        
      }),
    );

    if (response.statusCode == 201) {
      
      print('Analiz başarıyla eklendi!');
    } else {
    
      print('Analiz eklenirken bir hata oluştu. ${response.reasonPhrase}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Analiz Randevusu Alma', style: TextStyle(color: Colors.black),),
        backgroundColor: Color.fromARGB(136, 0, 255, 85),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: medicalCenterIdController,
              decoration: InputDecoration(labelText: 'Hastane ID'),
            ),
            TextField(
              controller: personIdController,
              decoration: InputDecoration(labelText: 'Kullanıcı ID'),
            ),
            TextField(
              controller: analysisAppointmentController,
              decoration: InputDecoration(labelText: 'Analiz Randevusu'),
            ),
            SizedBox(height: 60),
            Container(
              child: Text(
                '** İşlem yaparken lütfen sistemdeki size ait numaranızı kullanınız. Hastane numaralarını Hastane listesi butonuna basarak öğrenebilirsiniz ',
                style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
              ),
            ),
            
            SizedBox(height: 60),
            ElevatedButton(
              onPressed: () {
                addDiseaseAnalysis();
              },
              child: Text('Randevu Al'),
              style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(136, 0, 255, 85),
                      onPrimary: Colors.black,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

