

import 'package:firebase_auth/firebase_auth.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign up with email and password
  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
