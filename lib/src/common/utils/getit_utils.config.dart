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
import 'package:chat_app/src/module/authentiaction/cubit/register_cubit.dart'
    as _i235;
import 'package:chat_app/src/module/authentiaction/cubit/sign_in_cubit.dart'
    as _i520;
import 'package:chat_app/src/module/authentiaction/repository/auth_repository.dart'
    as _i718;
import 'package:chat_app/src/module/authentiaction/service/auth_service.dart'
    as _i122;
import 'package:chat_app/src/module/setting/cubit/setting_cubit.dart' as _i1063;
import 'package:chat_app/src/module/setting/repository/setting_repository.dart'
    as _i701;
import 'package:chat_app/src/module/setting/service/setting_service.dart'
    as _i132;
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
    gh.factory<_i132.SettingService>(
      () => _i132.SettingService(gh<_i59.FirebaseAuth>()),
    );
    gh.factory<_i122.AuthService>(
      () => _i122.AuthService(gh<_i59.FirebaseAuth>()),
    );
    gh.factory<_i701.SettingRepository>(
      () => _i701.SettingRepository(gh<_i132.SettingService>()),
    );
    gh.factory<_i1063.SettingCubit>(
      () => _i1063.SettingCubit(gh<_i701.SettingRepository>()),
    );
    gh.factory<_i718.AuthRepository>(
      () => _i718.AuthRepository(gh<_i122.AuthService>()),
    );
    gh.factory<_i235.RegisterCubit>(
      () => _i235.RegisterCubit(gh<_i718.AuthRepository>()),
    );
    gh.factory<_i520.SignInCubit>(
      () => _i520.SignInCubit(gh<_i718.AuthRepository>()),
    );
    return this;
  }
}

class _$LoggerModule extends _i236.LoggerModule {}

class _$FirebaseModule extends _i122.FirebaseModule {}
