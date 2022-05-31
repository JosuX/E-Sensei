// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:esensei/models/subject.dart';
import 'package:esensei/screens/home/dashboard/cards/SubjectCard_Grid.dart';
import 'package:esensei/services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:sizer/sizer.dart';

class SubjectGridView extends StatefulWidget {
  final Function toggleView;

  SubjectGridView({required this.toggleView});

  @override
  State<SubjectGridView> createState() => _SubjectGridViewState();
}

class _SubjectGridViewState extends State<SubjectGridView> {
  final subjects = DatabaseService()
      .subjects
      .orderBy("subj_name")
      .withConverter(
          fromFirestore: Subject.fromFirestore,
          toFirestore: (Subject subject, _) => subject.toFirestore());

  @override
  Widget build(BuildContext context) {
    return FirestoreQueryBuilder<Subject>(
        query: subjects,
        builder: (context, snapshot, _) {
          if (snapshot.isFetching) {
            return SpinKitFoldingCube(color: Color(0xffC42340), size: 50);
          }
          if (snapshot.hasError) {
            return Text('Something went wrong! ${snapshot.error}');
          }
          return GridView.builder(
              itemCount: snapshot.docs.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.27.w,
                  mainAxisSpacing: 2.375.h,
                  childAspectRatio: 0.259407.h),
              itemBuilder: (context, index) {
                if (snapshot.hasMore && index + 1 == snapshot.docs.length) {
                  // Tell FirestoreQueryBuilder to try to obtain more items.
                  // It is safe to call this function from within the build method.
                  snapshot.fetchMore();
                }
                final subject = snapshot.docs[index].data();
                return SubjectCard_Grid(
                    subject: subject, toggleView: widget.toggleView);
              });
        });
  }
}
