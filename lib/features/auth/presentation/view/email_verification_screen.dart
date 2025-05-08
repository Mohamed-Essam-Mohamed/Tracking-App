import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/features/auth/presentation/view_model/forget_password/forget_password_cubit.dart';
import 'package:tracking_app/features/auth/presentation/widgets/email_verification_body.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
          title: Text(LocaleKeys.Authentication_Password.tr()),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined),
          ),
        ),
      body: EmailVerificationBody()
    );
  }
}
