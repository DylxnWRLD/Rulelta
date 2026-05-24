import 'package:flutter/material.dart';
import 'PantallaGanador.dart'; 
import 'dart:math'; 

class PantallaSeleccion extends StatefulWidget {
  const PantallaSeleccion({super.key});

  @override
  State<PantallaSeleccion> createState() => _PantallaSeleccionState();
}

class _PantallaSeleccionState extends State<PantallaSeleccion> {
  List<String> options = [];
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00C853), 
      body: SafeArea(
        child: Column(
          children: [
            // --- 1. ENCABEZADO (Flecha de atrás y Título) ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 28),
                    onPressed: () {
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

            // --- 2. TARJETA BLANCA REDONDEADA (Cubre el resto de la pantalla) ---
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Configura tu ruleta',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // --- 3. INPUT TEXT Y BOTÓN "AÑADIR" ---
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: Colors.black, width: 1),
                              ),
                              child: TextField(
                                controller: _controller,
                                decoration: const InputDecoration(
                                  hintText: 'Escribe una opción...',
                                  hintStyle: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
                                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          ElevatedButton(
                            onPressed: () {
                              if (_controller.text.trim().isNotEmpty) {
                                setState(() {
                                  options.add(_controller.text.trim());
                                  _controller.clear();
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF00C853),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                                side: const BorderSide(color: Colors.black, width: 1),
                              ),
                              elevation: 0,
                            ),
                            child: const Text('Añadir', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // --- 4. LISTA DINÁMICA DE OPCIONES ---
                      Expanded(
                        child: options.isEmpty
                            ? Center(
                                child: Text(
                                  'Aún no hay opciones. ¡Agrega algunas!',
                                  style: TextStyle(color: Colors.grey[600], fontStyle: FontStyle.italic),
                                ),
                              )
                            : ListView.builder(
                                itemCount: options.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 12.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(30),
                                              border: Border.all(color: Colors.black, width: 1.5),
                                            ),
                                            child: Text(
                                              '${index + 1}. ${options[index]}',
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        IconButton(
                                          icon: const Icon(Icons.delete_outline, color: Colors.black, size: 32),
                                          onPressed: () {
                                            setState(() {
                                              options.removeAt(index);
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                      ),

                      // --- 5. BOTÓN PRINCIPAL (¡Gira la ruleta!) ---
                      const SizedBox(height: 16),
                      Center(
                        child: SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              if (options.length >= 2) {
                                final randomOption = options[Random().nextInt(options.length)];
                                
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PantallaGanador(
                                      winner: randomOption,
                                      allOptions: options,
                                    ),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Por favor, agrega al menos 2 opciones.')),
                                );
                              }
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
                              '¡Gira la ruleta!',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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