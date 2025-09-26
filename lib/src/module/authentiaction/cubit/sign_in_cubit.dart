import 'package:bloc/bloc.dart';
import 'package:chat_app/src/common/utils/logger.dart';
import 'package:chat_app/src/module/authentiaction/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'sign_in_state.dart';
part 'sign_in_cubit.freezed.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  final AuthRepository _repository;
  SignInCubit(this._repository) : super(SignInState.initial());
  bool validation(String? user, String? pass){
    if (user == null || pass == null || user.isEmpty || pass.isEmpty){
      return false;
    }
    return true;
  }
  Future<void> signIn(String? username, String? password) async{
    emit(SignInState.loading());
    if( !validation(username, password) ){
      emit(SignInState.error('Fill all the blank!!!'));
      return;
    }

    logger.w('Sign In Clicked!!!');
    

    try{
      await _repository.signIn(username!, password!);
      logger.i('SignIn success full');
      emit(SignInState.success());
    }
    on FirebaseAuthException catch (e){
      emit(SignInState.error(e.toString()));
    }

  }
}
