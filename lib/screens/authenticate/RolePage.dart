// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RolePage extends StatefulWidget {
  final Function toggleView;
  final Function setRole;
  RolePage({required this.toggleView, required this.setRole});

  @override
  State<RolePage> createState() => _RolePageState();
}

class _RolePageState extends State<RolePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.toggleView("FrontPage");
        return Future.value(false);
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(color: Color(0xffC42340), height: 14.375.h),
            Container(
                width: 100.w,
                decoration: BoxDecoration(
                  color: Color(0xffEDEDED),
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                margin: EdgeInsets.only(top: 10.125.h),
                height: 91.25.h,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 7.875.h),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          margin: EdgeInsets.only(left: 14.72.w),
                          height: 10.h,
                          width: 57.22.w,
                          child: AutoSizeText(
                            "Please choose your role.",
                            textAlign: TextAlign.left,
                            minFontSize: 30,
                            maxLines: 2,
                            style: TextStyle(fontFamily: "Roboto-Medium"),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 7.h),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      width: 74.16.w,
                      height: 8.25.h,
                      child: ElevatedButton(
                        onPressed: () {
                          widget.setRole(1);
                          widget.toggleView("MentorLogin");
                        },
                        child: AutoSizeText(
                          "Mentor",
                          minFontSize: 25,
                          style: TextStyle(fontFamily: "Roboto-Medium"),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xffC42340))),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.25.h),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      width: 74.16.w,
                      height: 8.25.h,
                      child: ElevatedButton(
                        onPressed: () {
                          widget.setRole(0);
                          widget.toggleView("MenteeLogin");
                        },
                        child: AutoSizeText(
                          "Mentee",
                          minFontSize: 25,
                          style: TextStyle(fontFamily: "Roboto-Medium"),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xff7A7975))),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2.h),
                    ),
                    Expanded(
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset(
                            "assets/RolePage.png",
                            fit: BoxFit.contain,
                          )),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
