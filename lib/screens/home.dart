import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'ImpactWallet',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _BalanceCard(),

          const SizedBox(height: 24),

          const Text(
            'Rendimiento Financiero',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 12),
          const SizedBox(height: 200, child: _FinancialChart()),

          const SizedBox(height: 24),

          const Text(
            'Progreso del Curso Actual',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 12),
          const _CourseProgress(progress: 0.65),
        ],
      ),
    );
  }
}

class _BalanceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: const Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Color(0xFF4A90E2),
              child: Text(
                'IMC',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Saldo Disponible',
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
                SizedBox(height: 8),
                Text(
                  '4,250 IMC',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4A90E2),
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
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: LinearProgressIndicator(
        value: progress,
        backgroundColor: Colors.grey[200],
        valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF4A90E2)),
        minHeight: 12,
      ),
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
            color: const Color(0xFF4A90E2),
            belowBarData: BarAreaData(
              show: true,
              color: const Color(0xFF4A90E2).withOpacity(0.3),
            ),
            dotData: const FlDotData(show: false),
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
