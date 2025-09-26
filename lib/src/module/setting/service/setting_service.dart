import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
class SettingService {
  final FirebaseAuth _firebaseAuth;
  SettingService(this._firebaseAuth);

  User? get currentUser => _firebaseAuth.currentUser;

  Future<void> signOut() async{
    return await _firebaseAuth.signOut();
  }
}