import 'package:firebase_auth/firebase_auth.dart';

/// Firebase Authentication
class Authentication {
  final _auth = FirebaseAuth.instance;

  // ログインしてるかチェック
  bool get isLoggedIn => _auth.currentUser != null;

  // 匿名認証
  Future<UserCredential> signInWithAnonymously() => _auth.signInAnonymously();

  // ログアウト
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // ユーザー削除
  Future<void> userDelete(User user) async {
    await user.delete();
  }
}
