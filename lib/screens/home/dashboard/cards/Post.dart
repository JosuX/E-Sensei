// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esensei/controllers/users_controller.dart';
import 'package:esensei/models/post_model.dart';
import 'package:esensei/models/reply_model.dart';
import 'package:esensei/models/subject.dart';
import 'package:esensei/screens/home/dashboard/cards/Reply.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class Post extends StatefulWidget {
  final PostModel? model;
  final Subject? subject;
  final Function toggleView;

  Post({required this.model, required this.subject, required this.toggleView});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  String reply = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.75.h),
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
                  Padding(padding: EdgeInsets.only(left: 83.675.w)),
                  SizedBox(
                    height: 3.h,
                    child: GetX<UsersController>(builder: (controller) {
                      if (controller.currentUser.value.name ==
                          widget.model?.author) {
                        return PopupMenuButton(
                            iconSize: 18,
                            padding: EdgeInsets.all(0),
                            icon: Icon(Icons.more_horiz),
                            itemBuilder: (context) => [
                                  PopupMenuItem(
                                    child: Text("Answer"),
                                    value: 1,
                                    onTap: () {
                                    },
                                  ),
                                  PopupMenuItem(
                                    child: Text("Delete"),
                                    value: 2,
                                    onTap: () async {
                                      await widget.subject?.posts
                                          ?.doc(widget.model?.id)
                                          .delete();
                                    },
                                  ),
                                  PopupMenuItem(
                                    child: Text("Bookmark"),
                                    value: 3,
                                  )
                                ]);
                      }
                      return Container();
                    }),
                  ),
                ],
              ),
              Container(
                width: 90.56.w,
                child: AutoSizeText(
                  widget.model!.content,
                  minFontSize: 12,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontFamily: "Inter-Regular"),
                ),
              ),
              SizedBox(
                width: 90.56.w,
                height: 24,
                child: Row(children: [
                  AutoSizeText(
                    "By: ",
                    minFontSize: 11,
                    style: TextStyle(fontFamily: "Inter-Regular"),
                  ),
                  Image.asset("assets/UserC.png"),
                  AutoSizeText(
                    widget.model!.author,
                    minFontSize: 11,
                    style: TextStyle(fontFamily: "Inter-Regular"),
                  ),
                  Spacer(flex: 1),
                  AutoSizeText(
                    DateFormat("yyyy-MM-dd")
                        .format(widget.model!.date.toDate()),
                    minFontSize: 12,
                    style: TextStyle(fontFamily: "Inter-Regular"),
                  ),
                ]),
              ),
              Padding(padding: EdgeInsets.only(top: 3.62.w)),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 0.016.w)),
                  Image.asset("assets/UserC.png"),
                  Padding(padding: EdgeInsets.only(left: 0.83.w)),
                  Container(
                      width: 80.w,
                      color: Color(0xffE0DDDB),
                      child: TextField(
                        scrollPadding: EdgeInsets.all(0),
                        minLines: 1,
                        style: TextStyle(
                            fontSize: 13, fontFamily: "Inter-Regular"),
                        onChanged: ((value) => reply = value),
                        keyboardType: TextInputType.multiline,
                      )),
                  Padding(padding: EdgeInsets.only(left: 1.39.w)),
                  GetX<UsersController>(builder: (controller) {
                    var currentUser = controller.currentUser.value.name;
                    return InkWell(
                      onTap: () async {
                        var uid = Uuid().v1();
                        await widget.model?.replies.doc(uid).set({
                          'author': currentUser,
                          'content': reply,
                          'date': Timestamp.fromDate(DateTime.now()),
                          'id': uid,
                          'stars': 0
                        });
                        FocusScope.of(context).unfocus();
                        setState(() {});
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              border: Border.all(color: Colors.black, width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Image.asset("assets/Send_fill.png")),
                    );
                  }),
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
              SizedBox(
                width: 95.43.w,
                child: FirestoreListView<ReplyModel>(
                    shrinkWrap: true,
                    padding: EdgeInsets.all(0),
                    query: widget.model!.replies.orderBy("id").withConverter(
                        fromFirestore: ReplyModel.fromFirestore,
                        toFirestore: (ReplyModel model, _) =>
                            model.toFirestore()),
                    itemBuilder: (context, snapshot) {
                      return Reply(
                        model: snapshot.data(),
                        postModel: widget.model,
                      );
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
