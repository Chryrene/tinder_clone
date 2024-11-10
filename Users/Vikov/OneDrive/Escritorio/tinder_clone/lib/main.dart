import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tinder_clone/screens/settings_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/matches_screen.dart';
import 'screens/multi_step_login.dart'; // Asegúrate de importar la pantalla de inicio de sesión en varios pasos
import 'services/auth_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthService(),
      child: MaterialApp(
        title: 'Tinder Clone',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Roboto',
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          '/register': (context) => RegisterScreen(),
          '/home': (context) => HomeScreen(),
          '/profile': (context) => ProfileScreen(),
          '/matches': (context) => MatchesScreen(),
          '/settings': (context) => SettingsScreen(),
          '/multi_step_login': (context) =>
              MultiStepLoginScreen(), // Ruta añadida para la pantalla de inicio de sesión en varios pasos
        },
      ),
    );
  }
}
