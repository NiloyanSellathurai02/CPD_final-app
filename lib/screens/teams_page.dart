import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TeamsPage extends StatefulWidget {
  const TeamsPage({super.key});

  @override
  State<TeamsPage> createState() => _TeamsPageState();
}

class _TeamsPageState extends State<TeamsPage> {
  List<String> teams = [];
  String? errorMessage;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final String? token = ModalRoute.of(context)?.settings.arguments as String?;
    if (token != null) {
      _fetchTeams(token);
    } else {
      setState(() {
        errorMessage = "Access token ontbreekt.";
      });
    }
  }

  Future<void> _fetchTeams(String token) async {
    final url = Uri.parse('https://team-management-api.dops.tech/api/v2/teams');

    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          teams = List<String>.from(data['data'].map((team) => team['name']));
        });
      } else {
        final errorData = jsonDecode(response.body);
        setState(() {
          errorMessage = errorData['error'] ?? 'Kan teams niet ophalen.';
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF680735), // Donkerpaars
        title: const Text('Teams'),
      ),
      body: errorMessage != null
          ? Center(
        child: Text(
          errorMessage!,
          style: const TextStyle(color: Colors.red, fontSize: 16),
        ),
      )
          : teams.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 kolommen
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: teams.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: const Color(0xFF680735),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                teams[index],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }
}
