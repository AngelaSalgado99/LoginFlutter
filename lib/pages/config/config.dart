import 'package:flutter/material.dart';
import '../../widgets/appbar.dart';

class ConfigScreen extends StatelessWidget {
  const ConfigScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar personalizado en la parte superior
      appBar: const CustomAppBar(
        title: 'Configuración',
        showBackButton: false, // no muestra botón "atrás"
      ),
      // El contenido de la pantalla puede desplazarse
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sección Cuenta
              const Text(
                'Cuenta',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              // Opción: Cambiar Email
              _buildOptionCard(
                context,
                icon: Icons.email,
                title: 'Cambiar Email',
                subtitle: 'Actualiza tu dirección de correo electrónico',
                onTap: () {
                  // Navegar a pantalla cambiar email
                },
              ),
              // Opción: Cambiar Contraseña
              _buildOptionCard(
                context,
                icon: Icons.lock,
                title: 'Cambiar Contraseña',
                subtitle: 'Establece una nueva contraseña segura',
                onTap: () {
                  // Navegar a pantalla cambiar contraseña
                },
              ),

              const SizedBox(height: 20),

              // Sección Apariencia
              const Text(
                'Apariencia',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              // Opción: Tema de la App
              _buildOptionCard(
                context,
                icon: Icons.color_lens,
                title: 'Tema de la App',
                subtitle: 'Personaliza colores y aspecto',
                onTap: () {
                  // Navegar a cambiar tema
                },
              ),
              // Opción: Idioma
              _buildOptionCard(
                context,
                icon: Icons.language,
                title: 'Idioma',
                subtitle: 'Selecciona el idioma de la aplicación',
                onTap: () {
                  // Navegar a cambiar idioma
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

// Método privado reutilizable para construir tarjetas de configuración.
  /// Cada tarjeta (`Card`) muestra:
  /// - Ícono (izquierda)
  /// - Título y subtítulo (texto)
  /// - Flecha indicadora (derecha)
  /// - Acción `onTap` al tocarla
  Widget _buildOptionCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(vertical: 6),
      elevation: 2,
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).primaryColor),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap, // acción al pulsar
      ),
    );
  }
}
