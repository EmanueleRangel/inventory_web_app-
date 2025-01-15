import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "http://127.0.0.1:8000/"; // URL da API

  // Método para obter itens
  Future<List<Map<String, dynamic>>> fetchItems() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> items = json.decode(response.body);
      return items.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load items: ${response.reasonPhrase}');
    }
  }

  // Método para criar um novo item
  Future<Map<String, dynamic>> createItem(Map<String, dynamic> itemData) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(itemData),
    );

    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to create item: ${response.reasonPhrase}');
    }
  }

  // Método para obter o gráfico como JSON
  Future<Map<String, dynamic>> fetchGraph() async {
    final response = await http.get(Uri.parse('$baseUrl/grafico'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load graph: ${response.reasonPhrase}');
    }
  }

  // Método para obter o gráfico como HTML
  Future<String> fetchGraphHtml() async {
    final response = await http.get(
      Uri.parse('$baseUrl/grafico'),
      headers: {'Accept': 'text/html'},
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load graph HTML: ${response.reasonPhrase}');
    }
  }
}
// ------------------ Rotas de Usuários ------------------

final String baseUrl = "http://127.0.0.1:8000"; // Base URL da API

// Método para criar um novo usuário
Future<Map<String, dynamic>> createUser(Map<String, dynamic> userData) async {
  final response = await http.post(
    Uri.parse('$baseUrl/usuarios/create_user'),
    headers: {'Content-Type': 'application/json'},
    body: json.encode(userData),
  );

  if (response.statusCode == 201) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to create user: ${response.reasonPhrase}');
  }
}

// Método para obter a lista de usuários
Future<List<Map<String, dynamic>>> fetchUsers() async {
  final response = await http.get(Uri.parse('$baseUrl/usuarios/users_list'));

  if (response.statusCode == 200) {
    List<dynamic> users = json.decode(response.body);
    return users.cast<Map<String, dynamic>>();
  } else {
    throw Exception('Failed to load users: ${response.reasonPhrase}');
  }
}
