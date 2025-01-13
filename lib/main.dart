import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'screens/login.dart';
import 'screens/registration_screen.dart';
import 'screens/item_registration_screen.dart';
import 'screens/user_list_screen.dart';
import 'screens/dashboard.dart';
import 'package:flutter_animate/flutter_animate.dart';

Future<void> main() async {
  // Carregar as variáveis de ambiente do arquivo .env
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestão de Itens',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(), // Tela de splash
        '/login': (context) => const LoginPage(), // Página de login
        '/register': (context) =>
            const RegistrationPage(), // Cadastro de usuário
        '/items': (context) =>
            const ItemRegistrationPage(), // Cadastro de itens
        '/users': (context) => UserListPage(), // Listagem de usuários
        '/dashboard': (context) => DashboardPage(), // Página do dashboard
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navegar para a página de login após 3 segundos
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 102, 44),
      body: Center(
        child: Animate(
          effects: [
            FadeEffect(duration: 1500.ms), // Fade in
            ScaleEffect(duration: 1500.ms), // Animação de escala
            SlideEffect(
                duration: 1500.ms, begin: Offset(0, -0.1)), // Deslizar de cima
          ],
          child: Text(
            'SEMOP',
            style: TextStyle(
              fontSize: 64,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
