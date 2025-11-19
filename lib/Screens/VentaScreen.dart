import 'package:flutter/material.dart';

class VentaScreen extends StatelessWidget {
  const VentaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de productos a la venta
    final productos = [
      {
        'nombre': 'Peluche 🐶',
        'imagen': 'https://via.placeholder.com/150', // reemplazar con URL real
        'precio': 'S/ 25',
      },
      {
        'nombre': 'Muñeca 👧',
        'imagen': 'https://via.placeholder.com/150',
        'precio': 'S/ 30',
      },
      {
        'nombre': 'Libros 📚',
        'imagen': 'https://via.placeholder.com/150',
        'precio': 'S/ 15',
      },
      {
        'nombre': 'Juguete 🏀',
        'imagen': 'https://via.placeholder.com/150',
        'precio': 'S/ 20',
      },
      {
        'nombre': 'Lápices de colores ✏️',
        'imagen': 'https://via.placeholder.com/150',
        'precio': 'S/ 10',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tengo a la venta 🐶'),
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFFFEBEE),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              '🛒 Mis productos a la venta 🛒',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent,
                fontFamily: 'ComicNeue',
              ),
            ),
            const SizedBox(height: 20),

            // Grid de productos
            Expanded(
              child: GridView.builder(
                itemCount: productos.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  final producto = productos[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            producto['imagen']!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          producto['nombre']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'ComicNeue',
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          producto['precio']!,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.redAccent,
                            fontFamily: 'ComicNeue',
                          ),
                        ),
                      ],
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
