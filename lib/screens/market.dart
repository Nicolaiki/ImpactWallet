import 'package:flutter/material.dart';
import 'detalle_activo.dart';

class MarketScreen extends StatelessWidget {
  final List<Map<String, dynamic>> assets = [
    {
      'name': 'Ethereum',
      'symbol': 'ETH',
      'price': '\$23,635.00',
      'change': '+24%',
      'isPositive': true,
    },
    {
      'name': 'Dogecoin',
      'symbol': 'DOGE',
      'price': '\$3,837.00',
      'change': '-12%',
      'isPositive': false,
    },
    {
      'name': 'Bitcoin',
      'symbol': 'BTC',
      'price': '\$1,375.00',
      'change': '-8%',
      'isPositive': false,
    },
    {
      'name': 'Ripple',
      'symbol': 'XRP',
      'price': '\$16,645.00',
      'change': '+18%',
      'isPositive': true,
    },
  ];

  MarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mercado'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: assets.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final asset = assets[index];
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetalleActivoScreen(asset: asset),
                ),
              );
            },
            leading: CircleAvatar(
              backgroundColor: Colors.blue[50],
              child: Text(asset['symbol']),
            ),
            title: Text(asset['name']),
            subtitle: Text(asset['symbol']),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  asset['price'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  asset['change'],
                  style: TextStyle(
                    color: asset['isPositive'] ? Colors.green : Colors.red,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
