import 'package:flutter/material.dart';
import 'package:tracking_app/core/constants/app_colors.dart';
import 'package:tracking_app/core/extentions/media_query_extensions.dart';
import 'package:tracking_app/core/theme/app_theme.dart';
class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String hint;
  final TextEditingController? controller;
  final String? errorText;
  final bool? enabled;
  final Widget? widget;
  final Widget? suffixWidget;

  const CustomTextFormField({
    super.key,
    this.label,
    required this.hint,
    this.controller,
    this.errorText,
    this.enabled,
    this.widget,
    this.suffixWidget

  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(

          enabled: enabled,
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: context.hp(2.4), horizontal: context.wp(3.7)), // ← This controls height
            suffix: suffixWidget ,
            prefix:widget ,
            errorStyle: TextStyle(color:AppColors.red),
            labelText: label,
            hintText: hint,
            labelStyle: AppTheme.lightTheme.textTheme.bodySmall,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: context.wp(0.3),
                color: errorText != null ? AppColors.red : AppColors.gray,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: context.wp(0.3),
                color: errorText != null ? AppColors.red : AppColors.gray,
              ), ),
            hintStyle: AppTheme.lightTheme.textTheme.bodyMedium!.copyWith(color: Colors.black),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: context.wp(0.3),
                color: errorText != null ? AppColors.red : AppColors.gray,
              ),
            ),
          ),
        ),

        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(left: 15,top: 5.0),
            child: Text(
              errorText!,
              style:  TextStyle(
                color: AppColors.red,
                fontSize: context.sp(2),
              ),
            ),
          ),
      ],
    );
  }
}
