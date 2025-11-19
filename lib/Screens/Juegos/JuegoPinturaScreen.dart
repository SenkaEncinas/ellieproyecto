import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class JuegoPinturaScreen extends StatefulWidget {
  const JuegoPinturaScreen({super.key});

  @override
  State<JuegoPinturaScreen> createState() => _JuegoPinturaScreenState();
}

class _JuegoPinturaScreenState extends State<JuegoPinturaScreen> {
  List<DrawPoint?> points = [];
  Color selectedColor = Colors.red;
  double strokeWidth = 4.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pintura Interactiva 🎨'),
        backgroundColor: Colors.orange,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              setState(() {
                points.clear();
              });
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                RenderBox? renderBox = context.findRenderObject() as RenderBox?;
                points.add(
                  DrawPoint(
                    points: renderBox!.globalToLocal(details.globalPosition),
                    paint:
                        Paint()
                          ..color = selectedColor
                          ..strokeWidth = strokeWidth
                          ..strokeCap = StrokeCap.round,
                  ),
                );
              });
            },
            onPanEnd: (details) {
              points.add(null); // Separador de trazos
            },
            child: CustomPaint(
              size: Size.infinite,
              painter: Painter(points: points),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildColorButton(Colors.red),
                _buildColorButton(Colors.blue),
                _buildColorButton(Colors.green),
                _buildColorButton(Colors.yellow),
                _buildColorButton(Colors.purple),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorButton(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(width: 2, color: Colors.black),
        ),
      ),
    );
  }
}

class DrawPoint {
  Offset points;
  Paint paint;
  DrawPoint({required this.points, required this.paint});
}

class Painter extends CustomPainter {
  List<DrawPoint?> points;
  Painter({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(
          points[i]!.points,
          points[i + 1]!.points,
          points[i]!.paint,
        );
      } else if (points[i] != null && points[i + 1] == null) {
        canvas.drawPoints(ui.PointMode.points, [
          points[i]!.points,
        ], points[i]!.paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
