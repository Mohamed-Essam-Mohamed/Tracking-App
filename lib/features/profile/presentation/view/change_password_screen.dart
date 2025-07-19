import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tracking_app/features/profile/presentation/widgets/change_password_body.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

class ChangePasswordScreen extends StatelessWidget{
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.Profile_ResetPassword.tr()),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),

      ),
      body: const ChangePasswordBody() ,
    );
  }

}