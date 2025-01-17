import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:CPD_final_app/screens/home_page.dart';

void main() {
  group('HomePage Widget Tests', () {
    testWidgets('Verifies buttons are displayed', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
        ),
      );

      // Controleer of de vier knoppen aanwezig zijn
      expect(find.text('TEAMS'), findsOneWidget);
      expect(find.text('BEHEER'), findsOneWidget);
      expect(find.text('WEDSTRIJDEN'), findsOneWidget);
      expect(find.text('EVENTS'), findsOneWidget);
    });

    testWidgets('Snackbar appears when token is missing for TEAMS', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
        ),
      );

      // Simuleer een tap op de "TEAMS"-knop
      await tester.tap(find.text('TEAMS'));
      await tester.pump(); // Trigger een frame-update

      // Controleer of de snackbar verschijnt
      expect(find.text('Geen toegangstoken gevonden. Log opnieuw in.'), findsOneWidget);
    });

    testWidgets('Navigates to /teams when token is provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (context) => const HomePage(),
            '/teams': (context) => Scaffold(
              appBar: AppBar(
                title: const Text('Teams Page'),
              ),
            ),
          },
        ),
      );

      // Simuleer een tap op de "TEAMS"-knop met een token
      await tester.pumpWidget(MaterialApp(
        home: HomePage(),
      ));
      await tester.tap(find.text('TEAMS'));
      await tester.pumpAndSettle();

      // Controleer of de navigatie naar "/teams" correct is
      expect(find.text('Teams Page'), findsOneWidget);
    });
  });
}
