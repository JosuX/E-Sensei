import 'package:cloud_firestore/cloud_firestore.dart';

class Subject {
  final int? subj_id;
  final String? subj_code;
  final String? subj_name;
  final String? color;

  Subject(this.subj_id, this.subj_code, this.subj_name, this.color);

  Subject.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot, SnapshotOptions? options)
      : subj_id = snapshot.data()?["subj_id"],
        subj_code = snapshot.data()?["subj_code"],
        subj_name = snapshot.data()?["subj_name"],
        color = snapshot.data()?["color"];

  Map<String, dynamic> toFirestore() {
    return {
      if (subj_id != null) "subj_id": subj_id,
      if (subj_code != null) "subj_code": subj_code,
      if (subj_name != null) "subj_name": subj_name,
      if (color != null) "color": color,
    };
  }
}
