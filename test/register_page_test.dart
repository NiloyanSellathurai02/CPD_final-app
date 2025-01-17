import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:CPD_final_app/main.dart';

void main() {
  testWidgets('RegisterPage loads correctly', (WidgetTester tester) async {
    await tester.pumpWidget(GatherlyApp());

    // Simuleer navigatie naar de RegisterPage
    await tester.tap(find.text('Register'));
    await tester.pumpAndSettle();

    // Controleer of de RegisterPage wordt geladen
    expect(find.text('Register'), findsOneWidget);
  });
}
