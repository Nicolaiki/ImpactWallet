import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'cursos.dart'; // Asegúrate que esta pantalla esté definida

class BilleteraScreen extends StatefulWidget {
  const BilleteraScreen({super.key});

  @override
  State<BilleteraScreen> createState() => _BilleteraScreenState();
}

class _BilleteraScreenState extends State<BilleteraScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String selectedPeriod = '1D';
  final List<String> periods = ['1D', '1S', '1M', '1A'];

  final Map<String, List<FlSpot>> mockChartData = {
    '1D': [const FlSpot(0, 1.2), const FlSpot(1, 1.1), const FlSpot(2, 1.15), const FlSpot(3, 1.18)],
    '1S': [const FlSpot(0, 1.0), const FlSpot(1, 1.1), const FlSpot(2, 1.05), const FlSpot(3, 1.18)],
    '1M': [const FlSpot(0, 0.9), const FlSpot(1, 1.0), const FlSpot(2, 1.1), const FlSpot(3, 1.18)],
    '1A': [const FlSpot(0, 0.6), const FlSpot(1, 0.9), const FlSpot(2, 1.1), const FlSpot(3, 1.18)],
  };

  final List<Map<String, dynamic>> activos = [
    {'nombre': 'Tesla', 'imc': 12.4},
    {'nombre': 'Apple', 'imc': 8.7},
    {'nombre': 'Google', 'imc': 15.3},
    {'nombre': 'Microsoft', 'imc': 6.9},
    {'nombre': 'Amazon', 'imc': 10.5},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildChart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'ImpactCoin',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        const SizedBox(height: 4),
        const Text(
          '\$1.18',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const Text('-5.67%', style: TextStyle(color: Colors.grey)),
        const SizedBox(height: 16),
        SizedBox(
          height: 150,
          child: LineChart(
            LineChartData(
              gridData: const FlGridData(show: false),
              titlesData: const FlTitlesData(show: false),
              borderData: FlBorderData(show: false),
              lineTouchData: LineTouchData(
                handleBuiltInTouches: true,
                getTouchedSpotIndicator:
                    (LineChartBarData barData, List<int> spotIndexes) {
                  return spotIndexes.map((index) {
                    return TouchedSpotIndicatorData(
                      const FlLine(color: Colors.black, strokeWidth: 1),
                      FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) =>
                            FlDotCirclePainter(
                          radius: 6,
                          color: Colors.black,
                          strokeWidth: 2,
                          strokeColor: Colors.white,
                        ),
                      ),
                    );
                  }).toList();
                },
                touchTooltipData: LineTouchTooltipData(
                  tooltipBgColor: Colors.black,
                  tooltipRoundedRadius: 8,
                  getTooltipItems: (touchedSpots) {
                    return touchedSpots.map((touchedSpot) {
                      return LineTooltipItem(
                        '\$${touchedSpot.y.toStringAsFixed(2)}',
                        const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }).toList();
                  },
                ),
              ),
              lineBarsData: [
                LineChartBarData(
                  isCurved: true,
                  color: Colors.black,
                  barWidth: 3,
                  spots: mockChartData[selectedPeriod]!,
                  dotData: const FlDotData(show: false),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: periods.map((p) {
            final bool isSelected = selectedPeriod == p;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6), // Ajusta separación aquí
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedPeriod = p;
                  });
                },
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.grey[200] : Colors.white,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    p,
                    style: TextStyle(
                      fontSize: 12,
                      color: isSelected ? Colors.grey[800] : Colors.grey[500],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: const [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.white),
                child: Text('Menú', style: TextStyle(color: Colors.black, fontSize: 24)),
              ),
              ListTile(leading: Icon(Icons.person), title: Text('Mi Perfil')),
              ListTile(leading: Icon(Icons.settings), title: Text('Configuración')),
              ListTile(leading: Icon(Icons.notifications), title: Text('Notificaciones')),
              ListTile(leading: Icon(Icons.help_outline), title: Text('Ayuda')),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(
                    builder: (context) => IconButton(
                      icon: const Icon(Icons.menu, color: Colors.black),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
                  ),
                  const CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.grey,
                  ),
                ],
              ),
              //const SizedBox(height: 32),
              const Text(
                '\$42.734 IMC',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const CursosScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: const Text('Obtener', style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 16),
              TabBar(
                controller: _tabController,
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                labelPadding: const EdgeInsets.symmetric(horizontal: 2), // Menos espacio entre pestañas
                tabs: const [
                  Tab(text: 'ImpactCoin'),
                  Tab(text: 'Activos'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  physics: const NeverScrollableScrollPhysics(), // ← Deshabilita el swipe entre pestañas
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: _buildChart(),
                    ),
                    ListView.builder(
                      itemCount: activos.length,
                      itemBuilder: (context, index) {
                        final activo = activos[index];
                        return ListTile(
                          leading: const Icon(Icons.business, color: Colors.black),
                          title: Text(activo['nombre']),
                          trailing: Text('${activo['imc']} IMC'),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
