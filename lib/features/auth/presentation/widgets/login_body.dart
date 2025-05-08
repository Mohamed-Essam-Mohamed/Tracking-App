import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

import '../../../../core/base_state/base_state.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/dialogs/app_toasts.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/validator.dart';
import '../../../../generated/locale_keys.g.dart';
import '../view_model/login/login_cubit.dart';
import '../view_model/login/login_state.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  late LoginCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = serviceLocator<LoginCubit>();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider(
      create: (context) => cubit,
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {

          if (state.baseState is BaseSuccessState) {
            Navigator.pushReplacementNamed(context, Routes.appSection);
          } else if (state.baseState is BaseErrorState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              AppToast.showToast(
                  context: context,
                  description:
                  (state.baseState as BaseErrorState).exception.toString(),
                  type: ToastificationType.error,
                  title: LocaleKeys.Error_LoginFailed.tr());
            });
          }
        },
        builder: (context, state) {
          final cubit = context.read<LoginCubit>();
          final isLoading = state.baseState is BaseLoadingState;
          return SingleChildScrollView(
            child: Form(
              key: cubit.formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: cubit.emailController,
                      decoration: InputDecoration(
                        hintText: LocaleKeys.Authentication_EnterYourEmail.tr(),
                        labelText: LocaleKeys.Authentication_Email.tr(),
                      ),
                      validator: (value) => Validator.validateEmail(value),
                      onTapOutside: (_) =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: cubit.passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText:
                        LocaleKeys.Authentication_EnterYourPassword.tr(),
                        labelText: LocaleKeys.Authentication_Password.tr(),
                      ),
                      validator: (value) => Validator.validatePassword(value),
                      onTapOutside: (_) =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        Checkbox(
                          value: state.rememberMe,
                          onChanged: (value) {
                            cubit.toggleRememberMe(value);
                          },
                        ),
                        Text(
                          LocaleKeys.Authentication_RememberMe.tr(),
                          style: AppTheme.lightTheme.textTheme.bodyLarge,
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () {
                             Navigator.of(context).pushNamed(Routes.applyScreen );
                          },
                          child: Text(
                            LocaleKeys.Authentication_ForgetPassword.tr(),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 48.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: state.isFormValid
                            ? Theme.of(context).primaryColor
                            : AppColors.black[AppColors.colorCode30],
                      ),
                      onPressed: isLoading
                          ? null
                          : () {
                        if (state.isFormValid) {
                          cubit.doIntent(LoginAction());
                        }
                      },
                      child: isLoading
                          ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor:
                          AlwaysStoppedAnimation(Colors.white),
                        ),
                      )
                          : Text(LocaleKeys.Continue.tr()),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
