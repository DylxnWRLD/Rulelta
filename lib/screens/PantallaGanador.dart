import 'package:flutter/material.dart';
import 'dart:math';

class PantallaGanador extends StatefulWidget {
  final String winner;
  final List<String> allOptions;

  // El constructor recibe el ganador seleccionado y la lista completa de opciones
  const PantallaGanador({
    super.key, 
    required this.winner, 
    required this.allOptions
  });

  @override
  State<PantallaGanador> createState() => _PantallaGanadorState();
}

class _PantallaGanadorState extends State<PantallaGanador> {
  late String currentWinner;

  @override
  void initState() {
    super.initState();
    currentWinner = widget.winner;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00C853),
      body: SafeArea(
        child: Column(
          children: [
            // --- 1. ENCABEZADO (Flecha y Título) ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 28),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Expanded(
                    child: Text(
                      'RULETITA',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48), 
                ],
              ),
            ),

            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '¡Tenemos un ganador!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 24),

                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(32.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFFD9D9D9), // Gris claro del boceto
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.black, width: 1.5),
                        ),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.emoji_events_outlined, 
                              size: 100, 
                              color: Colors.amber
                            ),
                            const SizedBox(height: 20),
                            Text(
                              currentWinner.toUpperCase(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),

                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              final random = Random();
                              currentWinner = widget.allOptions[random.nextInt(widget.allOptions.length)];
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF00C853),
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: const BorderSide(color: Colors.black, width: 2),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            'Girar de nuevo',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context); 
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFA6A6A6),
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: const BorderSide(color: Colors.black, width: 2),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            'Volver a configuración',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}