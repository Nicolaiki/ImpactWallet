import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart'; // Asegúrate de tener fl_chart en pubspec.yaml

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ImpactWallet'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Tarjeta de saldo IMC
          _BalanceCard(),

          const SizedBox(height: 24),

          // Gráfico de finanzas
          const Text(
            'Rendimiento Financiero',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          const SizedBox(height: 200, child: _FinancialChart()),

          const SizedBox(height: 24),

          // Progreso del curso
          const Text(
            'Progreso del Curso Actual',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          const _CourseProgress(progress: 0.65), // 65% de avance
        ],
      ),
    );
  }
}

class _BalanceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green[100],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            // Placeholder para el logo de IMC
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.green[800],
              child: const Text(
                'IMC',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 20),
            // Saldo
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Saldo Disponible',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  '4,250 IMC',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CourseProgress extends StatelessWidget {
  final double progress;

  const _CourseProgress({required this.progress});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: progress,
      backgroundColor: Colors.grey[300],
      valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
      minHeight: 12,
    );
  }
}

class _FinancialChart extends StatelessWidget {
  const _FinancialChart();

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        borderData: FlBorderData(show: false),
        titlesData: const FlTitlesData(show: false),
        gridData: const FlGridData(show: false),
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            color: Colors.green,
            belowBarData: BarAreaData(
              show: true,
              color: Colors.green.withOpacity(0.3),
            ),
            spots: const [
              FlSpot(0, 1),
              FlSpot(1, 1.3),
              FlSpot(2, 1.1),
              FlSpot(3, 1.6),
              FlSpot(4, 1.2),
              FlSpot(5, 1.8),
              FlSpot(6, 2),
            ],
          ),
        ],
      ),
    );
  }
}
