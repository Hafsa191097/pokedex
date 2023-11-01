import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final userStream = FirebaseAuth.instance.authStateChanges();
  final user = FirebaseAuth.instance.currentUser;
  final _auth = FirebaseAuth.instance;

  Future<User?> emailLogin(String email, String password) async {
    var user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  }

  /// Anonymous Firebase login
  Future<void> anonLogin() async {
    await FirebaseAuth.instance.signInAnonymously();
  }

  Future<User?> registerUser(String email, String password) async {
    final newuser = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return newuser.user;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
