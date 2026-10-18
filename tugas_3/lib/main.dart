import 'package:flutter/material.dart';
import 'package:tugas_3/KalkulatorBMIScreen.dart';

void main() {
  runApp(const KalkulatorBMI());
}

class KalkulatorBMI extends StatelessWidget {
  const KalkulatorBMI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkulator BMI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0D47A1)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const BMIScreen(),
    );
  }
}