// ignore_for_file: dead_code

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esensei/models/MyUser.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});
  // collection reference
  final CollectionReference users =
      FirebaseFirestore.instance.collection("users");

  Future registerUserData(String email, String name, bool isMentor) async {
    return await users.doc(uid).set({
      'email': email,
      "name": name,
      'isMentor': isMentor,
      "photo": null,
      "bookmarks": null,
      "subjects": null
    });
  }

  Future<MyUser?> getUserData() async {
    final ref = users.doc(uid).withConverter(
        fromFirestore: MyUser.fromFirestore,
        toFirestore: (MyUser user, _) => user.toFirestore());
    final docSnap = await ref.get();
    final user = docSnap.data();
    if (user != null) {
      return user;
    } else {
      print("User doesn't exist.");
    }
  }
}
