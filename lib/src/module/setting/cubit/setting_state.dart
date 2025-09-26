part of 'setting_cubit.dart';

@freezed
abstract class SettingState with _$SettingState {
  const factory SettingState.initial(User? currentUser) = _Initial;
  const factory SettingState.error(String message) = _Error;
}
