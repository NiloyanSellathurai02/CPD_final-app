import 'package:flutter/material.dart';

class ManagePage extends StatelessWidget {
  const ManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300], // Achtergrondkleur
      appBar: AppBar(
        backgroundColor: const Color(0xFF680735), // Donkerpaarse kleur
        title: const Text('Beheer'),
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
              _buildButton(context, 'BEKIJK MIJN TEAM', const Color(0xFF680735)),
              _buildButton(context, 'MAAK TEAM AAN', const Color(0xFF680735)),
              _buildButton(context, 'TEAM BINNENGAAN', const Color(0xFF680735)),
              _buildButton(context, 'TEAM VERLATEN', const Color(0xFF680735)),
              const SizedBox(height: 20),
              // Uitlogknop
              _buildButton(
                context,
                'UITLOGGEN',
                Colors.white,
                textColor: Colors.red,
                borderColor: Colors.black,
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
      Color backgroundColor, {
        Color textColor = Colors.white,
        Color borderColor = Colors.transparent,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12), // Brede knoppen
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor, // Achtergrondkleur
          padding: const EdgeInsets.symmetric(vertical: 16), // Hoogte van de knop
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // Afgeronde hoeken
            side: BorderSide(color: borderColor, width: 2), // Randkleur en breedte
          ),
        ),
        onPressed: () {
          // Voeg functionaliteit toe voor elke knop
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
    );
  }
}
