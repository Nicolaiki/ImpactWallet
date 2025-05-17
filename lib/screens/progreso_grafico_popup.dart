import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ProgresoGraficoPopup extends StatelessWidget {
  const ProgresoGraficoPopup({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cursos = [
      {'nombre': 'Intro Inversión', 'unidades': 2},
      {'nombre': 'Riesgo vs Recompensa', 'unidades': 3},
      {'nombre': 'Finanzas Personales', 'unidades': 4},
      {'nombre': 'Ahorro y Gasto', 'unidades': 1},
    ];

    int acumulado = 0;
    final List<Map<String, dynamic>> progresoAcumulado = cursos.map((curso) {
      acumulado += curso['unidades'] as int;
      return {
        'nombre': curso['nombre'] as String,
        'acumulado': acumulado.toDouble(),
      };
    }).toList();

    return AlertDialog(
      title: const Text('Progreso acumulativo de cursos'),
      content: SizedBox(
        width: double.maxFinite,
        height: 300,
        child: LineChart(
          LineChartData(
            minY: 0,
            maxY: (progresoAcumulado.last['acumulado'] as double) + 1,
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1,
                  getTitlesWidget: (value, meta) {
                    final index = value.toInt();
                    if (index >= 0 && index < progresoAcumulado.length) {
                      final nombre = progresoAcumulado[index]['nombre'] as String;
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          nombre,
                          style: const TextStyle(fontSize: 10),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      value.toInt().toString(),
                      style: const TextStyle(fontSize: 10),
                    );
                  },
                ),
              ),
              topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            gridData: const FlGridData(show: true),
            borderData: FlBorderData(show: true),
            lineBarsData: [
              LineChartBarData(
                spots: progresoAcumulado.asMap().entries.map((entry) {
                  return FlSpot(
                    entry.key.toDouble(),
                    entry.value['acumulado'] as double,
                  );
                }).toList(),
                isCurved: false,
                color: Colors.green,
                barWidth: 4,
                belowBarData: BarAreaData(
                  show: true,
                  color: Colors.green.withOpacity(0.3),
                ),
                dotData: const FlDotData(show: true),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cerrar'),
        ),
      ],
    );
  }
}
