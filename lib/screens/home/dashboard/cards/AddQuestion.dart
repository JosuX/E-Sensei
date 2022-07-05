// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esensei/controllers/users_controller.dart';
import 'package:esensei/models/subject.dart';
import 'package:esensei/screens/home/dashboard/cards/SubjectCard_List.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:uuid/uuid.dart';

class AddQuestion extends StatefulWidget {
  final Function toggleView;
  final Subject? subject;
  AddQuestion({
    required this.toggleView,
    required this.subject,
  });

  @override
  State<AddQuestion> createState() => _SubjectFeedState();
}

class _SubjectFeedState extends State<AddQuestion> {
  String question = "";
  var uuid = Uuid();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          widget.toggleView("SubjectFeed", widget.subject);
          return Future.value(false);
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 100.w,
                  height: 23.99.h,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment(0, -1),
                          end: Alignment(0, 0.7),
                          colors: [
                        hexToColor(widget.subject!.color!),
                        Color(0xffC4C4C4)
                      ])),
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 4.h)),
                      Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                              onPressed: () {
                                widget.toggleView(
                                    "SubjectFeed", widget.subject);
                              },
                              icon: Icon(Icons.arrow_back),
                              iconSize: 3.5.h,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              children: [
                                Padding(padding: EdgeInsets.only(top: 3.25.h)),
                                Container(
                                    height: 8.3.h,
                                    width: 53.89.w,
                                    child: AutoSizeText(
                                      widget.subject!.subj_name!,
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontFamily: "Roboto-Medium"),
                                      minFontSize: 25,
                                    )),
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 5.38.h)),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.only(left: 3.88.w),
                          width: 43.06.w,
                          height: 2.38.h,
                          child: AutoSizeText(
                            "Adding Question...",
                            maxLines: 1,
                            style: TextStyle(fontFamily: "Inter-Regular"),
                            minFontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Color(0xffC4C4C4),
                  width: 100.w,
                  height: 76.h,
                  child: Column(children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(3))),
                      padding: EdgeInsets.symmetric(horizontal: 2.5.w),
                      margin: EdgeInsets.only(top: 3.25.h),
                      width: 93.89.w,
                      child: Column(
                        children: [
                          TextField(
                            onChanged: (val) => setState(() {
                              question = val;
                            }),
                            style: TextStyle(
                                fontFamily: "Inter-Regular", fontSize: 13),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Add your question here..."),
                            keyboardType: TextInputType.multiline,
                            minLines: 1,
                            maxLines: 5,
                          ),
                          Divider(
                            height: 1,
                            thickness: 1,
                            color: Colors.black,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: 11.67.w,
                                height: 6.h,
                                child: GetX<UsersController>(
                                    builder: (controller) {
                                  var currentUser =
                                      controller.currentUser.value.name;
                                  return TextButton(
                                    onPressed: () async {
                                      var uid = uuid.v1();
                                      await widget.subject?.posts
                                          ?.doc(uid)
                                          .set({
                                        'author': currentUser,
                                        'content': question,
                                        'date':
                                            Timestamp.fromDate(DateTime.now()),
                                        'id': uid,
                                        'stars': 0
                                      });
                                      widget.toggleView(
                                          "SubjectFeed", widget.subject);
                                    },
                                    child: AutoSizeText(
                                      "Add",
                                    ),
                                  );
                                }),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ]),
                ),
              ],
            ),
          ),
        ));
  }
}
