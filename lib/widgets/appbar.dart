import 'package:flutter/material.dart';

/// Widget personalizado que extiende de [AppBar] para tener mayor control
/// sobre el título, acciones, botón de retroceso o menú lateral.
/// Implementa [PreferredSizeWidget] para definir la altura estándar de la barra.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  // Título que se mostrará en la AppBar.
  final String title;
  // Lista de widgets que se mostrarán como acciones (por ejemplo íconos a la derecha).
  final List<Widget>? actions;
  // Indica si se debe mostrar el botón de retroceso (`true`) o no (`false`).
  final bool showBackButton;

  // Función callback opcional que se ejecuta al presionar el botón de menú.
  /// Solo se muestra si [showBackButton] es `false` y [onMenuPressed] no es `null`.
  final VoidCallback? onMenuPressed;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.showBackButton = false,
    this.onMenuPressed,
  });

  // Define la altura preferida de la AppBar.
  /// Usa la constante [kToolbarHeight] para mantener la altura estándar.
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // Texto del título centrado.
      title: Text(title),
      centerTitle: true,

      // Colores adaptados al tema principal de la app.
      backgroundColor: Theme.of(context).primaryColor,
      foregroundColor: Colors.white,

      // Si [showBackButton] es `true`, muestra automáticamente el botón de retroceso.
      automaticallyImplyLeading: showBackButton,

      // Configuración del botón a la izquierda (leading).
      leading: showBackButton
          ? null
          : onMenuPressed != null
              ? IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: onMenuPressed, // Ejecuta el callback al presionar menú.
                )
              : null,
      // Widgets adicionales que aparecen a la derecha.
      actions: actions,
    );
  }
}