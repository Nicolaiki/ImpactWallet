import 'package:flutter/material.dart';

class InversionesScreen extends StatelessWidget {
  const InversionesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inversiones'),
        backgroundColor: Colors.green[100],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Resumen del Portafolio',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Card(
              elevation: 2,
              child: ListTile(
                title: Text('ImpactCoins invertidos'),
                subtitle: Text('Total: 5,000 IMC'),
                trailing: Text('+320 IMC', style: TextStyle(color: Colors.green)),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Evolución del Rendimiento',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Container(
              height: 150,
              color: Colors.grey[200],
              child: const Center(child: Text('Gráfico placeholder')),
            ),
            const SizedBox(height: 20),
            const Text(
              'Activos Disponibles',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView(
                children: const [
                  ListTile(
                    title: Text('Fondo Sostenible A'),
                    subtitle: Text('Rentabilidad simulada: 5.3%'),
                    trailing: ElevatedButton(onPressed: null, child: Text('Invertir')),
                  ),
                  ListTile(
                    title: Text('ETF Impacto Social'),
                    subtitle: Text('Rentabilidad simulada: -1.2%'),
                    trailing: ElevatedButton(onPressed: null, child: Text('Invertir')),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
