import 'package:chat_app/src/common/constant/ui_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/colors.gen.dart';
import 'app_button.dart';
import 'app_text.dart';

enum AppDialogType { warning, success }

class AppDialog extends StatelessWidget {
  const AppDialog({
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

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding:
          insetPadding ??
          EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            // bottom: context.mediaQuery.size.height / 2 - 350.h
          ),
      elevation: 0,
      backgroundColor: ColorName.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(dialogRadius.sp),
      ),
      child: Padding(
        padding: contentPadding ?? EdgeInsets.zero,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: UIConst.defaultPadding,),
            icon ??
                (type == AppDialogType.warning
                    ? Icon(Icons.warning)
                    : Icon(Icons.check)),
            AppText(
              title,
              fontSize: 16,
              fontWeight: titleFontWeight ?? FontWeight.w600,
              textColor: ColorName.black,
              padding: EdgeInsets.only(top: 9.h),
            ),
            child ?? SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsetsGeometry.fromLTRB(
                UIConst.defaultPadding,
                0,
                UIConst.defaultPadding,
                UIConst.defaultPadding,
              ),
              child: AppButton(
                onPressed: () {
                  if (onTap != null) {
                    onTap!.call();
                  } else {
                    Navigator.of(context).pop();
                  }
                },
                title: titleButton ?? 'Ok',
                height: 56,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
