import 'package:chat_app/src/module/authentiaction/service/auth_service.dart';

import 'package:injectable/injectable.dart';

@injectable
class AuthRepository {
  final AuthService _service;
  AuthRepository(this._service);
  Future<void> register(String username, String password) async {
    await _service.register(email: username, password: password);
  }

  Future<void> signIn(String username, String password) async {
    await _service.signIn(email: username, password: password);
  }
}
