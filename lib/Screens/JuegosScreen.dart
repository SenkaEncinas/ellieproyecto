import 'package:ellieproyecto/Screens/Juegos/JueegoCarreraScreen.dart';
import 'package:ellieproyecto/Screens/Juegos/JuegoPinturaScreen.dart';
import 'package:flutter/material.dart';

// Importar los juegos reales
class JuegosScreen extends StatelessWidget {
  const JuegosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0F7FA),
      appBar: AppBar(
        title: const Text('Juegos 🕹️'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Elige un juego',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontFamily: 'ComicNeue',
                  ),
                ),
                const SizedBox(height: 30),

                _buildGameButton('Juego 1 🎯', Colors.orange, context, null),
                _buildGameButton(
                  'Mini Carrera 🏃‍♀️',
                  Colors.blue,
                  context,
                  const JuegoCarreraScreen(),
                ),
                _buildGameButton(
                  'Pintura 🎨',
                  Colors.purple,
                  context,
                  const JuegoPinturaScreen(),
                ),
                _buildGameButton(
                  'Juego 4 🏹',
                  Colors.redAccent,
                  context,
                  null,
                ), // todavía en construcción
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Botón de juego, redirige a pantalla real si existe
  Widget _buildGameButton(
    String text,
    Color color,
    BuildContext context,
    Widget? screen,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        onPressed: () {
          if (screen != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => screen),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Juego en construcción')),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          elevation: 6,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontFamily: 'ComicNeue',
          ),
        ),
      ),
    );
  }
}
