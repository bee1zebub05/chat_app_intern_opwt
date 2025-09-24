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
import 'package:lottie/lottie.dart';

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
                builder: (_) => Center(
                  child: Padding(
                    padding:  EdgeInsets.all(UIConst.defaultPadding),
                    child: Container(
                      height: 400.h,
                      decoration: BoxDecoration(
                        color: ColorName.grayBackground,
                        borderRadius: BorderRadius.circular(UIConst.defaultBorderRadius/10)
                      ),
                      child: Center(
                        child:Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 4.h,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Assets.icons.icSuccess.svg(height: 100.h),
                              Expanded(child: AppText('Register successfully !! Navigate to Login', fontWeight: FontWeight.bold,))
                            ],
                          ),
                        
                      ),
                    ),
                  ),
                )
              );
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
                      AppText('Register', fontWeight: FontWeight.bold, fontSize: UIConst.defaultFontSize*3,),
                      Spacer(flex: 1),
                      SizedBox(
                        height: 50.h,
                        child: AppTextField(
                          controller: userController,
                          borderRadius: BorderRadius.circular(
                            UIConst.defaultBorderRadius / 10,
                          ),
                          hintText: 'Username, email or mobile number',
                          onChanged: (_) =>
                              context.read<RegisterCubit>().validation(
                                passController!.text,
                                rePassController!.text,
                              ),
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                        child: AppTextField(
                          controller: passController,
                          borderRadius: BorderRadius.circular(
                            UIConst.defaultBorderRadius / 10,
                          ),
                          hintText: 'Password',
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                        child: AppTextField(
                          controller: rePassController,
                          borderRadius: BorderRadius.circular(
                            UIConst.defaultBorderRadius / 10,
                          ),
                          hintText: 'Enter password again',
                          onChanged: (_) =>
                              context.read<RegisterCubit>().validation(
                                passController!.text,
                                rePassController!.text,
                              ),
                        ),
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
