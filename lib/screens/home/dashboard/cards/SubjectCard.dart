// ignore_for_file: prefer_const_constructors, unnecessary_new, sized_box_for_whitespace
import 'package:auto_size_text/auto_size_text.dart';
import 'package:esensei/models/subject.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SubjectCard extends StatefulWidget {
  final Subject subject;
  final Function toggleView;

  SubjectCard({required this.toggleView, required this.subject});

  @override
  State<SubjectCard> createState() => _SubjectCardState();
}

class _SubjectCardState extends State<SubjectCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.toggleView("SubjectFeed", widget.subject);
      },
      child: Column(
        children: [
          Container(
            width: 94.16.w,
            height: 11.625.h,
            decoration: BoxDecoration(
                color: hexToColor(widget.subject.color!),
                borderRadius: BorderRadius.circular(15)),
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(top: 2.193.h),
              ),
              Container(
                height: 3.51.h,
                child: AutoSizeText(
                  widget.subject.subj_name!,
                  style: TextStyle(
                      fontFamily: "Inter-Medium", color: Colors.white),
                  maxLines: 1,
                  minFontSize: 20,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 0.86.h),
              ),
              Divider(
                indent: 2.77.w,
                endIndent: 2.5.w,
                height: 1,
                thickness: 1,
                color: Colors.black,
              ),
              Padding(
                padding: EdgeInsets.only(top: 0.44.h),
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.only(right: 1.27.w),
                    child: Image.asset(
                      "assets/Bell_fill.png",
                      fit: BoxFit.contain,
                    ),
                    width: 8.33.w,
                    height: 3.75.h,
                  ))
            ]),
          ),
          Padding(
            padding: EdgeInsets.only(top: 1.325.h),
          ),
        ],
      ),
    );
  }
}

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}
