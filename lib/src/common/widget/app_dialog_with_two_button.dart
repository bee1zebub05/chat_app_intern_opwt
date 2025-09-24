import 'package:chat_app/src/common/constant/ui_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/colors.gen.dart';
import 'app_button.dart';
import 'app_dialog.dart';
import 'app_text.dart';

class AppDialogWithTwoButton extends StatelessWidget {
  const AppDialogWithTwoButton({
    super.key,
    required this.title,
    this.child,
    this.dialogRadius = 12,
    this.insetPadding,
    this.contentPadding,
    this.type = AppDialogType.warning,
    this.icon,
    this.titleButton,
    this.onTap,
    this.titleFontWeight,
    this.onTapCancelButton,
  });
  final Widget? child;
  final EdgeInsets? insetPadding;
  final double dialogRadius;
  final String title;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? contentPadding;
  final AppDialogType type;
  final Widget? icon;
  final String? titleButton;
  final FontWeight? titleFontWeight;
  final VoidCallback? onTapCancelButton;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: insetPadding ?? EdgeInsets.only(left: 16.w, right: 16.w),
      elevation: 0,
      backgroundColor: ColorName.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(dialogRadius.sp),
      ),
      child: Padding(
        padding: contentPadding ?? EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon ??
                (type == AppDialogType.warning
                    ? Icon(Icons.warning)
                    : Icon(Icons.check)),
            AppText(
              title,
              fontSize: UIConst.defaultFontSize*1.5,
              fontWeight: titleFontWeight ?? FontWeight.w600,
              textColor: ColorName.black,
              padding: EdgeInsets.only(top: 9.h),
            ),
            child ?? SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      onTapCancelButton?.call();
                    },
                    //Navigator.of(context, rootNavigator: true).pop(),
                    title: 'CANCEL',
                    height: 40.h,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: AppButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      onTap?.call();
                    },
                    title: titleButton ?? 'OK',
                    height: 40.h,
                    style: AppButtonStyle(
                      backgroundColor: ColorName.white,
                      borderColor: ColorName.blueIcon,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
