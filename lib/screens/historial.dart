import 'package:flutter/material.dart';

class BilleteraHistorialPage extends StatelessWidget {
  const BilleteraHistorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Historial de Transacciones')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            child: ListTile(
              leading: Icon(Icons.arrow_downward, color: Colors.green),
              title: Text('Depósito'),
              subtitle: Text('Cuenta bancaria'),
              trailing: Text('+\$300.00'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.arrow_upward, color: Colors.red),
              title: Text('Retiro'),
              subtitle: Text('Wallet BTC'),
              trailing: Text('-\$120.00'),
            ),
          ),
        ],
      ),
    );
  }
}
