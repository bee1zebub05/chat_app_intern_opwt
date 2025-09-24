import 'package:auto_route/auto_route.dart';
import 'package:chat_app/src/module/auth/presentation/register_page.dart';
import 'package:chat_app/src/module/auth/presentation/sign_in_page.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';


import '../tabbar/tabbar_page.dart';

import 'splash_page.dart';

part 'app_router.gr.dart';

@singleton
@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, path: '/'),
    AutoRoute(page: RegisterRoute.page),
    AutoRoute(page: SignInRoute.page)
  ];
}
