// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, sized_box_for_whitespace, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FrontPage extends StatefulWidget {
  final Function toggleView;
  FrontPage({required this.toggleView});

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        color: Color(0xffC42340),
        height: 12.88.h,
      ),
      Container(
        width: 100.w,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 7.875.h),
            ),
            Container(
              child: Image.asset(
                "assets/logo.png",
                fit: BoxFit.contain,
              ),
              width: 31.39.w,
              height: 13.88.h,
            ),
            Padding(
              padding: EdgeInsets.only(top: 2.5.h),
            ),
            AutoSizeText(
              "Welcome to",
              minFontSize: 35,
              style: TextStyle(fontFamily: "Roboto-Medium"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 1.75.h),
            ),
            Container(
              child: Image.asset(
                "assets/Welcome.png",
                fit: BoxFit.contain,
              ),
              width: 88.33.w,
              height: 26.h,
            ),
            Padding(
              padding: EdgeInsets.only(top: 1.75.h),
            ),
            AutoSizeText(
              "E-Sensei!",
              minFontSize: 30,
              style: TextStyle(fontFamily: "Roboto-Medium"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 3.25.h),
            ),
            Container(
              width: 57.22.w,
              height: 5.38.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xffC42340))),
                onPressed: (() {
                  widget.toggleView("RolePage");
                }),
                child: AutoSizeText(
                  "PROCEED",
                  minFontSize: 16,
                  style: TextStyle(fontFamily: "Roboto-Medium"),
                ),
              ),
            )
          ],
        ),
        margin: EdgeInsets.only(top: 10.125.h),
        decoration: BoxDecoration(
          color: Color(0xffEDEDED),
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        height: 91.25.h,
      ),
    ]));
  }
}
