import 'package:calc_imc/modeus/homeScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.purple),
      title: "Calculadora de Imc",
      home: HomeSreen(),
    );
  }
}
