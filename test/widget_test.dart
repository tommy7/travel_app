import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:andoird_app_mh/main.dart';

void main() {
  testWidgets('Travel App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const TravelApp());

    // Verify that our app starts with the correct title.
    expect(find.text('Travel Explorer'), findsOneWidget);

    // Verify that we have some destination cards (e.g., Paris).
    expect(find.text('Paris'), findsOneWidget);
    expect(find.text('Tokyo'), findsOneWidget);

    // Verify that the profile icon is present.
    expect(find.byIcon(Icons.person), findsOneWidget);
  });
}
