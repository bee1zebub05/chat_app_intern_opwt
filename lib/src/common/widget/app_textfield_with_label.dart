import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../extension/build_context_x.dart';
import '../extension/string_x.dart';
import 'app_text.dart';
import 'app_textfield.dart';

class AppTextFieldWithLabel extends StatelessWidget {
  const AppTextFieldWithLabel({
    super.key,
    this.label,
    this.hintText,
    this.onChanged,
    this.textCase = TextCaseType.none,
    this.inputBuilder,
    this.suffix,
    this.keyboardType,
    this.maxLength,
    this.textController,
    this.obscureText = false,
    this.onSuffixPressed,
    this.borderColor,
    this.errorText,
    this.textInputAction,
    this.focusNode,
    this.contentPadding,
    this.onEditingComplete,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.onTap,
    this.isTextFormField = false,
    this.maxLines = 1,
    this.padding,
    this.fontSize,
    this.hintTextColor,
    this.labelFontSize = 14,
    this.labelFontWeight = FontWeight.w500,
    this.labelColor,
    this.fontWeight,
    this.showErrorSameLine = true,
    this.readOnly = false,
    this.spaceBottom = 0,
    this.labelPadding,
    this.error,
    this.space = 8,
    this.isEnableLabelTextCaseType = true,
  });

  final String? label;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final TextCaseType textCase;
  final Widget Function(String hintText)? inputBuilder;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final int? maxLength;
  final TextEditingController? textController;
  final bool obscureText;
  final VoidCallback? onSuffixPressed;
  final Color? borderColor;
  final String? errorText;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final VoidCallback? onEditingComplete;
  final EdgeInsets scrollPadding;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? contentPadding;
  final bool isTextFormField;
  final int? maxLines;
  final double space;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;
  final Color? hintTextColor;
  final double labelFontSize;
  final FontWeight labelFontWeight;
  final Color? labelColor;
  final FontWeight? fontWeight;
  final bool showErrorSameLine;
  final bool readOnly;
  final double spaceBottom;
  final EdgeInsetsGeometry? labelPadding;
  final Widget? error;
  final bool isEnableLabelTextCaseType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label == null)
            const SizedBox.shrink()
          else
            Padding(
              padding: labelPadding ?? EdgeInsets.zero,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText(
                    label!,
                    textColor: labelColor ?? Colors.grey,
                    fontSize: labelFontSize.sp,
                    fontWeight: labelFontWeight,
                    textCase:
                        isEnableLabelTextCaseType
                            ? TextCaseType.capitalized
                            : TextCaseType.none,
                  ),
                  Visibility(
                    visible: showErrorSameLine,
                    child: Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 12.w, right: 4.w),
                        child: AutoSizeText(
                          errorText ?? '',
                          textAlign: TextAlign.end,
                          style: context.textTheme.regular.copyWith(
                            color: Colors.red,
                            fontSize: 11.sp,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          SizedBox(height: space.h),
          inputBuilder?.call(hintText ?? 'Enter') ??
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextField(
                    maxLines: maxLines,
                    readOnly: readOnly,
                    isError: (errorText ?? '').isNotEmpty,
                    contentPadding: contentPadding,
                    onTap: onTap,
                    fontSize: fontSize?.sp,
                    fontWeight: fontWeight ?? FontWeight.w400,
                    hintTextColor: hintTextColor,
                    onEditingComplete: onEditingComplete,
                    focusNode: focusNode,
                    controller: textController,
                    textCase: textCase,
                    hintText: hintText ?? 'Enter',
                    onChanged: onChanged,
                    suffix: suffix,
                    keyboardType: keyboardType,
                    maxLength: maxLength,
                    obscureText: obscureText,
                    onSuffixPressed: onSuffixPressed,
                    borderColor: borderColor,
                    focusedBorderColor:
                        borderColor ?? Colors.grey,
                    textInputAction: textInputAction,
                    scrollPadding: scrollPadding,
                  ),
                  Visibility(
                    visible: error == null,
                    replacement: error ?? const SizedBox.shrink(),
                    child: SizedBox(
                      height: spaceBottom.h,
                      child: Visibility(
                        visible:
                            (errorText ?? '').isNotEmpty && !showErrorSameLine,
                        child: AppText(
                          errorText ?? '',
                          textAlign: TextAlign.start,
                          enableAutoResize: true,
                          textColor: Colors.red,
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                          padding: EdgeInsets.only(top: 3.h),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
        ],
      ),
    );
  }
}
