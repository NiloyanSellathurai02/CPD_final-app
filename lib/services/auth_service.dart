import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://team-management-api.dops.tech/api/v2';

  // Methode voor inloggen
  Future<String> login(String name, String password) async {
    final url = Uri.parse('$baseUrl/auth/login');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': name, 'password': password}),
    );

    // Debugging: Log de response
    print('Statuscode: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      // JSON-decoding
      final data = jsonDecode(response.body);

      // Controleren of de token aanwezig is
      if (data.containsKey('data') && data['data'].containsKey('token')) {
        return data['data']['token']; // Token ophalen
      } else {
        throw Exception('Inloggen mislukt: Token ontbreekt.');
      }
    } else {
      // Foutafhandeling voor andere statuscodes
      final errorData = jsonDecode(response.body);
      throw Exception(errorData['error'] ?? 'Inloggen mislukt.');
    }
  }

  // Methode voor registreren
  Future<String> register(String name, String password) async {
    final url = Uri.parse('$baseUrl/auth/register');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': name, 'password': password}),
    );

    // Debugging: Log de response
    print('Statuscode: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 201) {
      return 'Registratie succesvol!';
    } else {
      // Foutafhandeling voor registreren
      final errorData = jsonDecode(response.body);
      throw Exception(errorData['error'] ?? 'Registratie mislukt.');
    }
  }
}
