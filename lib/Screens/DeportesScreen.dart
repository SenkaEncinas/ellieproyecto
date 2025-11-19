import 'package:flutter/material.dart';

class DeportesScreen extends StatelessWidget {
  const DeportesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de logros deportivos
    final logros = [
      {'titulo': 'Carrera de 50m', 'emoji': '🏃‍♀️', 'color': Colors.orange},
      {'titulo': 'Natación 🏊‍♀️', 'emoji': '🏊‍♀️', 'color': Colors.blue},
      {'titulo': 'Fútbol ⚽', 'emoji': '⚽', 'color': Colors.green},
      {'titulo': 'Básquet 🏀', 'emoji': '🏀', 'color': Colors.purple},
      {'titulo': 'Medalla de Oro 🥇', 'emoji': '🥇', 'color': Colors.yellow},
      {'titulo': 'Medalla de Plata 🥈', 'emoji': '🥈', 'color': Colors.grey},
      {'titulo': 'Medalla de Bronce 🥉', 'emoji': '🥉', 'color': Colors.brown},
      {
        'titulo': 'Gimnasia 🤸‍♀️',
        'emoji': '🤸‍♀️',
        'color': Colors.pinkAccent,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Deportes 📚'),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFE1F5FE),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              '🏆 Mis logros deportivos 🏆',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue,
                fontFamily: 'ComicNeue',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Grid de logros
            Expanded(
              child: GridView.builder(
                itemCount: logros.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // dos columnas
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.2,
                ),
                itemBuilder: (context, index) {
                  final logro = logros[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: logro['color'] as Color,
                    elevation: 5,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            logro['emoji'] as String,
                            style: const TextStyle(fontSize: 40),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            logro['titulo'] as String,
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
