import 'package:flutter/material.dart';

class ItemRegistrationPage extends StatefulWidget {
  const ItemRegistrationPage({super.key});

  @override
  _ItemRegistrationPageState createState() => _ItemRegistrationPageState();
}

class _ItemRegistrationPageState extends State<ItemRegistrationPage> {
  final _employeeNameController = TextEditingController();
  final _registrationController = TextEditingController();
  final _departmentController = TextEditingController();
  final _itemNameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _serialNumberController = TextEditingController();
  final _assetSerialNumberController = TextEditingController();
  final _itemStatusController = TextEditingController();

  @override
  void dispose() {
    // Libera os recursos dos controladores ao encerrar o widget
    _employeeNameController.dispose();
    _registrationController.dispose();
    _departmentController.dispose();
    _itemNameController.dispose();
    _descriptionController.dispose();
    _serialNumberController.dispose();
    _assetSerialNumberController.dispose();
    _itemStatusController.dispose();
    super.dispose();
  }

  bool _isFormValid() {
    return _employeeNameController.text.isNotEmpty &&
        _registrationController.text.isNotEmpty &&
        _itemNameController.text.isNotEmpty;
  }

  void _addItem() {
    // Exemplo de saída no console
    print('Item adicionado: ${_itemNameController.text}');
    print('Funcionário: ${_employeeNameController.text}');
    print('Departamento: ${_departmentController.text}');
    // Lógica para salvar o item (adicionar à base de dados ou lista)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Itens'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Informações do Funcionário',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _employeeNameController,
              decoration:
                  const InputDecoration(labelText: 'Nome do Funcionário'),
            ),
            TextField(
              controller: _registrationController,
              decoration: const InputDecoration(labelText: 'Matrícula'),
            ),
            TextField(
              controller: _departmentController,
              decoration: const InputDecoration(labelText: 'Departamento'),
            ),
            const Divider(height: 40),
            const Text(
              'Informações do Item',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _itemNameController,
              decoration: const InputDecoration(labelText: 'Nome do Item'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Descrição do Item'),
            ),
            TextField(
              controller: _serialNumberController,
              decoration: const InputDecoration(labelText: 'Número de Série'),
            ),
            TextField(
              controller: _assetSerialNumberController,
              decoration:
                  const InputDecoration(labelText: 'Número de Série do Bem'),
            ),
            TextField(
              controller: _itemStatusController,
              decoration: const InputDecoration(labelText: 'Status do Item'),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _isFormValid() ? _addItem : null,
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                child: const Text('Adicionar Item'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
