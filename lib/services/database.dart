// ignore_for_file: dead_code, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esensei/models/user.dart';

class DatabaseService {
  final String? uid;
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

  MyUser _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return MyUser(
      uid: uid,
      name: snapshot["name"],
      email: snapshot["email"],
      photo_url: snapshot["photo"],
      isMentor: snapshot["isMentor"],
      bookmarks: snapshot["bookmarks"],
      subjects: snapshot["subjects"],
    );
  }

  //Get User Stream
  Stream<MyUser> get userSnapshot {
    return users.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
