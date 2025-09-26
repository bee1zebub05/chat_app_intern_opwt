import 'package:bloc/bloc.dart';
import 'package:chat_app/src/common/utils/logger.dart';
import 'package:chat_app/src/module/authentiaction/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'register_state.dart';
part 'register_cubit.freezed.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository _repository;
  RegisterCubit(this._repository) : super(RegisterState.initial(isValid: false));

  void validation(String? pass, String? rePass){
    final isValid = pass != null && rePass != null && pass.isNotEmpty && rePass.isNotEmpty && pass == rePass;
    emit(RegisterState.initial(isValid: isValid));
  }
  Future <void> register(String username, String password) async {
    emit(RegisterState.loading());
    logger.d('Username: $username \n password: $password');
    logger.w('Register clicked');
    try{
      await _repository.register(username, password);
      emit(RegisterState.success());
    }
    on FirebaseAuthException catch (e){
      emit(RegisterState.error(e.toString()));
    }
  }
}
