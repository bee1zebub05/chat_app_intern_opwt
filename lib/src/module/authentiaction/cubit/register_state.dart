part of 'register_cubit.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial({required bool isValid}) = _Initial;
  const factory RegisterState.error(String message) = _Error;
  const factory RegisterState.loading() = _Loading;
  const factory RegisterState.success() = _Success;
}
