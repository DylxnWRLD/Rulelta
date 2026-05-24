import 'package:flutter/material.dart';
import 'screens/PantallaSeleccion.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ruletita',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF00C853),
      ),
      home: const PantallaSeleccion(), 
    );
  }
}