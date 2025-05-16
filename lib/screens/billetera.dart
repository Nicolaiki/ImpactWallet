import 'package:flutter/material.dart';

class BilleteraScreen extends StatefulWidget {
  const BilleteraScreen({super.key});

  @override
  State<BilleteraScreen> createState() => _BilleteraScreenState();
}

class _BilleteraScreenState extends State<BilleteraScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String selectedPeriod = '1D';

  final List<String> periods = ['1D', '1S', '1M', '1A'];

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

  Widget _buildChart(String period) {
    // Este widget simula un gráfico. Puedes integrar un gráfico real con packages como fl_chart.
    return Column(
      children: [
        Text(
          'ImpactCoin precio: \$1.18',
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
        const SizedBox(height: 8),
        const Text('-5.67%', style: TextStyle(color: Colors.grey)),
        const SizedBox(height: 16),
        Container(
          height: 100,
          color: Colors.grey[200],
          alignment: Alignment.center,
          child: Text('Gráfico ($period)', style: const TextStyle(color: Colors.black54)),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: periods.map((p) {
            return ChoiceChip(
              label: Text(p),
              selected: selectedPeriod == p,
              onSelected: (_) {
                setState(() {
                  selectedPeriod = p;
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Billetera'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'ImpactCoin'),
            Tab(text: 'Activos'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // ImpactCoin tab
          ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Text(
                'Tu saldo',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 4),
              const Text(
                '\$150,78',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              _buildChart(selectedPeriod),
            ],
          ),
          // Activos tab
          const Center(child: Text('Listado de activos...')),
        ],
      ),
    );
  }
}
