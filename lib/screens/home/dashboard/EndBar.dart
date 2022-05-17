// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, non_constant_identifier_names, prefer_const_constructors_in_immutables

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esensei/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:sizer/sizer.dart';

class EndBar extends StatelessWidget {
  final Query<MyUser> mentors;
  final Query<MyUser> mentees;

  EndBar({
    required this.mentors,
    required this.mentees,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          child: Column(children: [
            Padding(padding: EdgeInsets.only(top: 3.5.h)),
            AutoSizeText(
              "Users",
              textAlign: TextAlign.center,
              style:
                  TextStyle(fontFamily: "Roboto-Medium", color: Colors.white),
              minFontSize: 23,
            ),
            Padding(padding: EdgeInsets.only(top: 1.5.h)),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 7.88.w),
              child: Column(
                children: [
                  AutoSizeText(
                    "Mentors",
                    style: TextStyle(
                        fontFamily: "Roboto-Medium", color: Colors.white),
                    minFontSize: 22,
                  ),
                ],
              ),
            ),
            FirestoreListView<MyUser>(
                padding: EdgeInsets.only(left: 2.5.w),
                shrinkWrap: true,
                query: mentors,
                itemBuilder: (context, snapshot) {
                  MyUser user = snapshot.data();
                  return ListTile(
                      leading: Icon(Icons.supervised_user_circle),
                      title: Text(user.name!));
                }),
            Divider(
              height: 1,
              thickness: 3,
            ),
          ]),
          color: Color(0xffE3555E)),
    );
  }
}
