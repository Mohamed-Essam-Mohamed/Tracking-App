import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracking_app/core/routes/routes.dart';

class AppSection extends StatelessWidget {
  const AppSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
                  onPressed: ()async {
                    List<String> data = await getData();
                    print('dataaaaaaaaaa $data');
                  },
                  child: const Text('get data')),
          ),

          ElevatedButton(
              onPressed: () {
                logout(context);
              },
              child: const Text('log out')),
        ],
      ),
    );
  }
}

Future<List<String>> getData() async {
  final pref = await SharedPreferences.getInstance();
  final vehicleId = pref.getString('VehicleId');
  final vehicleImage = pref.getString('VehicleImage');
  final vehicleType = pref.getString('VehicleType');
  return [vehicleId!,vehicleImage!,vehicleType!];

}
Future<void> logout(BuildContext context) async {
  final pref = await SharedPreferences.getInstance();
  pref.setBool('isLoggedIn', false);
  Navigator.of(context).pushReplacementNamed(Routes.login);
}
