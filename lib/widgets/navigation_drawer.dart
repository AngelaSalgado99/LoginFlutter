import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final String username;
  final Function(int) onItemSelected;
  final VoidCallback onLogout;
  final int currentIndex;

  const CustomDrawer({
    super.key,
    required this.username, // Nombre del usuario
    required this.onItemSelected, // Callback al seleccionar un ítem
    required this.onLogout, // Acción al cerrar sesión
    required this.currentIndex, // Índice de opción activa
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildHeader(context), // Encabezado con avatar y datos
          _buildMenuItems(context),// Opciones de menú
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return DrawerHeader(
      // Fondo con color principal y un degradado
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor.withOpacity(0.8),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar con ícono de usuario
          const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.person,
              size: 40,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 15),

          // Nombre del usuario
          Text(
            username,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          // Correo electrónico de ejemplo
          Text(
            'usuario@demo.com',
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItems(BuildContext context) {
    return Column(
      children: [
        _buildListTile(
          context,
          Icons.home,
          'Inicio',
          0,
          currentIndex == 0,
        ),
        _buildListTile(
          context,
          Icons.person,
          'Mi Perfil',
          1,
          currentIndex == 1,
        ),
        _buildListTile(
          context,
          Icons.settings,
          'Configuración',
          2,
          currentIndex == 2,
        ),
        const Divider(),
        _buildListTile(
          context,
          Icons.notifications,
          'Notificaciones',
          3,
          false,
        ),
        _buildListTile(
          context,
          Icons.help,
          'Ayuda',
          4,
          false,
        ),
        _buildListTile(
          context,
          Icons.info,
          'Acerca de',
          5,
          false,
        ),
        const Divider(),
        _buildLogoutTile(context),
      ],
    );
  }

  Widget _buildListTile(
    BuildContext context,
    IconData icon,
    String title,
    int index,
    bool isSelected,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? Theme.of(context).primaryColor : Colors.grey[700],
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected ? Theme.of(context).primaryColor : Colors.black87,
        ),
      ),
      trailing: isSelected
          ? Icon(
              Icons.arrow_forward,
              color: Theme.of(context).primaryColor,
              size: 20,
            )
          : null,
      onTap: () => onItemSelected(index),
      selected: isSelected,
      selectedTileColor: Theme.of(context).primaryColor.withOpacity(0.1),
    );
  }

  Widget _buildLogoutTile(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.logout, color: Colors.red),
      title: const Text(
        'Cerrar Sesión',
        style: TextStyle(color: Colors.red),
      ),
      onTap: () {
        Navigator.pop(context); // Cerrar el drawer
        onLogout();
      },
    );
  }
}