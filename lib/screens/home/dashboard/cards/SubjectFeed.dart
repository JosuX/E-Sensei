// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:esensei/models/subject.dart';
import 'package:esensei/screens/home/dashboard/cards/Post.dart';
import 'package:esensei/screens/home/dashboard/cards/SubjectCard.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SubjectFeed extends StatefulWidget {
  final Function toggleView;
  final Subject? subject;
  SubjectFeed({
    required this.toggleView,
    required this.subject,
  });

  @override
  State<SubjectFeed> createState() => _SubjectFeedState();
}

class _SubjectFeedState extends State<SubjectFeed> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.toggleView("Dashboard", null);
        return Future.value(false);
      },
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: 100.w,
              height: 18.5.h,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment(0, -1),
                      end: Alignment(0, 1),
                      colors: [
                    hexToColor(widget.subject!.color!),
                    Colors.white
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
                            widget.toggleView("Dashboard", null);
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
                                  style: TextStyle(fontFamily: "Roboto-Medium"),
                                  minFontSize: 25,
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.only(left: 3.88.w),
                      width: 33.06.w,
                      height: 2.38.h,
                      child: AutoSizeText(
                        "Questions List:",
                        maxLines: 1,
                        style: TextStyle(fontFamily: "Inter-Regular"),
                        minFontSize: 15,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.red,
              padding: EdgeInsets.all(1.375.h),
              height: 81.h,
              child: ListView(
                children: [Post()],
              ),
            )
          ],
        ),
      ),
    );
  }
}
