// inversiones.dart
import 'package:flutter/material.dart';
import 'market.dart';
import 'detalle_activo.dart';

class InversionesScreen extends StatelessWidget {
  const InversionesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Inversiones', style: TextStyle(color: Colors.black)),
        actions: const [
          Icon(Icons.notifications_none, color: Colors.black),
          SizedBox(width: 12),
          CircleAvatar(radius: 16, backgroundColor: Colors.grey),
          SizedBox(width: 12),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
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
                        const SizedBox(width: 12),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text('Billetera', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              Wrap(
                spacing: 12,
                children: [
                  _billeteraBox('Crypto', '12 Activos'),
                  _billeteraBox('DeFi', '7 Activos'),
                  _billeteraBox('NFT', '2 Activos'),
                  _billeteraBox('Web3', '5 Activos'),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Principales', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => MarketScreen()));
                    },
                    child: const Text('Ver Más'),
                  )
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  _bidCard(context, 'Apple', '\$2,635.00', '+24%', Colors.green),
                  const SizedBox(width: 12),
                  _bidCard(context, 'LATAM', '\$823.00', '-12%', Colors.red),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _billeteraBox(String title, String subtitle) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(subtitle, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _bidCard(BuildContext context, String title, String price, String change, Color changeColor) {
    return Expanded(
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetalleActivoScreen(
              asset: {
                'title': title,
                'price': price,
                'change': change,
              },
            ),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(price, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 4),
              Text(change, style: TextStyle(color: changeColor)),
            ],
          ),
        ),
      ),
    );
  }
}
