import 'package:flutter/material.dart';

class BilleteraScreen extends StatelessWidget {
  const BilleteraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle de Cripto')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text(
            'Bitcoin (BTC)',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.trending_up, color: Colors.green),
              SizedBox(width: 8),
              Text('Precio actual: \$42,300.00'),
            ],
          ),
          SizedBox(height: 16),
          Text('Movimientos recientes', style: TextStyle(fontSize: 16)),
          SizedBox(height: 8),
          Card(
            child: ListTile(
              title: Text('Compra'),
              subtitle: Text('0.01 BTC - \$423.00'),
              trailing: Text('12 May'),
            ),
          ),
        ],
      ),
    );
  }
}
