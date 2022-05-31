// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Post extends StatefulWidget {
  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(3))),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 83.765.w)),
                  SizedBox(
                    height: 3.h,
                    child: PopupMenuButton(
                        iconSize: 18,
                        padding: EdgeInsets.all(0),
                        icon: Icon(Icons.more_horiz),
                        itemBuilder: (context) => [
                              PopupMenuItem(
                                child: Text("Answer"),
                                value: 1,
                              ),
                              PopupMenuItem(
                                child: Text("Delete"),
                                value: 2,
                              ),
                              PopupMenuItem(
                                child: Text("Bookmark"),
                                value: 3,
                              )
                            ]),
                  ),
                ],
              ),
              Container(
                color: Colors.blue,
                width: 90.56.w,
                child: AutoSizeText(
                  "Grab your reader’s attention with a great quote from the document or use this space to emphasize a key point. To place this text box anywhere on the page, just drag it.",
                  minFontSize: 12,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontFamily: "Inter-Regular"),
                ),
              ),
              Row(children: [
                AutoSizeText(
                  "By: ",
                  minFontSize: 11,
                  style: TextStyle(fontFamily: "Inter-Regular"),
                ),
                Image.asset("assets/UserC.png"),
                AutoSizeText(
                  "Example user name",
                  minFontSize: 11,
                  style: TextStyle(fontFamily: "Inter-Regular"),
                ),
                Padding(padding: EdgeInsets.only(left: 30.w)),
                AutoSizeText(
                  "2 hours ago",
                  minFontSize: 12,
                  style: TextStyle(fontFamily: "Inter-Regular"),
                ),
              ]),
              Padding(padding: EdgeInsets.only(top: 3.62.w)),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 0.016.w)),
                  Image.asset("assets/UserC.png"),
                  Padding(padding: EdgeInsets.only(left: 0.83.w)),
                  Container(
                      width: 80.w,
                      height: 2.88.h,
                      child: TextField(
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xffE0DDDB),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide:
                                      BorderSide(color: Color(0xffE0DDDB)))))),
                  Padding(padding: EdgeInsets.only(left: 1.39.w)),
                  Image.asset("assets/UserC.png"),
                  Padding(padding: EdgeInsets.only(left: 0.036.w)),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 1.h)),
              Container(
                color: Colors.black,
                width: 90.56.w,
                height: 1,
              ),
              Padding(padding: EdgeInsets.only(top: 1.h)),
            ],
          )
        ],
      ),
    );
  }
}
