import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebaselogin/models/user.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  // final Firestore _db = Firestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // create user obj based on Firebase user
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
      return e.message;
    }
  }

  // Register in with email and pass
  Future registerWithEmailPass(String email, String pass) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: pass);
      return _userFromFirebaseUser(result.user);
    } catch (e) {
      return e.message;
    }
  }

  // register with GOOGLE
  Future googleSignIn() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
      final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
      _userFromFirebaseUser(user);

      print("Google: " + user.displayName);

    } catch (e) {
      return e.message;
    }
  }

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
