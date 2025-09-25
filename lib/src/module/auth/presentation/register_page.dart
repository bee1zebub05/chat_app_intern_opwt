import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:chat_app/generated/assets.gen.dart';
import 'package:chat_app/generated/colors.gen.dart';
import 'package:chat_app/src/common/constant/ui_constant.dart';
import 'package:chat_app/src/common/utils/getit_utils.dart';
import 'package:chat_app/src/common/widget/app_button.dart';
import 'package:chat_app/src/common/widget/app_scaffold.dart';
import 'package:chat_app/src/common/widget/app_text.dart';
import 'package:chat_app/src/common/widget/app_textfield.dart';
import 'package:chat_app/src/module/app/app_router.dart';
import 'package:chat_app/src/module/auth/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController? userController = TextEditingController();
  final TextEditingController? passController = TextEditingController();
  final TextEditingController? rePassController = TextEditingController();
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RegisterCubit>(),
      child: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          state.whenOrNull(
            error: (message) => ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: AppText(message))),
            loading: () => Center(child: CircularProgressIndicator()),
            success: () async {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      UIConst.defaultBorderRadius,
                    ),
                  ),
                  backgroundColor: ColorName.grayBackground,
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Assets.icons.icSuccess.svg(height: 80.h),
                      SizedBox(height: 16.h),
                      AppText(
                        'Register successfully!',
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8.h),
                      AppText('Navigate to Login', textAlign: TextAlign.center),
                    ],
                  ),
                  actionsAlignment: MainAxisAlignment.center,
                ),
              );
              ;
              await Future.delayed(const Duration(seconds: 3));
              context.router.push(SignInRoute());
            },
          );
        },
        child: BlocBuilder<RegisterCubit, RegisterState>(
          builder: (context, state) {
            final isValid = state.maybeWhen(
              initial: (isValid) => isValid,
              orElse: () => false,
            );
            return AppScaffold(
              backgroundColor: ColorName.grayBackground,
              body: Center(
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: UIConst.defaultPadding,
                  ),
                  child: Column(
                    spacing: UIConst.defaultPadding,
                    children: [
                      Spacer(flex: 3),
                      Assets.icons.icRegister.svg(height: 100.h),
                      AppText(
                        'Register',
                        fontWeight: FontWeight.bold,
                        fontSize: UIConst.defaultFontSize * 3,
                      ),
                      Spacer(flex: 1),
                      _UsernameField(
                        controller: userController,
                        passController: passController,
                        rePassController: rePassController,
                      ),
                      _PasswordField(
                        controller: passController,
                        showPassword: showPassword,
                        onToggle: () => setState(() {
                          showPassword = !showPassword;
                        }),
                        rePassController: rePassController,
                      ),
                      _RePasswordField(
                        controller: rePassController,
                        passController: passController,
                        showPassword: showPassword,
                        onToggle: () => setState(() {
                          showPassword = !showPassword;
                        }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        spacing: 5.w,
                        children: [
                          AppText(
                            "Already have an account ?",
                            fontSize: 12.sp,
                            textColor: ColorName.grayText,
                          ),
                          AppText(
                            "Sign In",
                            fontSize: 12.sp,
                            textColor: ColorName.greenFile,
                            ignorePointer: false,
                            onTap: () {
                              context.router.replace(SignInRoute());
                            },
                          ),
                        ],
                      ),

                      AppButton(
                        isButtonDisabled: !isValid,
                        style: AppButtonStyle(
                          backgroundColor: ColorName.blueFile,
                          textColor: ColorName.white,
                        ),
                        title: 'Resgiter',
                        onPressed: () => context.read<RegisterCubit>().register(
                          userController!.text,
                          passController!.text,
                        ),
                      ),
                      Spacer(flex: 4),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _UsernameField extends StatelessWidget {
  final TextEditingController? controller;
  final TextEditingController? passController;
  final TextEditingController? rePassController;

  const _UsernameField({
    this.controller,
    this.passController,
    this.rePassController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: AppTextField(
        controller: controller,
        borderRadius: BorderRadius.circular(UIConst.defaultBorderRadius / 10),
        hintText: 'Username, email or mobile number',
        onChanged: (_) => context.read<RegisterCubit>().validation(
              passController!.text,
              rePassController!.text,
            ),
      ),
    );
  }
}

class _PasswordField extends StatelessWidget {
  final TextEditingController? controller;
  final TextEditingController? rePassController;
  final bool showPassword;
  final VoidCallback onToggle;

  const _PasswordField({
    this.controller,
    this.rePassController,
    required this.showPassword,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: AppTextField(
        controller: controller,
        borderRadius: BorderRadius.circular(UIConst.defaultBorderRadius / 10),
        hintText: 'Password',
        obscureText: showPassword,
        onSuffixPressed: onToggle,
        suffix: Padding(
          padding: EdgeInsets.only(right: 12.w),
          child: showPassword
              ? Assets.icons.icShow.svg(height: 25.h)
              : Assets.icons.icUnshow.svg(height: 25.h),
        ),
        onChanged: (_) => context.read<RegisterCubit>().validation(
              controller!.text,
              rePassController!.text,
            ),
      ),
    );
  }
}

class _RePasswordField extends StatelessWidget {
  final TextEditingController? controller;
  final TextEditingController? passController;
  final bool showPassword;
  final VoidCallback onToggle;

  const _RePasswordField({
    this.controller,
    this.passController,
    required this.showPassword,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: AppTextField(
        controller: controller,
        borderRadius: BorderRadius.circular(UIConst.defaultBorderRadius / 10),
        hintText: 'Enter password again',
        obscureText: showPassword,
        onSuffixPressed: onToggle,
        suffix: Padding(
          padding: EdgeInsets.only(right: 12.w),
          child: showPassword
              ? Assets.icons.icShow.svg(height: 25.h)
              : Assets.icons.icUnshow.svg(height: 25.h),
        ),
        onChanged: (_) => context.read<RegisterCubit>().validation(
              passController!.text,
              controller!.text,
            ),
      ),
    );
  }
}
