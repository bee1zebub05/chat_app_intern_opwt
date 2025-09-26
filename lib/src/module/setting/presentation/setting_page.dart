import 'package:auto_route/auto_route.dart';
import 'package:chat_app/generated/assets.gen.dart';
import 'package:chat_app/generated/colors.gen.dart';
import 'package:chat_app/src/common/constant/ui_constant.dart';
import 'package:chat_app/src/common/utils/getit_utils.dart';
import 'package:chat_app/src/common/widget/app_scaffold.dart';
import 'package:chat_app/src/common/widget/app_text.dart';
import 'package:chat_app/src/module/app/app_router.dart';
import 'package:chat_app/src/module/setting/cubit/setting_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SettingCubit>(),
      child: BlocListener<SettingCubit, SettingState>(
        listener: (context, state) {
          // TODO: implement listener
          state.whenOrNull(
            error: (message) => ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: AppText(message))),
          );
        },
        child: BlocBuilder<SettingCubit, SettingState>(
          builder: (context, state) {
            return AppScaffold(
              titleAppBar: _UserBar(
                user: state.whenOrNull(initial: (user) => user),
              ),
              body: Padding(
                padding: EdgeInsets.all(UIConst.defaultPadding / 2),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<SettingCubit>().signOut;
                        context.router.replaceAll([SignInRoute()]);
                      },
                      child: _SettingItem(
                        image: Assets.icons.icSignout,
                        title: 'Sign Out',
                        borderColor: ColorName.redFile,
                        backgroundColor: ColorName.white,
                        itemColor: ColorName.redFile,
                      ),
                    ),

                    // GestureDetector(
                    //   onTap: () {
                    //     context.read<SettingCubit>().signOut;
                    //     context.router.replaceAll([SignInRoute()]);
                    //   },
                    //   child: _SettingItem(
                    //     image: Assets.icons.icSignout,
                    //     title: 'Sign Out',
                    //     borderColor: ColorName.redFile,
                    //     backgroundColor: ColorName.white,
                    //     itemColor: ColorName.redFile,
                    //   ),
                    // ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _UserBar extends StatelessWidget {
  final User? user;
  const _UserBar({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: UIConst.defaultPadding / 2),
      child: Container(
        decoration: BoxDecoration(
          color: ColorName.grayBackground,
          borderRadius: BorderRadius.circular(UIConst.defaultBorderRadius / 4),
        ),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(
              UIConst.defaultBorderRadius,
            ),
            child: user?.photoURL == null
                ? Assets.icons.icDefaultAvatar.svg(height: 40.h)
                : Image.network(user?.photoURL as String, height: 40.h),
          ),
          title: user?.displayName == null
              ? AppText(
                  'Display named was not set',
                  fontStyle: FontStyle.italic,
                  textColor: ColorName.grayText,
                  textAlign: TextAlign.left,
                )
              : AppText(user?.displayName, textAlign: TextAlign.left),
          subtitle: AppText(user?.email, textAlign: TextAlign.left),
        ),
      ),
    );
  }
}

class _SettingItem extends StatelessWidget {
  final SvgGenImage image;
  final String? title;
  final Color borderColor;
  final Color backgroundColor;
  final Color itemColor;
  const _SettingItem({
    super.key,
    required this.image,
    required this.title,
    this.borderColor = ColorName.grayBackground,
    this.backgroundColor = ColorName.grayBackground,
    this.itemColor = ColorName.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: BoxBorder.all(color: borderColor),
        color: backgroundColor,
        borderRadius: BorderRadius.circular(UIConst.defaultBorderRadius / 10),
      ),
      height: 58.h,
      child: ListTile(
        leading: image.svg(height: 30.h, color: itemColor),
        title: AppText(
          title,
          textAlign: TextAlign.left,
          fontSize: 22.sp,
          textColor: itemColor,
          ignorePointer: false,
        ),
      ),
    );
  }
}
