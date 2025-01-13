import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  // Função para simular o tipo de usuário
  String _getUserType(String username) {
    // Aqui você pode fazer uma consulta ao banco de dados ou API para obter o tipo de usuário
    // Exemplo fictício:
    if (username == 'admin') {
      return 'admin';
    }
    return 'user';
  }

  void _login() {
    final username = _usernameController.text;
    final password = _passwordController.text;

    // Lógica de autenticação fictícia
    if (username == 'admin' && password == 'admin123') {
      // Se o login for bem-sucedido e o tipo de usuário for admin
      _navigateToDashboard();
    } else if (username == 'user' && password == 'user123') {
      // Se o login for bem-sucedido e o tipo de usuário for comum
      _navigateToItemRegistration();
    } else {
      // Falha na autenticação
      print('Usuário ou senha inválidos');
    }
  }

  // Função de navegação para a página de itens cadastrados pelo usuário
  void _navigateToItemRegistration() {
    Navigator.pushReplacementNamed(context, '/items');
  }

  // Função de navegação para o dashboard de admin
  void _navigateToDashboard() {
    Navigator.pushReplacementNamed(context, '/dashboard');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            constraints:
                BoxConstraints(maxWidth: 400), // Limita a largura do formulário
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 20),
                const Text(
                  'Bem-vindo!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Usuário',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _login,
                  child: const Text('Entrar'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text('Cadastrar-se'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
