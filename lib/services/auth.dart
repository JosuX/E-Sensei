// ignore_for_file: unnecessary_null_comparison, unused_element

import 'package:esensei/models/user.dart';
import 'package:esensei/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create MyUser Object based on Firebase User
  MyUser? userfromFirebase(User? user) {
    return user != null
        ? MyUser(uid: user.uid, name: user.displayName, email: user.email)
        : null;
  }

  Stream<MyUser?> get user {
    return _auth.authStateChanges().map((User? user) => userfromFirebase(user));
  }

  //Sign In Anonymously
  Future loginAno() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user!;
      return userfromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Sign In with Email and Password
  Future loginAccount(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;
      return userfromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Register with Email and Password
  Future createAccount(
      String email, String password, String fullname, int isMentor) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;
      user.updateDisplayName(fullname);
      DatabaseService(uid: user.uid)
          .registerUserData(email, fullname, isMentor == 1 ? true : false);
      return user != null
          ? MyUser(
              uid: user.uid,
              name: user.displayName,
              email: user.email,
              photo_url: user.photoURL,
              isMentor: isMentor == 1 ? true : false)
          : null;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Sign Out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
