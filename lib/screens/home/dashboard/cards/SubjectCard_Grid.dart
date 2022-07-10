// ignore_for_file: prefer_const_constructors, unnecessary_new, sized_box_for_whitespace, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, camel_case_types
import 'package:auto_size_text/auto_size_text.dart';
import 'package:esensei/models/subject.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SubjectCard_Grid extends StatefulWidget {
  final Subject subject;
  final Function toggleView;

  SubjectCard_Grid({required this.toggleView, required this.subject});

  @override
  State<SubjectCard_Grid> createState() => _SubjectCard_GridState();
}

class _SubjectCard_GridState extends State<SubjectCard_Grid> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.toggleView("SubjectFeed", subject: widget.subject);
      },
      child: Column(
        children: [
          Container(
            width: 43.61.w,
            height: 13.63.h,
            decoration: BoxDecoration(
                color: hexToColor(widget.subject.color!),
                borderRadius: BorderRadius.circular(10)),
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(top: 2.75.h),
              ),
              Container(
                height: 4.h,
                child: AutoSizeText(
                  widget.subject.subj_name!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Inter-Medium", color: Colors.white),
                  maxLines: 1,
                  minFontSize: 20,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 1.61.h),
              ),
              Divider(
                indent: 2.5.w,
                endIndent: 1.94.w,
                height: 1,
                thickness: 1,
                color: Colors.black,
              ),
              Padding(
                padding: EdgeInsets.only(top: 0.64.h),
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
        ],
      ),
    );
  }
}

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}
