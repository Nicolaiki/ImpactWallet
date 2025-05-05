import 'package:flutter/material.dart';

class ProgresoCursoScreen extends StatelessWidget {
  final String titulo;
  final double progreso;

  const ProgresoCursoScreen({super.key, required this.titulo, required this.progreso});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tu Progreso'),
        backgroundColor: Colors.blue[100],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Avatar y Nivel
            const Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/avatar.png'), // Reemplaza si usas red o placeholder
                ),
                SizedBox(height: 8),
                Text(
                  'Tu progreso en este curso 🚀',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Barra de progreso
            _ProgressBar(label: 'Progreso general', value: progreso),
            const SizedBox(height: 24),

            // Ruta de logros (ramificada)
            const Text(
              'Lecciones del curso',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const _LogrosTree(),

            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Acción futura
              },
              child: const Text('Ver todo mi progreso'),
            ),
          ],
        ),
      ),
    );
  }
}

// --- WIDGETS REUTILIZABLES ---

class _ProgressBar extends StatelessWidget {
  final String label;
  final double value;

  const _ProgressBar({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 4),
        LinearProgressIndicator(value: value, minHeight: 8),
        Text('${(value * 100).toInt()}%', style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class _LogrosTree extends StatelessWidget {
  const _LogrosTree();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _LogroNode(icon: Icons.emoji_events, title: 'Primer Curso'),
        _TreeConnector(),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(child: _LogroNode(icon: Icons.star, title: 'Lección Completada')),
            Expanded(child: _LogroNode(icon: Icons.shield, title: 'Seguridad Básica')),
          ],
        ),
        _TreeConnector(),
        const _LogroNode(icon: Icons.trending_up, title: 'Primera Inversión'),
      ],
    );
  }
}

class _LogroNode extends StatelessWidget {
  final IconData icon;
  final String title;

  const _LogroNode({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 40, color: Colors.blue),
        const SizedBox(height: 4),
        Text(title, textAlign: TextAlign.center),
        const SizedBox(height: 12),
      ],
    );
  }
}

class _TreeConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 4,
      color: Colors.blue,
      margin: const EdgeInsets.symmetric(vertical: 8),
    );
  }
}
