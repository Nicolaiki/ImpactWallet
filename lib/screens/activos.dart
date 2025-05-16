import 'package:flutter/material.dart';

class BilleteraActivosPage extends StatelessWidget {
  const BilleteraActivosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Activos')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Resumen de tus activos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Card(
              child: ListTile(
                leading: Icon(Icons.monetization_on, color: Colors.green),
                title: Text('Saldo total'),
                subtitle: Text('\$1,200.00'),
              ),
            ),
            SizedBox(height: 16),
            Card(
              child: ListTile(
                leading: Icon(Icons.account_balance_wallet),
                title: Text('Cuentas asociadas'),
                subtitle: Text('3 cuentas conectadas'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
