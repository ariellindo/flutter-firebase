import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebaselogin/screens/models/user.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on FB user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream
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

  // sign in with email and pass

  // register with email/pass

  // sign out
}
