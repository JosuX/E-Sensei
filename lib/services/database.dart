// ignore_for_file: dead_code, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esensei/models/subject.dart';
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

  MyUser _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return MyUser(
      uid: uid,
      name: snapshot["name"],
      email: snapshot["email"],
      photo_url: snapshot["photo"],
      isMentor: snapshot["isMentor"],
      bookmarks: snapshot["bookmarks"],
    );
  }

  //Get Current User Stream
  Stream<CurrentUser> get currentUserSnapshot {
    return users.doc(uid).snapshots().map((event) {
      return CurrentUser(_userDataFromSnapshot(event));
    });
  }

  //Get Users Stream
  Stream<QuerySnapshot> get usersSnapshot {
    return users.snapshots();
  }
}

class CurrentUser {
  final MyUser user;

  CurrentUser(this.user);
}
