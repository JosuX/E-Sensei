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
  Future<MyUser?> loginAccountMentee(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;
      MyUser? data = await DatabaseService(uid: user.uid).getUserData();
      if (data!.isMentor == false) {
        return data;
      } else {
        await signOut();
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<MyUser?> loginAccountMentor(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;
      MyUser? data = await DatabaseService(uid: user.uid).getUserData();
      if (data!.isMentor == true) {
        return data;
      } else {
        await signOut();
        return null;
      }
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
      DatabaseService dbService = DatabaseService(uid: user.uid);
      dbService.registerUserData(email, fullname, isMentor == 1 ? true : false);
      MyUser? data = await dbService.getUserData();
      return user != null ? data : null;
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
