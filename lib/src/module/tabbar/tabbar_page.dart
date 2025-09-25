// ignore_for_file: deprecated_member_use_from_same_package

import 'package:auto_route/auto_route.dart';
import 'package:chat_app/generated/assets.gen.dart';
import 'package:chat_app/src/module/home/presentation/home_page.dart';
import 'package:chat_app/src/module/setting/presentation/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/colors.gen.dart';
import '../../common/utils/getit_utils.dart';

import 'application/tabbar_cubit.dart';

@RoutePage()
class TabbarPage extends StatelessWidget {
  const TabbarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<TabCubit>(),
      child: BlocBuilder<TabCubit, TabState>(
        builder: (context, state) {
          return Scaffold(
            body: IndexedStack(
              index: state.currentIndex,
              children: const [HomePage(), SettingPage()],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.currentIndex,
              onTap: (i) => context.read<TabCubit>().setTabIndex(i),
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedItemColor: ColorName.purple969,
              unselectedItemColor: ColorName.gray97,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                  icon: Assets.icons.icHomeUnfocus.svg(height: 35.h),
                  activeIcon: Assets.icons.icHomeFocus.svg(height: 35.h),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Assets.icons.icProfileUnfocus.svg(height: 35.h),
                  activeIcon: Assets.icons.icProfileFocus.svg(height: 35.h),
                  label: 'Profile',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
