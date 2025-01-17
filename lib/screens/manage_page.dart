import 'package:flutter/material.dart';

class ManagePage extends StatelessWidget {
  const ManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Token ophalen uit de route-argumenten
    final String? token = ModalRoute.of(context)?.settings.arguments as String?;

    // Controleer of de token aanwezig is
    if (token == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Beheer'),
          backgroundColor: const Color(0xFF680735),
        ),
        body: const Center(
          child: Text(
            'Geen token gevonden. Log opnieuw in.',
            style: TextStyle(color: Colors.red, fontSize: 18),
          ),
        ),
      );
    }

    // Schermbreedte ophalen
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[300], // Achtergrondkleur
      appBar: AppBar(
        backgroundColor: const Color(0xFF680735), // Donkerpaarse kleur
        title: const Text('Beheer'),
        centerTitle: true, // Centraal uitgelijnde titel
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo bovenaan
              Image.asset(
                'assets/images/logo.png',
                height: 180, // Logo hoogte
              ),
              const SizedBox(height: 40),
              // Knoppenlijst
              _buildButton(
                context,
                'BEKIJK MIJN TEAM',
                const Color(0xFF680735),
                screenWidth,
              ),
              _buildButton(
                context,
                'MAAK TEAM AAN',
                const Color(0xFF680735),
                screenWidth,
                onPressed: () {
                  // Navigeren naar CreateTeamScreen met token
                  Navigator.pushNamed(
                    context,
                    '/createTeam',
                    arguments: token, // Token doorgeven
                  );
                },
              ),
              _buildButton(
                context,
                'TEAM BINNENGAAN',
                const Color(0xFF680735),
                screenWidth,
              ),
              _buildButton(
                context,
                'TEAM VERLATEN',
                const Color(0xFF680735),
                screenWidth,
              ),
              const SizedBox(height: 20),
              // Uitlogknop
              _buildButton(
                context,
                'UITLOGGEN',
                Colors.white,
                screenWidth,
                textColor: Colors.red,
                borderColor: Colors.black,
                onPressed: () {
                  // Logica voor uitloggen
                  Navigator.pop(context); // Terug naar login-scherm
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(
      BuildContext context,
      String text,
      Color backgroundColor,
      double screenWidth, {
        Color textColor = Colors.white,
        Color borderColor = Colors.transparent,
        VoidCallback? onPressed, // Optionele callback
      }) {
    // Bereken knopbreedte afhankelijk van schermgrootte
    double buttonWidth;
    if (screenWidth > 900) {
      // Web: nog korter
      buttonWidth = screenWidth * 0.3; // 30% van de schermbreedte
    } else if (screenWidth > 600) {
      // Tablet: iets breder
      buttonWidth = screenWidth * 0.6; // 60% van de schermbreedte
    } else {
      // Mobiel: bijna volledig scherm
      buttonWidth = screenWidth * 0.8; // 80% van de schermbreedte
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10), // Verticale ruimte tussen knoppen
      child: SizedBox(
        width: buttonWidth, // Dynamische breedte
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor, // Achtergrondkleur
            padding: const EdgeInsets.symmetric(vertical: 18), // Hoogte van de knop
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // Afgeronde hoeken
              side: BorderSide(color: borderColor, width: 2), // Randkleur en breedte
            ),
          ),
          onPressed: onPressed ??
                  () {
                // Standaard functionaliteit als er geen onPressed is opgegeven
                print('$text knop is geklikt');
              },
          child: Text(
            text,
            style: TextStyle(
              color: textColor, // Tekstkleur
              fontSize: 18, // Lettergrootte
              fontWeight: FontWeight.bold, // Tekst vetgedrukt
            ),
          ),
        ),
      ),
    );
  }
}
