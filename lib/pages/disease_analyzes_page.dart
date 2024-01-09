import 'package:epidemical_disease/logic/disease_analyzes_services.dart';
import 'package:epidemical_disease/models/disease_analyse.dart';
import 'package:flutter/material.dart';


class DiseaseAnalyzesPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hastalık Analizleri',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromARGB(108, 0, 225, 255),
      ),
      body: FutureBuilder<List<DiseaseAnalyzes>>(
        future: DiseaseAnalyzesApi.fetchDiseaseAnalyzes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<DiseaseAnalyzes> analyzes = snapshot.data!;

            return ListView.builder(
              itemCount: analyzes.length,
              itemBuilder: (context, index) {
                DiseaseAnalyzes analyze = analyzes[index];

                return ListTile(
                  title: Text(
                      'Kişi Numarası : ${analyze.personId}, Hastane Numarası : ${analyze.medicalCenterId}'),
                  subtitle: Text(
                      'Test Sonucu : ${analyze.analysisResult}, Test Tarihi: ${analyze.analysisAppointment.toString()}'),
                  onTap: () {},
                );
              },
            );
          }
        },
      ),
    );
  }
}
