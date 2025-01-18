import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:CPD_final_app/screens/teams_page.dart';
import 'package:flutter/material.dart';

void main() {
  group('TeamsPage Integratietests', () {
    testWidgets('Toont teams die succesvol zijn opgehaald van de backend', (WidgetTester tester) async {
      // Mock een HTTP-server met voorbeelddata
      final mockResponseData = {
        "data": [
          {"id": 1, "name": "Team A"},
          {"id": 2, "name": "Team B"}
        ]
      };
      final mockClient = _MockClient((request) async {
        if (request.url.toString() == 'https://team-management-api.dops.tech/api/v2/teams') {
          return http.Response(jsonEncode(mockResponseData), 200);
        }
        return http.Response('Not Found', 404);
      });

      // Initialiseer de pagina met mock client
      await tester.pumpWidget(
        MaterialApp(
          home: TeamsPage(),
        ),
      );

      // Controleer dat de laadindicator eerst wordt weergegeven
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      // Wacht op de HTTP-respons en update van de UI
      await tester.pumpAndSettle();

      // Controleer dat de teams correct worden weergegeven
      expect(find.text('Team A'), findsOneWidget);
      expect(find.text('Team B'), findsOneWidget);
      expect(find.byType(GridView), findsOneWidget);
    });

    testWidgets('Toont foutmelding als de backend een fout retourneert', (WidgetTester tester) async {
      final mockClient = _MockClient((request) async {
        return http.Response(
          jsonEncode({'error': 'Kan teams niet ophalen.'}),
          500,
        );
      });

      await tester.pumpWidget(
        MaterialApp(
          home: TeamsPage(),
        ),
      );

      // Controleer dat de laadindicator eerst wordt weergegeven
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      // Wacht op de HTTP-respons en update van de UI
      await tester.pumpAndSettle();

      // Controleer dat de foutmelding wordt weergegeven
      expect(find.text('Kan teams niet ophalen.'), findsOneWidget);
    });
  });
}

class _MockClient extends http.BaseClient {
  final Future<http.Response> Function(http.Request) _handler;

  _MockClient(this._handler);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final response = await _handler(request as http.Request);
    return http.StreamedResponse(
      Stream.value(utf8.encode(response.body)),
      response.statusCode,
    );
  }
}
