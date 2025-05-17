import 'package:flutter/material.dart';
import 'progreso.dart';

class CursosScreen extends StatelessWidget {
  const CursosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            // AppBar negro fuera del fondo blanco
            Container(
              color: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 82),
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.school,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 6),
                    child: Text(
                      'Cursos',
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
            ),

            // Contenedor blanco redondeado
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: ListView(
                  padding: const EdgeInsets.all(22),
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
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
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
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
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
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircularProgressIndicator(
                          value: progreso,
                          strokeWidth: 4,
                          backgroundColor: Colors.grey.shade200,
                          valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                        ),
                        Text(
                          '${(progreso * 100).toInt()}%',
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
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