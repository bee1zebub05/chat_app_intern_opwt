// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:chat_app/src/common/theme/default_text_theme.dart' as _i183;
import 'package:chat_app/src/common/utils/logger.dart' as _i236;
import 'package:chat_app/src/module/app/app_router.dart' as _i824;
import 'package:chat_app/src/module/app/splash_page.dart' as _i537;
import 'package:chat_app/src/module/auth/cubit/register_cubit.dart' as _i934;
import 'package:chat_app/src/module/auth/cubit/sign_in_cubit.dart' as _i1018;
import 'package:chat_app/src/module/auth/repository/auth_repository.dart'
    as _i934;
import 'package:chat_app/src/module/auth/service/auth_service.dart' as _i561;
import 'package:chat_app/src/module/tabbar/application/tabbar_cubit.dart'
    as _i1035;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:flutter/material.dart' as _i409;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:talker_flutter/talker_flutter.dart' as _i207;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final loggerModule = _$LoggerModule();
    final firebaseModule = _$FirebaseModule();
    gh.singleton<_i183.DefaultTextTheme>(() => _i183.DefaultTextTheme());
    gh.singleton<_i207.Talker>(() => loggerModule.talker());
    gh.singleton<_i824.AppRouter>(() => _i824.AppRouter());
    gh.singleton<_i1035.TabCubit>(() => _i1035.TabCubit());
    gh.lazySingleton<_i59.FirebaseAuth>(() => firebaseModule.firebaseAuth);
    gh.factory<_i537.SplashPage>(() => _i537.SplashPage(key: gh<_i409.Key>()));
    gh.factory<_i561.AuthService>(
      () => _i561.AuthService(gh<_i59.FirebaseAuth>()),
    );
    gh.factory<_i934.AuthRepository>(
      () => _i934.AuthRepository(gh<_i561.AuthService>()),
    );
    gh.factory<_i934.RegisterCubit>(
      () => _i934.RegisterCubit(gh<_i934.AuthRepository>()),
    );
    gh.factory<_i1018.SignInCubit>(
      () => _i1018.SignInCubit(gh<_i934.AuthRepository>()),
    );
    return this;
  }
}

class _$LoggerModule extends _i236.LoggerModule {}

class _$FirebaseModule extends _i561.FirebaseModule {}
