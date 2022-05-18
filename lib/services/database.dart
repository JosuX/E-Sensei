// ignore_for_file: dead_code, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esensei/models/user.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});
  // collection reference
  final CollectionReference users =
      FirebaseFirestore.instance.collection("users");
  final CollectionReference subjects =
      FirebaseFirestore.instance.collection("subjects");

  Future registerUserData(String email, String name, bool isMentor) async {
    return await users.doc(uid).set({
      'email': email,
      "name": name,
      'isMentor': isMentor,
      "photo": null,
      "bookmarks": null,
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
      return null;
    }
  }

  //Get Users Stream
  Stream<QuerySnapshot> get usersSnapshot {
    return users.snapshots();
  }
}
