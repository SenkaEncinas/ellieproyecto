import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 🖥️ Detecta el tamaño de pantalla
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF6E8),
      appBar: AppBar(
        title: const Text(
          'Clara Isabel Encinas Linarez 🌟',
          style: TextStyle(fontFamily: 'ComicNeue'),
        ),
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500), // 👈 máximo ancho en pantallas grandes
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 📸 Imagen redonda desde URL
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    'https://scontent-lim1-1.xx.fbcdn.net/v/t39.30808-6/571080176_10162308928408507_4075390051958404550_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=833d8c&_nc_ohc=szlBqUoEURUQ7kNvwEsKSc6&_nc_oc=AdlRgsfyam7QQ4w5J7Gi0Me_9O02n0R06SOfpXVu5oTIxZya1YQjQ4mU5fdIJa1W3Go&_nc_zt=23&_nc_ht=scontent-lim1-1.xx&_nc_gid=jtWF_gApziT1K0HaLjZMSA&oh=00_Afg1wYLoG6uKmqL2Cr-CzHg11KmS433wtxfnJ-jEYeXw1g&oe=691AE836', // 👈 pon aquí tu URL real
                    width: size.width * 0.4 > 180 ? 180 : size.width * 0.4, // adaptable
                    height: size.width * 0.4 > 180 ? 180 : size.width * 0.4,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(height: 25),

                const Text(
                  '¡Bienvenid@ aqui te dire quien soy!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                    fontFamily: 'ComicNeue',
                  ),
                ),

                const SizedBox(height: 35),

                // 🎨 Botones coloridos, centrados
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildMagicButton('Arte 🎨', Colors.orange, context),
                    _buildMagicButton('Deportes 📚', Colors.lightBlue, context),
                    _buildMagicButton('Juegos 🕹️', Colors.green, context),
                    _buildMagicButton('Ayuda a la comunidad 🎵', Colors.purpleAccent, context),
                    _buildMagicButton('Tengo a la venta 🐶', Colors.pinkAccent, context),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 🌈 Método reutilizable para botones creativos
  Widget _buildMagicButton(String text, Color color, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        onPressed: () {
          // Aquí luego agregaremos la navegación
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
