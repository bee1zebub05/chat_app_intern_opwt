import 'package:chat_app/src/common/constant/ui_constant.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../extension/build_context_x.dart';

import '../../../../generated/colors.gen.dart';

class AppRichText extends StatelessWidget {
  const AppRichText({
    super.key,
    required this.text,
    this.children = const [],
    this.fontWeight,
    this.fontSize,
    this.textColor,
    this.textAlign,
    this.padding = EdgeInsets.zero,
    this.maxLines,
    this.overflow,
    this.lineHeight,
  });

  final String text;
  final List<TextSpan> children;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextAlign? textAlign;
  final EdgeInsets padding;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? lineHeight;
  static TextSpan buildTextSpan(
    BuildContext context, {
    required String text,
    Color? textColor,
    FontWeight? fontWeight,
    double? fontSize,
    VoidCallback? onTap,
  }) {
    return TextSpan(
      text: text,
      recognizer: TapGestureRecognizer()..onTap = onTap,
      style: context.textTheme.regular.copyWith(
        color: textColor ?? ColorName.black07,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontSize: fontSize?.h ?? UIConst.defaultFontSize.h,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: RichText(
        maxLines: maxLines,
        overflow: overflow ?? TextOverflow.clip,
        textAlign: textAlign ?? TextAlign.center,
        text: TextSpan(
          text: text,
          style: context.textTheme.regular.copyWith(
            color: textColor ?? ColorName.black07,
            fontWeight: fontWeight ?? FontWeight.w400,
            fontSize: fontSize?.h ?? UIConst.defaultFontSize.h,
            height: lineHeight,
          ),
          children: children,
        ),
      ),
    );
  }
}
