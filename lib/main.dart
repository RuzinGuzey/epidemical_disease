import 'dart:io';

import 'package:epidemical_disease/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
   HttpOverrides.global = MyHttpOverrides();
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //var themeData = ThemeData();
    return MaterialApp(
      title: 'Your App Title',
      
      home: HomePage(),
    );
  }
}

 class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}