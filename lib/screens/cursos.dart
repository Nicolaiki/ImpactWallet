import 'package:flutter/material.dart';
import 'progreso.dart';

class CursosScreen extends StatelessWidget {
  const CursosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: const Row(
          children: [
            Icon(Icons.school, color: Colors.white),
            SizedBox(width: 8),
            Text('Cursos', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text(
            'Cursos',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          CursoItem(
            titulo: 'Introducción a la inversión',
            duracion: '12 Minutos',
            lecciones: '4 Lecciones',
            progreso: 0.5,
            imagen: '',
          ),
          CursoItem(
            titulo: 'Riesgo vs Recompensa',
            duracion: '7 Minutos',
            lecciones: '2 Lecciones',
            progreso: 0.3,
            imagen: '',
          ),
          CursoItem(
            titulo: 'Finanzas personales',
            duracion: '10 Minutos',
            lecciones: '5 Lecciones',
            progreso: 0.0,
            imagen: '',
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Cursos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: 'Logros',
          ),
        ],
      ),
    );
  }
}

class CursoItem extends StatelessWidget {
  final String titulo;
  final String duracion;
  final String lecciones;
  final double progreso;
  final String imagen;

  const CursoItem({
    super.key,
    required this.titulo,
    required this.duracion,
    required this.lecciones,
    required this.progreso,
    required this.imagen,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProgresoCursoScreen(titulo: titulo, progreso: progreso),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.only(bottom: 16),
        elevation: 1,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(imagen, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(titulo, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text('$duracion · $lecciones',
                            style: const TextStyle(color: Colors.grey, fontSize: 13)),
                      ],
                    ),
                  ),
                  CircularProgressIndicator(
                    value: progreso,
                    strokeWidth: 3,
                    backgroundColor: Colors.grey.shade300,
                  ),
                  const SizedBox(width: 8),
                  Text('${(progreso * 100).toInt()}%'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}