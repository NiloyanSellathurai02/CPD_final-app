import 'package:flutter/material.dart';
import 'screens/login_page.dart';
import 'screens/register_page.dart';
import 'screens/home_page.dart';
import 'screens/teams_page.dart';
import 'screens/manage_page.dart';
import 'screens/create_team_page.dart';

void main() {
  runApp(GatherlyApp());
}

class GatherlyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/register': (context) => const RegisterPage(),
        '/teams': (context) => const TeamsPage(),
        '/manage': (context) => const ManagePage(),
        '/createTeam': (context) => CreateTeamScreen(), // Redirect to create page for teams

      },



    );
  }
}
