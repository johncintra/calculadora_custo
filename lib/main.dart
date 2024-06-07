import 'package:calculator_custe/MaterialCalculator.dart';
import 'package:flutter/material.dart';

void main() => runApp(CrochetCalculatorApp());

class CrochetCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     title: 'Calculadora de Crochê',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.purple,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple, // background (button) color
            foregroundColor: Colors.white, // foreground (text) color
          ),
        ),
      ),
      home: MaterialCalculator(),
    );
  }
}

