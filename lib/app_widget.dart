import 'package:flutter/material.dart';
import 'package:pwon_calculadora_solar/informacoes_page.dart';

import 'home_page.dart';

class AppWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.yellow, brightness: Brightness.dark),
      home: informacoesPage(),
    );
  }
}