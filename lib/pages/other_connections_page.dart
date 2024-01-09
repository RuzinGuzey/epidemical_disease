import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OtherConnections extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diğer Bağlantılar', style: TextStyle(color: Colors.black),),
        backgroundColor: Color.fromARGB(71, 0, 238, 255),
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _launchURL('https://saglik.gov.tr/');
              },
              child: Text('Sağlık Bakanlığı'),
              style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(71, 0, 238, 255),
                      onPrimary: Colors.black,
                    ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _launchURL('https://enabiz.gov.tr/');
              },
              child: Text('E-Nabız'),
              style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(71, 0, 238, 255),
                      onPrimary: Colors.black,
                    ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _launchURL('https://hastanerandevu.gov.tr/');
              },
              child: Text('MHRS Uygulaması'),
              style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(71, 0, 238, 255),
                      onPrimary: Colors.black,
                    ),
            ),
          ],
        ),
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
