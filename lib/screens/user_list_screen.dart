import 'package:flutter/material.dart';

class UserListPage extends StatelessWidget {
  final List<Map<String, String>> users;

  // Usando o super.key para o construtor
  UserListPage({super.key})
      : users = [
          {
            'first_name': 'João',
            'last_name': 'Silva',
            'email': 'joao@example.com'
          },
          {
            'first_name': 'Maria',
            'last_name': 'Oliveira',
            'email': 'maria@example.com'
          },
        ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuários'),
        centerTitle: true,
      ),
      body: users.isEmpty
          ? const Center(
              child: Text(
                'Nenhum usuário encontrado.',
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text(
                        user['first_name']![0].toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Text(
                      '${user['first_name']} ${user['last_name']}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(user['email']!),
                    trailing: Wrap(
                      spacing: 12, // Espaço entre os ícones
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {
                            // Lógica para editar o usuário
                            print('Editar usuário: ${user['email']}');
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            // Lógica para remover o usuário
                            print('Remover usuário: ${user['email']}');
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
