import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tracking_app/core/constants/keys.dart';
import 'package:tracking_app/features/auth/presentation/view/onboarding_screen.dart';

void main() {


  testWidgets('Button tap test', (WidgetTester tester) async {

    final loginButton =find.byKey(ValueKey(TestKeys.loginOnboarding));
    final applyButton =find.byKey(ValueKey(TestKeys.applyOnboarding));
     await tester.pumpWidget(MaterialApp(home: OnboardingScreen(),));
     await tester.tap(loginButton);
     await tester.tap(applyButton);
     await tester.pump();
  });

}