import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';
import 'package:tracking_app/core/base_state/base_state.dart';
import 'package:tracking_app/core/constants/app_colors.dart';
import 'package:tracking_app/core/di/service_locator.dart';
import 'package:tracking_app/core/dialogs/app_dialogs.dart';
import 'package:tracking_app/core/dialogs/app_toasts.dart';
import 'package:tracking_app/core/routes/routes.dart';
import 'package:tracking_app/core/utils/validator.dart';
import 'package:tracking_app/features/auth/data/models/request/forget_request_dto.dart';
import 'package:tracking_app/features/auth/presentation/view_model/forget_password/forget_password_cubit.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

class ForgetPasswordBody extends StatefulWidget {
  const ForgetPasswordBody({super.key});

  @override
  State<ForgetPasswordBody> createState() => _ForgetPasswordBodyState();
}

class _ForgetPasswordBodyState extends State<ForgetPasswordBody> {
  final forgetCubit = serviceLocator.get<ForgetPasswordCubit>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Form(
        key: formKey,
        child: Column(children: [
          SizedBox(height: 30),
          Text(
            LocaleKeys.Authentication_ForgetPassword.tr(),
            style: theme.titleMedium,
          ),
          SizedBox(height: 20),
          Text(
            LocaleKeys.Authentication_PleaseEnterYourEmail.tr(),
            style: theme.labelMedium!.copyWith(color: AppColors.gray),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          TextFormField(
            controller: forgetCubit.emailController,
            validator: (value) {
              return Validator.validateEmail(value);
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
                labelText: LocaleKeys.Authentication_Email.tr(),
                hintText: LocaleKeys.Authentication_EnterYourEmail.tr()),
          ),
          SizedBox(height: 40),
          SizedBox(
            width: double.infinity,
            child: BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
              bloc: forgetCubit,
              listenWhen: (pre, cur) {
                if (pre.forgetState != cur.forgetState) {
                  return true;
                }
                return false;
              },
              listener: (context, state) {
                if (state.forgetState is BaseLoadingState) {
                  AppDialogs.showLoadingDialog(context);
                } else if (state.forgetState is BaseErrorState) {
                  final result = state.forgetState as BaseErrorState;
                  Navigator.of(context).pop();
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    AppToast.showToast(
                        context: context,
                        description: result.errorMessage,
                        type: ToastificationType.error,
                        title: LocaleKeys.Error_Not_found.tr());
                  });
                } else if (state.forgetState is BaseSuccessState) {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed(Routes.emailVerification,arguments: forgetCubit);
                }
              },
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(AppColors.pink)),
                child: Text(LocaleKeys.Authentication_Confirm.tr()),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    forgetCubit.forgetPassword(
                        ForgetRequestDto(forgetCubit.emailController.text));
                  } else {
                    return;
                  }
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
