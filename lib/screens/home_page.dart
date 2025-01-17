import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final String? token = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App logo
              Image.asset(
                'assets/images/logo.png',
                height: 200, // Groter logo
              ),
              const SizedBox(height: 40),
              // Grid met vier grotere knoppen
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Wrap(
                  spacing: 24, // Meer ruimte tussen de knoppen
                  runSpacing: 24,
                  alignment: WrapAlignment.center,
                  children: [
                    _buildFeatureButton(
                      context: context,
                      label: 'TEAMS',
                      icon: Icons.group,
                      onTap: () {
                        if (token != null) {
                          Navigator.pushNamed(context, '/teams', arguments: token);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Geen toegangstoken gevonden. Log opnieuw in.'),
                            ),
                          );
                        }
                      },
                    ),
                    _buildFeatureButton(
                      context: context,
                      label: 'BEHEER',
                      icon: Icons.settings,
                      onTap: () {
                        if (token != null) {
                          Navigator.pushNamed(context, '/manage', arguments: token);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Geen toegangstoken gevonden. Log opnieuw in.'),
                            ),
                          );
                        }
                      },
                    ),
                    _buildFeatureButton(
                      context: context,
                      label: 'WEDSTRIJDEN',
                      icon: Icons.emoji_events,
                      onTap: () {
                        print("Wedstrijden geklikt");
                      },
                    ),
                    _buildFeatureButton(
                      context: context,
                      label: 'EVENTS',
                      icon: Icons.event,
                      onTap: () {
                        print("Events geklikt");
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureButton({
    required BuildContext context,
    required String label,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160, // Grotere breedte
        height: 160, // Grotere hoogte
        decoration: BoxDecoration(
          color: const Color(0xFF680735), // Donkerpaarse kleur
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 60, // Groter icoon
            ),
            const SizedBox(height: 12),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20, // Grotere tekst
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
