import 'package:flutter/material.dart';
import '../../widgets/appbar.dart';
import '../../valid/validator.dart';

class UserFormScreen extends StatefulWidget {
  const UserFormScreen({super.key});

  @override
  State<UserFormScreen> createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  // Clave global para manejar el estado del formulario y sus validaciones.
  final _formKey = GlobalKey<FormState>();
   // Controladores de texto para capturar la información del usuario.
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  // Método para registrar un nuevo usuario.
  /// - Valida que todos los campos sean correctos.
  /// - Verifica que las contraseñas coincidan.
  /// - Devuelve los datos del usuario a la pantalla anterior con Navigator.pop().
  void _register() {
    if (_formKey.currentState!.validate()) {
      // Validar coincidencia de contraseñas.
      if (_passwordController.text != _confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Las contraseñas no coinciden')),
        );
        return;
      }

     // Crear objeto con datos del usuario.
      final userData = {
        'username': _usernameController.text,
        'password': _passwordController.text,
        'email': _emailController.text,
      };

      // Retornar datos y cerrar pantalla.
      Navigator.pop(context, userData);
    }
  }

  // Cancela el registro y regresa a la pantalla anterior sin devolver datos.
  void _cancel() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior personalizada.
      appBar:
          const CustomAppBar(title: 'Registrar Usuario', showBackButton: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Image.asset(
                'assets/img/logos/stamp.webp',
                height: 100,
              ),
              const SizedBox(height: 20),

              // Campo: Usuario.
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Usuario',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: Validators.username, // Valida formato de usuario.
              ),
              const SizedBox(height: 20),

              // Campo: Email.
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: Validators.email, // Valida formato de email.
              ),
              const SizedBox(height: 20),

              // Campo: Contraseña.
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
                obscureText: true, // Oculta la contraseña.
                validator: Validators.password, // Valida formato de contraseña.
              ),
              const SizedBox(height: 20),

              // Campo: Confirmar contraseña.
              TextFormField(
                controller: _confirmPasswordController,
                decoration: const InputDecoration(
                  labelText: 'Confirmar Contraseña',
                  prefixIcon: Icon(Icons.lock_outline),
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor confirme su contraseña';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),

              // Botones de acción: Registrar y Cancelar.
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _register,
                      child: const Text('Registrar'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _cancel,
                      child: const Text('Cancelar'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}