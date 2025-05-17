import 'package:flutter/material.dart';

class CursosGraficoScreen extends StatelessWidget {
  final List<bool> cursosCompletados = List.generate(15, (i) => i < 7);

  CursosGraficoScreen({super.key}); // solo 7 completados

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progreso de Cursos'),
      ),
      body: CustomPaint(
        painter: CursosGraficoPainter(cursosCompletados),
        size: const Size(double.infinity, 300),
      ),
    );
  }
}

class CursosGraficoPainter extends CustomPainter {
  final List<bool> completados;

  CursosGraficoPainter(this.completados);

  @override
  void paint(Canvas canvas, Size size) {
    final paintBar = Paint()..color = Colors.green;
    final spacing = size.width / completados.length;
    final maxHeight = size.height;

    for (int i = 0; i < completados.length; i++) {
      if (completados[i]) {
        final x = i * spacing + spacing / 4;
        final barHeight = (i + 1) * 15.0; // altura progresiva simulando ganancia
        canvas.drawRect(
          Rect.fromLTWH(x, maxHeight - barHeight, spacing / 2, barHeight),
          paintBar,
        );
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
