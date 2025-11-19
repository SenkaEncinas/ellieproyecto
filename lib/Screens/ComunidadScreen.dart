import 'package:flutter/material.dart';

class ComunidadScreen extends StatelessWidget {
  const ComunidadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de acciones/comunidad
    final ayudas = [
      {
        'titulo': 'Recolección de basura',
        'emoji': '🧹',
        'color': Colors.orange,
      },
      {'titulo': 'Plantar árboles', 'emoji': '🌳', 'color': Colors.green},
      {'titulo': 'Ayuda a animales', 'emoji': '🐶', 'color': Colors.pinkAccent},
      {'titulo': 'Donación de ropa', 'emoji': '👕', 'color': Colors.blue},
      {
        'titulo': 'Voluntariado en escuela',
        'emoji': '🏫',
        'color': Colors.purple,
      },
      {'titulo': 'Limpieza de parque', 'emoji': '🏞️', 'color': Colors.teal},
      {
        'titulo': 'Ayuda en feria comunitaria',
        'emoji': '🎪',
        'color': Colors.redAccent,
      },
      {'titulo': 'Reciclaje creativo', 'emoji': '♻️', 'color': Colors.lime},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ayuda a la comunidad 🎵'),
        backgroundColor: Colors.purpleAccent,
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFF3E5F5),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              '💖 Mis acciones en la comunidad 💖',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
                fontFamily: 'ComicNeue',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Grid de ayudas
            Expanded(
              child: GridView.builder(
                itemCount: ayudas.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // dos columnas
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.2,
                ),
                itemBuilder: (context, index) {
                  final ayuda = ayudas[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: ayuda['color'] as Color,
                    elevation: 5,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            ayuda['emoji'] as String,
                            style: const TextStyle(fontSize: 40),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            ayuda['titulo'] as String,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'ComicNeue',
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
