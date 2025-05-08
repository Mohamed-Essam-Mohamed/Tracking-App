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
import 'package:tracking_app/features/auth/data/models/response/verify_code_request.dart';
import 'package:tracking_app/features/auth/presentation/view_model/forget_password/forget_password_cubit.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

class EmailVerificationBody extends StatefulWidget {
  const EmailVerificationBody({super.key});

  @override
  State<EmailVerificationBody> createState() => _EmailVerificationBodyState();
}

class _EmailVerificationBodyState extends State<EmailVerificationBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final fogetCubit = BlocProvider.of<ForgetPasswordCubit>(context);
    final theme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 30),
              Text(
                LocaleKeys.Authentication_EmailVerification.tr(),
                style: theme.titleMedium,
              ),
              SizedBox(height: 20),
              Text(
                LocaleKeys.Authentication_PleaseEnterYourCode.tr(),
                style: theme.labelMedium!.copyWith(color: AppColors.gray),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              TextFormField(
                
                controller: fogetCubit.codeController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  return Validator.validateCode(value);
                },
                decoration: InputDecoration(hintText: 'Enter your code'),
              ),
              SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
                  
                  listenWhen: (pre,cur){
                    if(pre.verifyCodeState !=cur.verifyCodeState){
                      return true;
                    }
                    return false;
                  },
                  bloc: fogetCubit,
                  listener: (context, state) {
                    if (state.verifyCodeState is BaseLoadingState) {
                      AppDialog.showLoadingDialog(context);
                    } else if (state.verifyCodeState is BaseErrorState) {
                      final result = state.verifyCodeState as BaseErrorState;
                      Navigator.of(context).pop();
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        AppToast.showToast(
                            context: context,
                            description: result.errorMessage,
                            type: ToastificationType.error,
                            title: LocaleKeys.Error_Not_found.tr());
                      });
                    } else if (state.verifyCodeState is BaseSuccessState) {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed(Routes.resetPassword,arguments: fogetCubit);
                    }
                  },
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        fogetCubit.emailVerify(VerifyCodeRequest(
                            resetCode: fogetCubit.codeController.text));
                        return;
                      } else {
                        return;
                      }
                      // Navigator.of(context).pushNamed(Routes.resetPassword);
                    },
                    child: Text(LocaleKeys.Authentication_Confirm.tr()),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.Authentication_DidnotReceiveCode.tr(),
                    style: theme.titleSmall,
                  ),
                  Text(
                    LocaleKeys.Authentication_Resend.tr(),
                    style: theme.titleSmall!.copyWith(color: AppColors.pink),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
