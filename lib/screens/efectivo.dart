import 'package:flutter/material.dart';

class BilleteraEfectivoPage extends StatelessWidget {
  const BilleteraEfectivoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Efectivo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Saldo en Efectivo',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text('\$500.00', style: TextStyle(fontSize: 32)),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text('Agregar Fondos'),
              onPressed: () {},
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              icon: const Icon(Icons.arrow_upward),
              label: const Text('Retirar Fondos'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
