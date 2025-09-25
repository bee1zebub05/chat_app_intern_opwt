import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:chat_app/generated/assets.gen.dart';
import 'package:chat_app/generated/colors.gen.dart';
import 'package:chat_app/src/common/constant/ui_constant.dart';
import 'package:chat_app/src/common/utils/getit_utils.dart';
import 'package:chat_app/src/common/utils/logger.dart';
import 'package:chat_app/src/common/widget/app_button.dart';
import 'package:chat_app/src/common/widget/app_scaffold.dart';
import 'package:chat_app/src/common/widget/app_text.dart';
import 'package:chat_app/src/common/widget/app_textfield.dart';
import 'package:chat_app/src/module/app/app_router.dart';
import 'package:chat_app/src/module/auth/cubit/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController? userController = TextEditingController();

  final TextEditingController? passController = TextEditingController();

  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignInCubit>(),
      child: BlocListener<SignInCubit, SignInState>(
        listener: (context, state) {
          state.whenOrNull(
            error: (message) => ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: AppText(message))),
            loading: () => Center(child: CircularProgressIndicator()),
            success: () => getIt<AppRouter>().replaceAll([TabbarRoute()]),
          );
        },
        child: BlocBuilder<SignInCubit, SignInState>(
          builder: (context, state) {
            return AppScaffold(
              backgroundColor: ColorName.grayBackground,
              body: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: UIConst.defaultPadding,
                  ),
                  child: Column(
                    spacing: UIConst.defaultPadding,
                    children: [
                      Spacer(flex: 3),
                      Assets.icons.icSignin.svg(height: 100.h),
                      AppText(
                        'Sign In',
                        fontWeight: FontWeight.bold,
                        fontSize: UIConst.defaultFontSize * 3,
                      ),
                      Spacer(flex: 1),
                      _UsernameField(controller: userController),
                      _PasswordField(
                        controller: passController,
                        showPassword: showPassword,
                        onToggle: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        spacing: 5.w,
                        children: [
                          AppText(
                            "Doesn't have an account ?",
                            fontSize: 12.sp,
                            textColor: ColorName.grayText,
                          ),
                          AppText(
                            "Register",
                            fontSize: 12.sp,
                            textColor: ColorName.greenFile,
                            ignorePointer: false,
                            onTap: () {
                              logger.w('clicked!');
                              context.router.replace(RegisterRoute());
                            },
                          ),
                        ],
                      ),

                      AppButton(
                        onPressed: () {
                          logger.w('Button clicked!!!');
                          context.read<SignInCubit>().signIn(userController!.text, passController!.text);
                        },
                        style: AppButtonStyle(
                          backgroundColor: ColorName.blueFile,
                          textColor: ColorName.white,
                        ),
                        title: 'Sign In',
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
  const _UsernameField({this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: AppTextField(
        controller: controller,
        borderRadius: BorderRadius.circular(UIConst.defaultBorderRadius / 10),
        hintText: 'Username, email or mobile number',
      ),
    );
  }
}

class _PasswordField extends StatelessWidget {
  final TextEditingController? controller;
  final bool showPassword;
  final VoidCallback onToggle;

  const _PasswordField({
    this.controller,
    required this.showPassword,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: AppTextField(
        controller: controller,
        obscureText: showPassword,
        borderRadius: BorderRadius.circular(UIConst.defaultBorderRadius / 10),
        hintText: 'Password',
        onSuffixPressed: onToggle,
        suffix: Padding(
          padding: EdgeInsets.only(right: 12.w),
          child: showPassword
              ? Assets.icons.icShow.svg(height: 25.h)
              : Assets.icons.icUnshow.svg(height: 25.h),
        ),
      ),
    );
  }
}
