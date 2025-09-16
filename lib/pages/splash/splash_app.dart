import 'package:flutter/material.dart';
import '../auth/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

    // Controlador para manejar la animación.
  late AnimationController _controller;
   // Animación que aplica un efecto de escala al logo.
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

  // Inicializa el controlador de animación con duración de 2 segundos.
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this, // Necesario porque la clase usa SingleTickerProviderStateMixin
    );

  // Aplica una curva de animación suave (easeInOut).
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

  // Inicia la animación al cargar la pantalla.
    _controller.forward();

  // Redirige automáticamente al LoginScreen después de 5 segundos.
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  void dispose() {
    // Libera los recursos del controlador de animación al cerrar la pantalla.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF48FB1), // Color de fondo rosado
      extendBodyBehindAppBar: true, // Permite que el contenido se extienda tras la AppBar
      body: Center(
        child: ScaleTransition(
          // Aplica la animación de escala al contenido.
          scale: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo de la aplicación.
              Image.asset(
                'assets/img/logos/stamp.webp',
                height: 100,
              ),
              const SizedBox(height: 20),
              // Nombre de la aplicación.
              const Text(
                'Mi tarea',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              // Indicador de carga circular.
              const CircularProgressIndicator(
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}