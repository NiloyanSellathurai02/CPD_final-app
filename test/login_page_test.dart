import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:CPD_final_app/main.dart';

void main() {
  testWidgets('LoginPage loads correctly', (WidgetTester tester) async {
    await tester.pumpWidget(GatherlyApp());
    expect(find.text('Login'), findsOneWidget);
    expect(find.byType(TextButton), findsWidgets);
  });
}
