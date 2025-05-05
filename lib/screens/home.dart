import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

enum HelpTarget { balance, chart, progress }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HelpTarget? _selectedTarget;
  bool _helpMode = false;

  void _toggleHelpMode() {
    setState(() {
      _helpMode = !_helpMode;
      _selectedTarget = null;
    });
  }

  void _showPopupHelp(HelpTarget target) {
    setState(() => _selectedTarget = target);
  }

  void _dismissPopupHelp() {
    setState(() => _selectedTarget = null);
  }

  void _navigateToSidebar() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const SidebarScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.menu, color: Colors.black),
                      onPressed: _navigateToSidebar,
                    ),
                    IconButton(
                      icon: Icon(
                        _helpMode ? Icons.hls_off : Icons.help_outline,
                        color: Colors.black,
                      ),
                      onPressed: _toggleHelpMode,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: _helpMode
                      ? () => _showPopupHelp(HelpTarget.balance)
                      : null,
                  child: const _BalanceCard(),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Rendimiento Financiero',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                const SizedBox(height: 12),
                GestureDetector(
                  onTap: _helpMode
                      ? () => _showPopupHelp(HelpTarget.chart)
                      : null,
                  child: const SizedBox(height: 200, child: _FinancialChart()),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Progreso del Curso Actual',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                const SizedBox(height: 12),
                GestureDetector(
                  onTap: _helpMode
                      ? () => _showPopupHelp(HelpTarget.progress)
                      : null,
                  child: const _CourseProgress(progress: 0.65),
                ),
              ],
            ),
          ),
          AnimatedOpacity(
            opacity: _selectedTarget != null ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: _selectedTarget != null
              ? Positioned.fill(
                  child: GestureDetector(
                    onTap: _dismissPopupHelp,
                    child: Container(
                      color: Colors.black54,
                      alignment: Alignment.center,
                      child: Container(
                        margin: const EdgeInsets.all(40),
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              _getHelpText(_selectedTarget!),
                              style: const TextStyle(fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: _dismissPopupHelp,
                              child: const Text('Entendido'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
          )
        ],
      ),
    );
  }

  String _getHelpText(HelpTarget target) {
    switch (target) {
      case HelpTarget.balance:
        return 'Aquí puedes ver tu saldo disponible en IMC, tu moneda virtual.';
      case HelpTarget.chart:
        return 'Este gráfico muestra tu rendimiento financiero en el tiempo.';
      case HelpTarget.progress:
        return 'Este indicador muestra tu progreso en el curso actual.';
    }
  }
}

class _BalanceCard extends StatelessWidget {
  const _BalanceCard();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Balance Total', style: TextStyle(fontSize: 16, color: Colors.grey)),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [Color(0xFF6BAAFF), Color(0xFFB0D0FF)]),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '\$42.734 IMC',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 8),
              const Text(
                '+24% Semana Pasada',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    child: const Text('Últimas Transacciones', style: TextStyle(color: Colors.blue)),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
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

class SidebarScreen extends StatelessWidget {
  const SidebarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menú"),
        backgroundColor: const Color(0xFF4A90E2),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: const [
          ListTile(leading: Icon(Icons.person), title: Text('Mi Perfil')),
          ListTile(leading: Icon(Icons.settings), title: Text('Configuración')),
          ListTile(leading: Icon(Icons.notifications), title: Text('Notificaciones')),
          ListTile(leading: Icon(Icons.help_outline), title: Text('Ayuda')),
        ],
      ),
    );
  }
}