import 'package:epidemical_disease/logic/medical_centers_services.dart';
import '../models/medical_centers.dart';
import 'package:flutter/material.dart';



class MedicalCentersPage extends StatefulWidget {
  @override
  _MedicalCentersPageState createState() => _MedicalCentersPageState();
}

class _MedicalCentersPageState extends State<MedicalCentersPage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hastaneler', style: TextStyle(color: Colors.black),),
        backgroundColor:  Color.fromARGB(136, 0, 255, 128),
      ),
      body: FutureBuilder<List<MedicalCenters>>(
        future: MedicalCentersApi.fetchMedicalCenters(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            List<MedicalCenters>? medicalCenters = snapshot.data;

            return ListView.builder(
              itemCount: medicalCenters!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${medicalCenters[index].id.toString()},      ${medicalCenters[index].name.toString()}'),
                  subtitle: Text('          ${medicalCenters[index].city}, ${medicalCenters[index].region}'),
                 
                );
              },
            );
          }
        },
      ),
    );
  }
}


