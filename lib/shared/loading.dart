// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sizer/sizer.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        color: Color(0xffC42340),
        height: 14.375.h,
      ),
      Container(
        width: 100.w,
        margin: EdgeInsets.only(top: 10.125.h),
        decoration: BoxDecoration(
          color: Color(0xffEDEDED),
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: Center(
            child: SpinKitFoldingCube(color: Color(0xffC42340), size: 50)),
      )
    ]));
  }
}
