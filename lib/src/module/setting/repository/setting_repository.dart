import 'package:chat_app/src/common/utils/logger.dart';
import 'package:chat_app/src/module/setting/service/setting_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
class SettingRepository {
  final SettingService _service;
  SettingRepository(this._service);

  User? get currentUser => _service.currentUser;

  Future<void> signOut() async {
    logger.w('SIGN OUT BUTTON CLICKED');
    await _service.signOut();
  }

  Future<void> updateDisplayName(String? name) async {
    logger.w('UPDATE DISPLAYNAME!!!!');
    await _service.updateDisplayName(name);
  }

}