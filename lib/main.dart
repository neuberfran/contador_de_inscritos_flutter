import 'package:flutter/material.dart';
import 'package:contador_de_inscritos_flutter/ui/splashscreen_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador de Inscritos - lapadev',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        dividerColor: Colors.blueAccent
      ),
      home: SplashScreenPage(),
    );
  }
}