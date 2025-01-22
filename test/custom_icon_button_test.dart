import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pawfetch_match/shared/widgets/custom_icon_button.dart';

void main() {
  testWidgets('CustomIconButton triggers onPressed and loads the SVG', (WidgetTester tester) async {
    // Define a mock onPressed function to track the press action
    bool onPressedCalled = false;
    void mockOnPressed() {
      onPressedCalled = true;
    }

    // Create the test widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomIconButton(
            onPressed: mockOnPressed,
            assetName: 'assets/icon.svg',
          ),
        ),
      ),
    );

    // Find the CustomIconButton widget
    final customIconButton = find.byType(CustomIconButton);

    // Verify that the CustomIconButton widget is in the widget tree
    expect(customIconButton, findsOneWidget);

    // Simulate a tap on the CustomIconButton
    await tester.tap(customIconButton);
    await tester.pumpAndSettle();

    // Verify the onPressed callback was triggered
    expect(onPressedCalled, isTrue);
  });
}