import 'package:flutter/material.dart';
import 'billetera.dart';
import 'cursos.dart';

enum HelpTarget { balance, progress }

class HomeScreen extends StatefulWidget {
  final VoidCallback onGoToBilletera;
  const HomeScreen({super.key, required this.onGoToBilletera});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HelpTarget? _selectedTarget;
  bool _helpMode = false;

  void _toggleHelpMode() {
    setState(() {
      _helpMode = !_helpMode;
      _selectedTarget = null;
    });
  }

  void _showPopupHelp(HelpTarget target) {
    setState(() => _selectedTarget = target);
  }

  void _dismissPopupHelp() {
    setState(() => _selectedTarget = null);
  }

  void _navigateToSidebar() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const SidebarScreen()),
    );
  }

  void _navigateToCursos() {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const CursosScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;
          final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(position: animation.drive(tween), child: child);
        },
      ),
    );
  }

  void _navigateToBilletera() {
    widget.onGoToBilletera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.menu, color: Colors.black),
                      onPressed: _navigateToSidebar,
                    ),
                    const Text(
                      'Impact Wallet',
                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: Icon(
                        _helpMode ? Icons.hls_off : Icons.help_outline,
                        color: Colors.black,
                      ),
                      onPressed: _toggleHelpMode,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                GestureDetector(
                  onTap: _helpMode
                      ? () => _showPopupHelp(HelpTarget.balance)
                      : _navigateToBilletera,
                  child: const _BalanceCard(),
                ),
                const SizedBox(height: 24),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: _navigateToCursos,
                      child: Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.school,
                          color: Colors.white,
                          size: 36,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Cursos",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  'Progreso del Curso Actual',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                const SizedBox(height: 12),
                GestureDetector(
                  onTap: _helpMode
                      ? () => _showPopupHelp(HelpTarget.progress)
                      : null,
                  child: const _CourseProgress(progress: 0.65),
                ),
              ],
            ),
          ),
          AnimatedOpacity(
            opacity: _selectedTarget != null ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: _selectedTarget != null
                ? Positioned.fill(
                    child: GestureDetector(
                      onTap: _dismissPopupHelp,
                      child: Container(
                        color: Colors.black54,
                        alignment: Alignment.center,
                        child: Container(
                          margin: const EdgeInsets.all(40),
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                _getHelpText(_selectedTarget!),
                                style: const TextStyle(fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: _dismissPopupHelp,
                                child: const Text('Entendido'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          )
        ],
      ),
    );
  }

  String _getHelpText(HelpTarget target) {
    switch (target) {
      case HelpTarget.balance:
        return 'Aquí puedes ver tu saldo disponible en IMC, tu moneda virtual.';
      case HelpTarget.progress:
        return 'Este indicador muestra tu progreso en el curso actual.';
    }
  }
}

class _BalanceCard extends StatelessWidget {
  const _BalanceCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black,
        //gradient: const LinearGradient(colors: [Color.fromARGB(255, 0, 0, 0), Color.fromARGB(255, 89, 89, 89)]),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '\$42.734 IMC',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(
            '+24,5%',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class _CourseProgress extends StatelessWidget {
  final double progress;
  const _CourseProgress({required this.progress});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: LinearProgressIndicator(
        value: progress,
        backgroundColor: Colors.grey[200],
        valueColor: const AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 0, 0, 0)),
        minHeight: 12,
      ),
    );
  }
}

class SidebarScreen extends StatelessWidget {
  const SidebarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menú"),
        backgroundColor: const Color(0xFF4A90E2),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: const [
          ListTile(leading: Icon(Icons.person), title: Text('Mi Perfil')),
          ListTile(leading: Icon(Icons.settings), title: Text('Configuración')),
          ListTile(leading: Icon(Icons.notifications), title: Text('Notificaciones')),
          ListTile(leading: Icon(Icons.help_outline), title: Text('Ayuda')),
        ],
      ),
    );
  }
}
