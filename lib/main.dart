import 'package:ellieproyecto/Screens/MainScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // opcional: oculta la etiqueta "debug"
      home: MainScreen(), // 👈 Aquí llamas directamente a tu pantalla
    );
  }
}
