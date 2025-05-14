import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracking_app/core/constants/keys.dart';
import 'package:tracking_app/features/auth/presentation/view/success_delivery.dart';
import 'package:tracking_app/generated/codegen_loader.g.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues(
        {}); // Prevent MissingPluginException
    await EasyLocalization.ensureInitialized();
  });

  testWidgets('SuccessDelivery UI renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      EasyLocalization(
        supportedLocales: const [Locale('en')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        assetLoader: const CodegenLoader(),
        useOnlyLangCode: true,
        child: Builder(
          builder: (context) => MaterialApp(
            locale: context.locale,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            home: const SuccessDelivery(),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Check for translated texts
    expect(find.text(tr(LocaleKeys.successDelivery_thank_you)), findsOneWidget);
    expect(find.text(tr(LocaleKeys.successDelivery_order_delivered_success)),
        findsOneWidget);

    // Check the button
    expect(find.byKey(const Key(TestKeys.successDelivery)), findsOneWidget);
  });
}
