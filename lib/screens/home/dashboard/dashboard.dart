// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, sized_box_for_whitespace, deprecated_member_use, use_key_in_widget_constructors
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esensei/models/user.dart';
import 'package:esensei/screens/home/dashboard/SubjectListView.dart';
import 'package:esensei/screens/home/dashboard/cards/SubjectCard.dart';
import 'package:esensei/services/auth.dart';
import 'package:esensei/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:esensei/screens/home/dashboard/NavBar.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Dashboard extends StatefulWidget {
  final Function toggleView;

  Dashboard({required this.toggleView});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    MyUser? curr_user = Provider.of<CurrentUser?>(context)?.user;
    String? curr_user_name = curr_user?.name;
    String? curr_user_email = curr_user?.email;
    return Scaffold(
        key: _scaffoldKey,
        endDrawer: NavBar(
          user_name: curr_user_name,
          user_email: curr_user_email,
        ),
        drawer: NavBar(
          user_name: curr_user_name,
          user_email: curr_user_email,
        ),
        body: Stack(children: [
          Container(
              color: Color(0xffC42340),
              height: 14.375.h,
              child: Column(children: [
                Padding(padding: EdgeInsets.only(top: 2.8.h)),
                Row(children: [
                  SizedBox(
                    width: 10.w,
                    child: TextButton(
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                      child: Image.asset(
                        "assets/Menu.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Container(
                      width: 55.55.w,
                      margin: EdgeInsets.only(left: 1.94.w),
                      child: Text('Mentor Home Page',
                          style: TextStyle(
                              fontSize: 23,
                              color: Colors.white,
                              fontFamily: "Roboto-Medium"))),
                  Padding(padding: EdgeInsets.only(left: 6.38.w)),
                  SizedBox(
                    width: 10.w,
                    child: TextButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.grid_view_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                    child: TextButton(
                        onPressed: () {
                          _scaffoldKey.currentState?.openEndDrawer();
                        },
                        child: Image.asset("assets/User_fill.png")),
                  )
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
                  child: SubjectListView(toggleView: widget.toggleView),
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
