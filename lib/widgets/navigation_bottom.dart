import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex; // Índice de la pestaña seleccionada
  final Function(int) onTap; // Callback al presionar un ítem

  const BottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex, // Ítem activo
      onTap: onTap, // Acción al pulsar
      selectedItemColor: Theme.of(context).primaryColor, // Color del ítem seleccionado
      unselectedItemColor: Colors.grey, // Color de ítems no seleccionados
      showUnselectedLabels: true,  // Mostrar etiquetas de ítems no activos
      type: BottomNavigationBarType.fixed, // Ítems fijos
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Configuración',
        ),
      ],
    );
  }
}