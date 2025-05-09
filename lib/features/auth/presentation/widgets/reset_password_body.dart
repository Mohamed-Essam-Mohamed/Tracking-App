import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';
import 'package:tracking_app/core/base_state/base_state.dart';
import 'package:tracking_app/core/constants/app_colors.dart';
import 'package:tracking_app/core/dialogs/app_dialogs.dart';
import 'package:tracking_app/core/dialogs/app_toasts.dart';
import 'package:tracking_app/core/routes/routes.dart';
import 'package:tracking_app/core/utils/validator.dart';
import 'package:tracking_app/features/auth/data/models/response/reset_password_request.dart';
import 'package:tracking_app/features/auth/presentation/view_model/forget_password/forget_password_cubit.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

class ResetPasswordBody extends StatefulWidget {
  const ResetPasswordBody({super.key});

  @override
  State<ResetPasswordBody> createState() => _ResetPasswordBodyState();
}

class _ResetPasswordBodyState extends State<ResetPasswordBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final forgetCubit = BlocProvider.of<ForgetPasswordCubit>(context);
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(children: [
            const SizedBox(height: 30),
            Text(
              LocaleKeys.Authentication_ResetPassword.tr(),
              style: theme.titleMedium,
            ),
            const SizedBox(height: 20),
            Text(
              'Password must not be empty and must contain 6 characters with upper case letter and one number at least ',
              style: theme.labelMedium!.copyWith(color: AppColors.gray),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            TextFormField(
              controller: forgetCubit.passwordController,
              validator: (value) {
                return Validator.validatePassword(value);
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                  labelText: LocaleKeys.Authentication_NewPassword.tr(),
                  hintText: LocaleKeys.Authentication_EnterYourPassword.tr()),
            ),
            const SizedBox(height: 24),
            TextFormField(
              validator: (value) {
                return Validator.validateConfirmPassword(
                    value, forgetCubit.passwordController.text);
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                  labelText: LocaleKeys.Authentication_ConfirmPassword.tr(),
                  hintText: LocaleKeys.Authentication_ConfirmPassword.tr()),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
                listener: (context, state) {
                  if (state.resetPasswordState is BaseLoadingState) {
                    AppDialogs.showLoadingDialog(context);
                  } else if (state.resetPasswordState is BaseErrorState) {
                    final result = state.resetPasswordState as BaseErrorState;
                    Navigator.of(context).pop();
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      AppToast.showToast(
                          context: context,
                          description: result.errorMessage,
                          type: ToastificationType.error,
                          title: LocaleKeys.Error_Not_found.tr());
                    });
                  } else if (state.resetPasswordState is BaseSuccessState) {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamedAndRemoveUntil(Routes.login, (p) {
                      return false;
                    });
                  }
                },
                child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(AppColors.pink)),
                  child: Text(LocaleKeys.Authentication_Confirm.tr()),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      forgetCubit.resetPassword(ResetPasswordRequest(
                          email: forgetCubit.emailController.text,
                          password: forgetCubit.passwordController.text));
                    } else {
                      return;
                    }
                    //Navigator.of(context).pushNamed(Routes.emailVerification);
                  },
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
