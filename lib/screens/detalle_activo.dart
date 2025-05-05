import 'package:flutter/material.dart';

class DetalleActivoScreen extends StatelessWidget {
  final Map<String, dynamic> asset;

  const DetalleActivoScreen({super.key, required this.asset});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(asset['name']),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Balance
            Text(
              asset['price'],
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Text(
              asset['change'],
              style: TextStyle(
                color: asset['isPositive'] ? Colors.green : Colors.red,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 24),

            // Chart Placeholder
            Container(
              height: 180,
              decoration: BoxDecoration(
                color: Colors.blueGrey[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(child: Text('📊 Historial de precios')),
            ),
            const SizedBox(height: 24),

            // Acciones
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _ActionButton(icon: Icons.shopping_cart, label: 'Comprar'),
                _ActionButton(icon: Icons.swap_horiz, label: 'Intercambiar'),
                _ActionButton(icon: Icons.sell, label: 'Vender'),
              ],
            ),

            const SizedBox(height: 24),
            const Divider(),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Transacciones recientes',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),
            _transactionTile('Enviado', '-0.0048 ETH'),
            _transactionTile('Recibido', '+0.0078 ETH'),
          ],
        ),
      ),
    );
  }

  Widget _transactionTile(String type, String amount) {
    final isPositive = amount.startsWith('+');
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(type),
      trailing: Text(
        amount,
        style: TextStyle(
          color: isPositive ? Colors.green : Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ActionButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Icon(icon, color: Colors.blue[900]),
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}
