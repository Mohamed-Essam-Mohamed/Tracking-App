import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/routes/routes.dart';

class AppSection extends StatelessWidget{
  const AppSection({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          logout(context);
        }, child: Text('log out')),
      ),
    );
  }
}

Future<void> logout(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('isLoggedIn', false);
  Navigator.of(context).pushReplacementNamed(Routes.login);
}
