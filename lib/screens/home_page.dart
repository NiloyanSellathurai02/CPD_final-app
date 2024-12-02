import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Haal het token op uit de arguments
    final String? token = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      backgroundColor: Colors.grey[300], // Achtergrondkleur
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App logo
              Image.asset(
                'assets/images/logo.png',
                height: 180,
              ),
              const SizedBox(height: 30),
              // Grid of buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final isMobile = constraints.maxWidth < 600;
                    return GridView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isMobile ? 2 : 4, // 2 kolommen op mobiel, 4 op grotere schermen
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ),
                      children: [
                        // Teams button
                        _buildFeatureButton(
                          context: context,
                          label: 'TEAMS',
                          icon: Icons.group,
                          onTap: () {
                            if (token != null) {
                              Navigator.pushNamed(
                                context,
                                '/teams',
                                arguments: token, // Geef het token door
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Geen toegangstoken gevonden. Log opnieuw in.'),
                                ),
                              );
                            }
                          },
                        ),
                        // Voeg andere knoppen toe indien nodig
                        _buildFeatureButton(
                          context: context,
                          label: 'PLANNING',
                          icon: Icons.schedule,
                          onTap: () {
                            print("Planning geklikt");
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
                        _buildFeatureButton(
                          context: context,
                          label: 'WEDSTRIJDEN',
                          icon: Icons.sports,
                          onTap: () {
                            print("Wedstrijden geklikt");
                          },
                        ),
                      ],
                    );
                  },
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
        decoration: BoxDecoration(
          color: const Color(0xFF680735), // Donkerpaarse kleur
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 50,
            ),
            const SizedBox(height: 10),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
