import 'package:auto_route/auto_route.dart';
import 'package:chat_app/src/module/auth/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:lottie/lottie.dart';
import '../../../../generated/assets.gen.dart';
import '../../common/utils/getit_utils.dart';
import '../../common/widget/app_scaffold.dart';
import 'app_router.dart';

@RoutePage()
@injectable
class SplashPage extends StatelessWidget {
  
  SplashPage({super.key}) {
    fetchAll();
  }

  Future<void> fetchAll() async {
    await Future.delayed(const Duration(seconds: 3));
    final currentUser = getIt<AuthService>().currentUser;
    if( currentUser == null ) {
      getIt<AppRouter>().replace(const SignInRoute());
    } else {
      getIt<AppRouter>().replace(const TabbarRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      visibleAppBar: false,
      canPop: false,
      body: Center(
        child: Positioned.fill(
          child: Lottie.asset(
            Assets.lottie.loading,
            repeat: true,
            fit: BoxFit.cover,
            width: 50.w,
            height: 50.w,
          ),
        ),
      ),
    );
  }
}
