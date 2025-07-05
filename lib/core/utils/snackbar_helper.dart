
import 'package:flutter/material.dart';
import 'package:tezda/core/theme/color_manager.dart';
import 'package:tezda/core/utils/font_manager.dart';

class SnackbarHelper {
  //
  static closeAllSnackbars(BuildContext context) =>
      ScaffoldMessenger.of(context).clearSnackBars();

  static showSnackbar(
      {required String message, required BuildContext context}) {
    closeAllSnackbars(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: ColorManager.primary,
        content: Text(
          message,
          style: FontManager.getTextStyle(fontSize: 12),
        ),
        padding: const EdgeInsets.all(8),
        // borderColor: ColorManager.primaryAcent.withOpacity(.5),
        margin: const EdgeInsets.all(16),
        // borderWidth: 2,
        // icon: const Icon(
        //   CupertinoIcons.info,
        //   size: 20,
        // ),
        // isDismissible: true,
        duration: const Duration(seconds: 5),
      ),
    );
  }

  static showSnackbarSuccess(
      {required String message, required BuildContext context}) {
    closeAllSnackbars(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Success",
              style: FontManager.getTextStyle(
                  fontSize: 14,
                  fontWeight: FontManager.medium,
                  color: ColorManager.primary),
            ),
            Text(
              message,
              style: FontManager.getTextStyle(
                fontSize: 12,
                color: ColorManager.primary,
              ),
            ),
          ],
        ),
        backgroundColor: ColorManager.white,
        margin: const EdgeInsets.all(16),
        // snackStyle: SnackStyle.FLOATING,
        // borderRadius: 8,
        // borderColor: ColorManager.white,
        // snackStyle: SnackStyle.FLOATING,
        // borderWidth: 2,
        // icon: const Icon(
        //   Icons.check_circle_outline_rounded,
        //   size: 20,
        //   color: ColorManager.primary,
        // ),
        // isDismissible: true,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
