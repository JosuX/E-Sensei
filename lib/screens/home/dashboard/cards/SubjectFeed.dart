// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SubjectFeed extends StatefulWidget {
  @override
  State<SubjectFeed> createState() => _SubjectFeedState();
}

class _SubjectFeedState extends State<SubjectFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 100.w,
            height: 18.5.h,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment(0, -1),
                    end: Alignment(0, 1),
                    colors: [Color(0xff006BA6), Colors.white])),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 4.h)),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () {},
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
                                "Data Management",
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
          )
        ],
      ),
    );
  }
}
