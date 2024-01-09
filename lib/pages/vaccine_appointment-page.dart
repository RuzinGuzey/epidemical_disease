import 'package:epidemical_disease/logic/vaccines_services.dart';
import 'package:epidemical_disease/models/vaccines.dart';
import 'package:flutter/material.dart';

class AddVaccinePage extends StatefulWidget {
  @override
  _AddVaccinePageState createState() => _AddVaccinePageState();
}

class _AddVaccinePageState extends State<AddVaccinePage> {
  final TextEditingController medicalCenterIdController =
      TextEditingController();
  final TextEditingController vaccineTypeIdController = TextEditingController();
  final TextEditingController personIdController = TextEditingController();
  final TextEditingController appointmentDateController =
      TextEditingController();
  final TextEditingController vaccineDateController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  DateTime selectedDate = DateTime.now(); // Varsayılan olarak şu anki tarih

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        appointmentDateController.text =
            "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  Future<void> addVaccine() async {
    try {
      await VaccinesService.createVaccine(Vaccines(
        medicalCenterId: int.parse(medicalCenterIdController.text),
        vaccineTypeId: int.parse(vaccineTypeIdController.text),
        personId: int.parse(personIdController.text),
        appointmentDate: appointmentDateController.text,
      ));

      // Kayıt başarılı bir şekilde gerçekleştiğinde ikaz göster
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Başarılı'),
            content: Text('Randevu Kaydınız Yapılmıştır.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Tamam'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      // Hata durumunda ikaz göster
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Hata'),
            content: Text('Randevu Kaydı Başarısız! Hata: $e'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Tamam'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aşı Randevusu', style: TextStyle(color: Colors.black)),
        backgroundColor: Color.fromARGB(150, 0, 255, 200),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: medicalCenterIdController,
              decoration: InputDecoration(
                  labelText: 'Aşı Olmak İstediğiniz Hastane Numarası'),
            ),
            TextField(
              controller: vaccineTypeIdController,
              decoration: InputDecoration(
                  labelText: 'Olmak İstediğiniz Aşı Tipi Numarası '),
            ),
            TextField(
              controller: personIdController,
              decoration: InputDecoration(labelText: 'Sistemdeki Numaranız'),
            ),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: TextField(
                  controller: appointmentDateController,
                  decoration: InputDecoration(labelText: 'Randevu Günü'),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: Text(
                '** İşlem yaparken lütfen sistemdeki size ait numaranızı kullanınız. Hastane numaralarını Hastane listesi butonuna basarak öğrenebilirsiniz ',
                style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: Text(
                '**Seçim yapacağınız aşıların sistem numaraları; A Tipi: 10, B Tipi: 11, C Tipi: 12 ',
                style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                addVaccine();
              },
              child: Text('Randevu Al'),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(150, 0, 255, 200),
                onPrimary: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
