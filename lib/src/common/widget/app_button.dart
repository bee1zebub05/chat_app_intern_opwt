import 'package:chat_app/src/common/constant/ui_constant.dart';
import 'package:chat_app/src/common/widget/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../extension/string_x.dart';
import '../../../../generated/colors.gen.dart';

enum ButtonType { normal, outline }

class AppButtonStyle {
  const AppButtonStyle({
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.leadingIcon,
    this.textStyle,
    this.fontWeight,
    this.radius,
    this.gradient,
    this.marginBottom = UIConst.zero,
    this.borderWidth = UIConst.defaultBorderWidth,
    this.fontSize,
    this.textCase,
  });

  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final FontWeight? fontWeight;
  final Widget? leadingIcon;
  final double? radius;
  final LinearGradient? gradient;
  final double marginBottom;
  final double borderWidth;
  final double? fontSize;
  final TextCaseType? textCase;
}

final class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.onPressed,
    this.style = const AppButtonStyle(),
    this.titleBuilder,
    this.title = '',
    this.prefixIcon,
    this.isLoading,
    this.loading,
    this.isButtonDisabled = false,
    this.buttonType = ButtonType.normal,
    this.margin = EdgeInsets.zero,
    this.height = 48,
    this.width,
    this.border,
    this.note,
    this.showSuggestLoginDialog = false,
    this.textCase = TextCaseType.capitalized,
    this.isLogin,
    this.titleAlignment = MainAxisAlignment.center,
    this.titlePadding = EdgeInsets.zero,
    this.spacing = 16,
    this.resultHandler,
  });

  final AppButtonStyle style;
  final VoidCallback? onPressed;
  final String title;
  final Widget Function(String title)? titleBuilder;
  final Widget? prefixIcon;
  final bool? isLoading;
  final Widget? loading;
  final bool isButtonDisabled;
  final double spacing;
  final ButtonType buttonType;
  final EdgeInsetsGeometry margin;
  final double? height;
  final double? width;
  final BoxBorder? border;
  final Widget? note;
  final bool showSuggestLoginDialog;
  final TextCaseType textCase;
  final bool? isLogin;
  final MainAxisAlignment titleAlignment;
  final EdgeInsetsGeometry titlePadding;
  final VoidCallback? resultHandler;

  bool get isOutLineButton => buttonType == ButtonType.outline;

  Widget _buildTitle(BuildContext context, Widget? prefixIcon) {
    return Column(
      children: [
        Container(
          height: height?.h ?? UIConst.defaultHeightButton.h,
          width: width?.w,
          margin: margin,
          decoration: BoxDecoration(
            color:
                isButtonDisabled
                    ? Colors.grey.shade300
                    : isOutLineButton
                    ? style.backgroundColor ?? Colors.transparent
                    : style.backgroundColor ?? ColorName.primary,
            gradient: style.gradient,
            borderRadius: BorderRadius.circular(
              (style.radius ?? UIConst.defaultCornerRadiusButton).sp,
            ),
            border:
                border ??
                Border.all(
                  width: isOutLineButton ? style.borderWidth.h : UIConst.zero,
                  color:
                      style.borderColor ??
                      (isOutLineButton
                          ? ColorName.purple969
                          : Colors.transparent),
                ),
          ),
          child: Visibility(
            visible: isLoading ?? false,
            replacement:
                titleBuilder?.call(title) ??
                Padding(
                  padding: titlePadding,
                  child: Row(
                    mainAxisAlignment: titleAlignment,
                    children: [
                      prefixIcon ?? const SizedBox.shrink(),
                      SizedBox(width: prefixIcon == null ? 0 : spacing.w),
                      Flexible(
                        child: AppText(
                          title.getTextByCasing(style.textCase ?? textCase),
                          textColor: style.textColor,
                        ),
                      ),
                    ],
                  ),
                ),
            child: Center(child: loading),
          ),
        ),
        Visibility(
          visible: note == null ? true : false,
          child: note ?? const SizedBox.shrink(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      minSize: 0,
      padding: EdgeInsets.zero,
      onPressed:
          isButtonDisabled
              ? null
              : () {
                onPressed?.call();
              },
      child: _buildTitle(context, prefixIcon),
    );
  }
}
