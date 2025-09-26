import 'package:bloc/bloc.dart';
import 'package:chat_app/src/module/setting/repository/setting_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'setting_state.dart';
part 'setting_cubit.freezed.dart';

@injectable
class SettingCubit extends Cubit<SettingState> {
  final SettingRepository _repository;

  SettingCubit(this._repository) : super(SettingState.initial(_repository.currentUser));

  Future<void> signOut() async{
    await _repository.signOut();
  }

  Future<void> updateDisplayName(String? name) async {
    try{
      await _repository.updateDisplayName(name);
      emit(SettingState.initial(_repository.currentUser));
    }
    on FirebaseException catch (e){
      emit(SettingState.error(e.toString()));
    }
  }

}
