import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tracking_app/core/constants/keys.dart';
import 'package:tracking_app/features/auth/presentation/view/Success_apply.dart';

void main() {


  testWidgets('Button tap test', (WidgetTester tester) async {

    final loginButton =find.byKey(ValueKey(TestKeys.successApplyLogin));
    await tester.pumpWidget(MaterialApp(home: SuccessApply(),));
    await tester.tap(loginButton);
    await tester.pump();
  });

}