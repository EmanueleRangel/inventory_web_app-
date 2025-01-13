import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({Key? key}) : super(key: key);

  // Dados simulados para itens cadastrados
  final List<Map<String, String>> items = [
    {
      'name': 'Computador',
      'description': 'Computador de mesa',
      'condição do item': 'Razoavel'
    },
    {
      'name': 'Cadeira',
      'description': 'Cadeira de escritório',
      'condição do item': 'boa'
    },
    {
      'name': 'Projetor',
      'description': 'Projetor de apresentações',
      'condição do item': 'Otima'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard - Admin'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              // Lógica de logout
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Itens Cadastrados',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Nome do Item')),
                    DataColumn(label: Text('Descrição')),
                    DataColumn(label: Text('Status')),
                    DataColumn(label: Text('Ações')),
                  ],
                  rows: items.map((item) {
                    return DataRow(cells: [
                      DataCell(Text(item['name']!)),
                      DataCell(Text(item['description']!)),
                      DataCell(Text(item['condição do item']!)),
                      DataCell(
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                // Lógica para editar o item
                                print('Editar item: ${item['name']}');
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                // Lógica para remover o item
                                print('Remover item: ${item['name']}');
                              },
                            ),
                          ],
                        ),
                      ),
                    ]);
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
