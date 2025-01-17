import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:CPD_final_app/main.dart';

void main() {
  testWidgets('App initializes with LoginPage', (WidgetTester tester) async {
    // Bouw de applicatie en trigger een frame
    await tester.pumpWidget( GatherlyApp());

    // Controleer of de LoginPage wordt geladen
    expect(find.text('Login'), findsWidgets); // Zorg dat dit overeenkomt met jouw LoginPage
  });
}
