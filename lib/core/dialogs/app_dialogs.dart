import 'package:flutter/material.dart';
import 'package:tracking_app/core/constants/app_colors.dart';

import 'loading_widget.dart';

abstract class AppDialog {
  // Show a loading dialog
  static void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            backgroundColor: Colors.transparent,
            content: LoadingWidget(),
          ),
        );
      },
    );
  }

  /// Show a message dialog with two actions
  static void showMessage({
    required BuildContext context,
    required String title,
    required TextStyle titleStyle,
    required String message,
    required TextStyle messageStyle,
    required VoidCallback onPressedAction1,
    required VoidCallback onPressedAction2,
    required String titleAction1,
    required String titleAction2,
    // required TextStyle titleAction1Style,
    // required TextStyle titleAction2Style,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: ((context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: _buttonAction(
                    onPressed: onPressedAction1,
                    context: context,
                    title: titleAction1,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: _buttonAction(
                    onPressed: onPressedAction2,
                    title: titleAction2,
                    context: context,
                    colorBackground: Colors.transparent,
                    colorText: AppColors.pink,
                    haveBorder: true,
                  ),
                ),
              ],
            ),
          ],
          contentTextStyle: messageStyle,
          titleTextStyle: titleStyle,
          alignment: Alignment.center,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: AppColors.white,
          elevation: 0,
        );
      }),
    );
  }

  static Widget _buttonAction({
    required String title,
    required VoidCallback onPressed,
    required BuildContext context,
    double? radius,
    Color? colorBackground,
    Color? colorText,
    FontWeight? fontWeight,
    bool haveBorder = false,
  }) {
    return MaterialButton(
      elevation: 0,
      minWidth: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius ?? 50),
        side: BorderSide(
          color: haveBorder ? AppColors.pink : Colors.transparent,
          width: 1,
        ),
      ),
      onPressed: onPressed,
      color: colorBackground ?? AppColors.pink,
      child: Text(
        title,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: colorText ?? AppColors.white,
              fontWeight: fontWeight ?? FontWeight.bold,
            ),
      ),
    );
  }
}
