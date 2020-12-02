import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  /// Changed to idTokenChanges as it updates depending on more cases.
  Stream<User> get authStateChanges => _firebaseAuth.idTokenChanges();

  /// This won't pop routes so you could do something like
  /// Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  /// after you called this method if you want to pop all routes.
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return (e.code.replaceAll(RegExp(r'-'), ' '));
      } else if (e.code == 'wrong-password') {
        return (e.code.replaceAll(RegExp(r'-'), ' '));
      }
    }
    return null;
  }

  Future<String> signUp({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return (e.code.replaceAll(RegExp(r'-'), ' '));
      } else if (e.code == 'email-already-in-use') {
        return (e.code.replaceAll(RegExp(r'-'), ' '));
      }
    } catch (e) {
      return (e.code.replaceAll(RegExp(r'-'), ' '));
    }
    return null;
  }
}
