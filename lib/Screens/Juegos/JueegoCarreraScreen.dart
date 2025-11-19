import 'dart:async';
import 'package:flutter/material.dart';

class JuegoCarreraScreen extends StatefulWidget {
  const JuegoCarreraScreen({super.key});

  @override
  State<JuegoCarreraScreen> createState() => _JuegoCarreraScreenState();
}

class _JuegoCarreraScreenState extends State<JuegoCarreraScreen> {
  double playerY = 0; // en pixeles desde la parte superior
  double playerHeight = 50;
  double playerWidth = 50;

  double obstacleX = 300; // posición inicial del obstáculo en pixeles
  double obstacleHeight = 40;
  double obstacleWidth = 40;

  int score = 0;
  bool gameStarted = false;
  Timer? gameTimer;

  double velocity = 0;
  double gravity = 0.8; // gravedad
  double jumpForce = -15;

  double groundY = 400; // altura del suelo desde arriba

  void startGame() {
    setState(() {
      gameStarted = true;
      playerY = groundY;
      obstacleX = 400;
      score = 0;
      velocity = 0;
    });

    gameTimer?.cancel();
    gameTimer = Timer.periodic(const Duration(milliseconds: 20), (timer) {
      setState(() {
        // Movimiento jugador
        velocity += gravity;
        playerY += velocity;
        if (playerY > groundY) {
          playerY = groundY;
          velocity = 0;
        }

        // Movimiento obstáculo
        obstacleX -= 5;
        if (obstacleX < -obstacleWidth) {
          obstacleX = 400;
          score++;
        }

        // Colisión
        if (obstacleX < playerWidth &&
            obstacleX + obstacleWidth > 0 &&
            playerY + playerHeight > groundY - obstacleHeight) {
          gameOver();
        }
      });
    });
  }

  void jump() {
    if (playerY == groundY) {
      setState(() {
        velocity = jumpForce;
      });
    }
  }

  void gameOver() {
    gameTimer?.cancel();
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('¡Fin del juego!'),
            content: Text('Tu puntuación: $score'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  startGame();
                },
                child: const Text('Jugar de nuevo'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Salir'),
              ),
            ],
          ),
    );
    setState(() {
      gameStarted = false;
    });
  }

  @override
  void dispose() {
    gameTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mini Carrera 🏃‍♀️'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: jump,
        child: Stack(
          children: [
            // Suelo
            Positioned(
              top: groundY + playerHeight,
              left: 0,
              right: 0,
              child: Container(height: 20, color: Colors.brown),
            ),
            // Puntuación
            Positioned(
              top: 30,
              left: 20,
              child: Text(
                'Puntos: $score',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Jugador
            Positioned(
              top: playerY,
              left: 50,
              child: Container(
                width: playerWidth,
                height: playerHeight,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            // Obstáculo
            Positioned(
              top: groundY + playerHeight - obstacleHeight,
              left: obstacleX,
              child: Container(
                width: obstacleWidth,
                height: obstacleHeight,
                color: Colors.red,
              ),
            ),
            // Mensaje para iniciar
            if (!gameStarted)
              Center(
                child: Text(
                  'Toca la pantalla para iniciar y saltar 🏃‍♀️',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[800],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
