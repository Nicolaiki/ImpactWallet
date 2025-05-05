import 'package:flutter/material.dart';

class ProgresoCursoScreen extends StatelessWidget {
  final String titulo;
  final double progreso;

  const ProgresoCursoScreen({
    super.key,
    required this.titulo,
    required this.progreso,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tu Progreso'),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          UnidadBanner(
            unidad: 'Unidad 1',
            objetivo: 'Aprende conceptos básicos',
            recompensas: 100,
            misiones: ['Intro', 'Dinero', 'Seguridad'],
          ),
          SizedBox(height: 32),
          UnidadBanner(
            unidad: 'Unidad 2',
            objetivo: 'Administra tus finanzas',
            recompensas: 150,
            misiones: ['Gastos', 'Ahorro', 'Presupuesto'],
          ),
          SizedBox(height: 32),
          UnidadBanner(
            unidad: 'Unidad 3',
            objetivo: 'Invierte con confianza',
            recompensas: 200,
            misiones: ['Riesgo', 'Inversiones', 'Portafolio'],
          ),
        ],
      ),
    );
  }
}

// --- WIDGETS PERSONALIZADOS ---

class UnidadBanner extends StatelessWidget {
  final String unidad;
  final String objetivo;
  final int recompensas;
  final List<String> misiones;

  const UnidadBanner({
    super.key,
    required this.unidad,
    required this.objetivo,
    required this.recompensas,
    required this.misiones,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Banner de la unidad
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.purple[100],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Icon(Icons.flag, size: 32, color: Colors.purple[700]),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(unidad, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(objetivo, style: const TextStyle(fontSize: 14)),
                  ],
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.monetization_on, color: Colors.amber),
                  const SizedBox(width: 4),
                  Text('$recompensas IMC', style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Camino de misiones
        Column(
          children: List.generate(misiones.length * 2 - 1, (index) {
            if (index.isEven) {
              int i = index ~/ 2;
              return EstacionMision(nombre: misiones[i]);
            } else {
              return const LineaConector();
            }
          }),
        ),
      ],
    );
  }
}

class EstacionMision extends StatelessWidget {
  final String nombre;

  const EstacionMision({super.key, required this.nombre});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: Colors.grey[200],
          child: Icon(Icons.lock_open, color: Colors.green[600]),
        ),
        const SizedBox(height: 6),
        Text(nombre, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
      ],
    );
  }
}

class LineaConector extends StatelessWidget {
  const LineaConector({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 4,
      color: Colors.grey[400],
      margin: const EdgeInsets.symmetric(vertical: 4),
    );
  }
}
