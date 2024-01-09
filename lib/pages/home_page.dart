import 'package:epidemical_disease/pages/analysis_appointment_page.dart';
import 'package:epidemical_disease/pages/disease_analyzes_page.dart';
import 'package:epidemical_disease/pages/medical_centers_page.dart';
import 'package:epidemical_disease/pages/other_connections_page.dart';
import 'package:epidemical_disease/pages/vaccine_appointment-page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Center(
          child: Text("Salgın Hastalık Takip/Kontrol",  
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),)),
        
        backgroundColor: Color.fromARGB(104, 0, 221, 111)
        
      ),
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DiseaseAnalyzesPage(),
                        ),
                      );
                    },
                    
                    icon: Image.asset('assets/analysis.png', width: 24, height: 24),
                    label: Text('Hastalık Analizleri'),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(108, 0, 225, 255),
                      onPrimary: Colors.black,
                    ),
                    
                  
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MedicalCentersPage(),
                        ),
                      );
                    },
                    icon: Image.asset('assets/hospital.png', width: 24, height: 24),
                    label: Text('Hastane Listesi'),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(136, 0, 255, 128),
                      onPrimary: Colors.black,
                    ),
                    
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddDiseaseAnalysisPage(),
                        ),
                      );
                    },
                    icon: Image.asset('assets/calendar.png', width: 24, height: 24),
                    label: Text('Analiz Randevusu Al'),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(136, 0, 255, 85),
                      onPrimary: Colors.black,
                    ),
                    
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddVaccinePage(),
                        ),
                      );
                    },
                    icon: Image.asset('assets/allergy.png', width: 24, height: 24),
                    label: Text('Aşı Randevusu Al'),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(150, 0, 255, 200),
                      onPrimary: Colors.black,
                    ),
                    
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtherConnections(),
                        ),
                      );
                    },
                    icon: Image.asset('assets/browser.png', width: 24, height: 24),
                    label: Text('Diğer Bağlantılar'),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(71, 0, 238, 255),
                      onPrimary: Colors.black,
                    ),
                    
                  ),
                ),
                
              ],
            )
          ],
        ),
      ),
    );
  }
}


