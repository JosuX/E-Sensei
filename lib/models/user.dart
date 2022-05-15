// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class MyUser {
  final String? uid;
  final String? email;
  final String? name;
  final String? photo_url;
  final bool? isMentor;
  final List<String>? bookmarks;

  MyUser(
      {this.uid,
      this.email,
      this.name,
      this.photo_url,
      this.isMentor,
      this.bookmarks});

  MyUser.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  )   : uid = snapshot.id,
        name = snapshot.data()?["name"],
        email = snapshot.data()?["email"],
        photo_url = snapshot.data()?["photo"],
        isMentor = snapshot.data()?["isMentor"],
        bookmarks = snapshot.data()?["bookmarks"];

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (email != null) "email": email,
      if (photo_url != null) "photo": photo_url,
      if (isMentor != null) "isMentor": isMentor,
      if (bookmarks != null) "bookmarks": bookmarks,
    };
  }
}
