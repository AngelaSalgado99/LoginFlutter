class Validators {
  // Validar usuario: 4-16 caracteres, letras, números o guion bajo
  static String? username(String? value) {
    print("👤 Username: $value");
    if (value == null || value.isEmpty) {
      return 'Por favor ingrese su usuario';
    }
    final regex = RegExp(r'^[a-zA-Z0-9_]{4,16}$');
    if (!regex.hasMatch(value)) {
      return 'Usuario inválido (4-16 caracteres, solo letras, números o _)';
    }
    return null;
  }

  // Validar email
  static String? email(String? value) {
    print("📧 Email: $value");
    if (value == null || value.isEmpty) {
      return 'Por favor ingrese su correo';
    }
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!regex.hasMatch(value)) {
      return 'Correo electrónico inválido';
    }
    return null;
  }

  // Validar contraseña: al menos 8 caracteres, 1 mayúscula, 1 minúscula, 1 número y 1 símbolo
  static String? password(String? value) {
    print("🔑 Password: $value");
    if (value == null || value.isEmpty) {
      return 'Por favor ingrese su contraseña';
    }
    final regex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%?&])[A-Za-z\d@$!%?&]{8,16}$',
    );
    if (!regex.hasMatch(value)) {
      return 'Minimo 8 caracteres, incluir al menos una mayúscula, una minúscula, un número y un caracter especial';
    }
    return null;
  }

}