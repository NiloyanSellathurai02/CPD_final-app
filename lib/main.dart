import 'package:flutter/material.dart';
import 'screens/login_page.dart';
import 'screens/register_page.dart';
import 'screens/home_page.dart';
import 'screens/teams_page.dart';
import 'screens/manage_page.dart';

void main() {
  runApp(GatherlyApp());
}

class GatherlyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/register': (context) => const RegisterPage(),
        '/login': (context) => const LoginPage(),
        '/teams': (context) => const TeamsPage(),
        '/manage': (context) => const ManagePage(),
      },



    );
  }
}
