import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebaselogin/models/user.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on FB user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream, provider for User model is updatedate
  Stream<User> get user {
    return _auth.onAuthStateChanged
      .map(_userFromFirebaseUser);
  }

  // sign in with anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      return _userFromFirebaseUser(result.user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // sign in action
  Future signInEmailPass(String email, String pass) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: pass);
      return _userFromFirebaseUser(result.user);
    } catch (e) {
      print(e.toString());
      return e.message;
    }
  }

  // sign in with email and pass
  Future registerWithEmailPass(String email, String pass) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: pass);
      return _userFromFirebaseUser(result.user);
    } catch (e) {
      print(e.toString());
      return e.message;
    }
  }

  // register with email/pass

  // sign out
  Future  signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
