// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esensei/models/subject.dart';
import 'package:esensei/screens/home/dashboard/cards/SubjectCard.dart';
import 'package:esensei/services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterfire_ui/firestore.dart';

class SubjectListView extends StatefulWidget {
  final Function toggleView;

  SubjectListView({required this.toggleView});

  @override
  State<SubjectListView> createState() => _SubjectListViewState();
}

class _SubjectListViewState extends State<SubjectListView> {
  final subjects = FirebaseFirestore.instance
      .collection("subjects")
      .orderBy("subj_name")
      .withConverter(
          fromFirestore: Subject.fromFirestore,
          toFirestore: (Subject subject, _) => subject.toFirestore());

  @override
  Widget build(BuildContext context) {
    return FirestoreListView<Subject>(
        padding: EdgeInsets.all(0),
        query: subjects,
        itemBuilder: (context, snapshot) {
          final subject = snapshot.data();
          return SubjectCard(
            subject: subject,
            toggleView: widget.toggleView,
          );
        },
        loadingBuilder: (context) =>
            SpinKitFoldingCube(color: Color(0xffC42340), size: 50));
  }
}
