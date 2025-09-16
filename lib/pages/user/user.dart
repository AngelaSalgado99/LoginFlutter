import 'package:flutter/material.dart';
import '../../widgets/appbar.dart';

// Pantalla que muestra el perfil del usuario.
// Recibe un [username] y un [password] como parámetros.
class UserScreen extends StatelessWidget {
  final String username;
  final String password;

  const UserScreen({
    super.key,
    required this.username,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior personalizada con título y botón de retroceso.
      appBar:
          const CustomAppBar(title: 'Perfil de Usuario', showBackButton: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Avatar del usuario (icono de persona dentro de un círculo).
            const Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.blue,
                child: Icon(Icons.person, size: 70, color: Colors.white),
              ),
            ),
            const SizedBox(height: 30),

             // Tarjeta con información básica del usuario.
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Nombre de usuario.
                    _buildInfoRow('Usuario:', username),
                    const SizedBox(height: 15),
                    // Email ficticio basado en el nombre de usuario.
                    _buildInfoRow('Email:', '$username@demo.com'),
                    const SizedBox(height: 15),
                    // Contraseña oculta con asteriscos, mostrando cantidad de caracteres.
                    _buildInfoRow('Contraseña:',
                        '${'*' * password.length} (${password.length} caracteres)'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Botón para futuras funcionalidades de edición del perfil.
            ElevatedButton(
              onPressed: () {},
              // Aquí puedes navegar a una pantalla de edición de perfil.
              child: const Text('Editar Perfil'),
            ),
          ],
        ),
      ),
    );
  }

// Método auxiliar que construye una fila de información
  /// con una etiqueta [label] y su valor [value].
  Widget _buildInfoRow(String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(width: 10),
        Text(
          value,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}