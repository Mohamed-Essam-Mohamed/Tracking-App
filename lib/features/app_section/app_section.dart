import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracking_app/core/routes/routes.dart';

class AppSection extends StatelessWidget {
  const AppSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              logout(context);
            },
            child: const Text('log out')),
      ),
    );
  }
}

Future<void> logout(BuildContext context) async {
  final pref = await SharedPreferences.getInstance();
  pref.setBool('isLoggedIn', false);
  Navigator.of(context).pushReplacementNamed(Routes.login);
}
