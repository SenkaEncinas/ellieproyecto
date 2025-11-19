import 'package:flutter/material.dart';

class ArteScreen extends StatelessWidget {
  const ArteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de logros artísticos
    final logrosArte = [
      {'titulo': 'Dibujo 🖌️', 'emoji': '🎨', 'color': Colors.orange},
      {'titulo': 'Pintura de acuarela', 'emoji': '🖌️', 'color': Colors.blue},
      {'titulo': 'Manualidades ✂️', 'emoji': '✂️', 'color': Colors.purple},
      {'titulo': 'Origami 🦋', 'emoji': '🦋', 'color': Colors.green},
      {'titulo': 'Collage 🖼️', 'emoji': '🖼️', 'color': Colors.pinkAccent},
      {
        'titulo': 'Escultura de plastilina',
        'emoji': '🧱',
        'color': Colors.teal,
      },
      {'titulo': 'Dibujo digital 💻', 'emoji': '💻', 'color': Colors.indigo},
      {'titulo': 'Arte con arena ⏳', 'emoji': '⏳', 'color': Colors.yellow},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Arte 🎨'),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFFFF3E0),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              '✨ Mis logros artísticos ✨',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
                fontFamily: 'ComicNeue',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Grid de logros artísticos
            Expanded(
              child: GridView.builder(
                itemCount: logrosArte.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.2,
                ),
                itemBuilder: (context, index) {
                  final logro = logrosArte[index];
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
