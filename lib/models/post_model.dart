// ignore_for_file: unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String id;
  final String content;
  final String author;
  final int stars;
  final CollectionReference replies;
  final Timestamp date;

  PostModel(
      this.id, this.content, this.author, this.stars, this.replies, this.date);
  PostModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot, SnapshotOptions? options)
      : id = snapshot.data()?["id"],
        content = snapshot.data()?["content"],
        date = snapshot.data()?["date"],
        author = snapshot.data()?["author"],
        stars = snapshot.data()?["stars"],
        replies = snapshot.reference.collection("replies");

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (content != null) "content": content,
      if (date != null) "date": date,
      if (author != null) "author": author,
      if (stars != null) "stars": stars,
      if (replies != null) "replies": replies
    };
  }
}
