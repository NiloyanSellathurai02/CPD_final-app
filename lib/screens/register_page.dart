import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart'; // Voor meldingen/toasts
import '../services/auth_service.dart'; // Zorg dat je de juiste service importeert

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final ApiService apiService = ApiService();

  void registerUser() async {
    String name = nameController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (name.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      Fluttertoast.showToast(msg: 'Vul alle velden in.');
      return;
    }

    if (password != confirmPassword) {
      Fluttertoast.showToast(msg: 'Wachtwoorden komen niet overeen.');
      return;
    }

    try {
      String responseMessage = await apiService.register(name, password);
      Fluttertoast.showToast(msg: responseMessage);

      // Navigeer naar de loginpagina na succesvolle registratie
      Navigator.pushNamed(context, '/login');
    } catch (e) {
      Fluttertoast.showToast(msg: 'Registratie mislukt: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDEDED), // Achtergrondkleur
      body: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400), // Maximale breedte voor web
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  const SizedBox(height: 20),

                  // Titel
                  const Text(
                    'Registreer',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Gebruikersnaam / Email veld
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Gebruikersnaam / Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Wachtwoord veld
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Wachtwoord',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Herhaal Wachtwoord veld
                  TextField(
                    controller: confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Herhaal Wachtwoord',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Link naar Login
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text(
                      'Al een account? Login!',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Registreer knop
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF680735), // Donkerpaars zoals in mockup
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: registerUser, // Registreer logica
                      child: const Text(
                        'Registreer',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
