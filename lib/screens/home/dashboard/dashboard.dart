// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, sized_box_for_whitespace, deprecated_member_use
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esensei/screens/home/dashboard/SubjectListView.dart';
import 'package:esensei/screens/home/dashboard/cards/SubjectCard.dart';
import 'package:esensei/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:esensei/screens/home/dashboard/NavBar.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: NavBar(),
        body: Stack(children: [
          Container(
              color: Color(0xffC42340),
              height: 14.375.h,
              child: Column(children: [
                Padding(padding: EdgeInsets.only(top: 2.5.h)),
                Row(children: [
                  IconButton(
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    icon: Image.asset(
                      "assets/Menu.png",
                      fit: BoxFit.contain,
                    ),
                    iconSize: 8.33.h,
                  ),
                  Container(
                      width: 55.55.w,
                      margin: EdgeInsets.only(left: 1.94.w),
                      child: Text('Mentor Home Page',
                          style: TextStyle(
                              fontSize: 23,
                              color: Colors.white,
                              fontFamily: "Roboto-Medium")))
                ])
              ])),
          Container(
            width: 100.w,
            child: Column(children: [
              Padding(padding: EdgeInsets.only(top: 2.625.h)),
              Row(children: [
                Container(
                    margin: EdgeInsets.only(left: 6.66.w),
                    width: 25.27.w,
                    height: 3.h,
                    child: AutoSizeText("Subjects",
                        maxLines: 1,
                        style: TextStyle(fontFamily: "Inter-Regular"),
                        minFontSize: 20))
              ]),
              Padding(padding: EdgeInsets.only(top: 1.375.h)),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  child: SubjectListView(),
                  height: 81.25.h)
            ]),
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
