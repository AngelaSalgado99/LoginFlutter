import 'package:flutter/material.dart';
import '../../widgets/appbar.dart';
import '../../widgets/navigation_drawer.dart';
import '../../widgets/navigation_bottom.dart';
import '../user/user.dart';
import '../auth/login.dart';
import '../config/config.dart';

class HomeScreen extends StatefulWidget {
  final String username;
  final String password;

  const HomeScreen({
    super.key,
    required this.username,
    required this.password,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Índice actual de la pestaña seleccionada
  int _currentIndex = 0;
  // Controlador para manejar el PageView
  final PageController _pageController = PageController();
  // Llave para controlar el estado del Scaffold (abrir/cerrar Drawer)
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Lista de páginas que se muestran en el PageView
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    // Inicializar las páginas que se pueden mostrar
    _pages = [
      HomeContent(username: widget.username), // página de inicio
      UserScreen(username: widget.username, password: widget.password), // perfil
      const ConfigScreen(), // configuración
    ];
  }

  // Método que se ejecuta cuando se selecciona un item del Drawer lateral
  void _onDrawerItemSelected(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.jumpToPage(index); // saltar directamente a la página
    });
    _scaffoldKey.currentState?.closeDrawer(); // cerrar Drawer
  }

  // Cerrar sesión: limpia el historial y vuelve al Login
  void _logout() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false, // elimina todas las rutas previas
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // Barra superior personalizada
      appBar: CustomAppBar(
        title: _getTitle(),
        showBackButton: false,
        onMenuPressed: () => _scaffoldKey.currentState?.openDrawer(),
      ),
      // Menú lateral (Drawer personalizado)
      drawer: CustomDrawer(
        username: widget.username,
        onItemSelected: _onDrawerItemSelected, // callback al seleccionar item
        onLogout: _logout, // callback cerrar sesión
        currentIndex: _currentIndex,
      ),
      // Cuerpo principal con PageView
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index; // actualizar índice cuando cambie de página
          });
        },
      ),
      // Barra de navegación inferior
      bottomNavigationBar: BottomNavigation(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _pageController.jumpToPage(index);
        },
      ),
    );
  }

  // Devuelve el título de la AppBar según la pestaña activa
  String _getTitle() {
    switch (_currentIndex) {
      case 0:
        return 'Inicio';
      case 1:
        return 'Perfil';
      case 2:
        return 'Configuración';
      default:
        return 'Mi App';
    }
  }
}

/// Contenido principal de la pantalla de Inicio.
///
/// - Muestra mensaje de bienvenida.
/// - Presenta un `Card` con información general.
/// - Muestra accesos rápidos con `GridView` en forma de cuadrícula.
class HomeContent extends StatelessWidget {
  final String username;

  const HomeContent({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Mensaje de bienvenida personalizado
          Text(
            '¡Bienvenido, $username!',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // Tarjeta informativa
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Icon(Icons.home, size: 50, color: Colors.blue),
                  SizedBox(height: 10),
                  Text('Esta es la pantalla principal de la aplicación'),
                  SizedBox(height: 10),
                  Text(
                    'Usa el menú lateral o la barra de navegación inferior para explorar las diferentes secciones.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Accesos rápidos con GridView
          GridView.count(
            shrinkWrap: true,  // se adapta dentro del Column
            crossAxisCount: 2, // dos columnas
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              _buildFeatureCard(Icons.person, 'Perfil', Colors.blue),
              _buildFeatureCard(Icons.settings, 'Configuración', Colors.green),
              _buildFeatureCard(Icons.notifications, 'Notificaciones', Colors.orange),
              _buildFeatureCard(Icons.help, 'Ayuda', Colors.purple),
            ],
          ),
        ],
      ),
    );
  }

  // Método helper para construir una tarjeta de acceso rápido
  Widget _buildFeatureCard(IconData icon, String title, Color color) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}