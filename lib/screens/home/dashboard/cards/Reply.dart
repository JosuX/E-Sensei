// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:auto_size_text/auto_size_text.dart';
import 'package:esensei/models/post_model.dart';
import 'package:esensei/models/reply_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

class Reply extends StatefulWidget {
  final ReplyModel? model;
  final PostModel? postModel;

  Reply({required this.model, this.postModel});
  @override
  State<Reply> createState() => _ReplyState();
}

class _ReplyState extends State<Reply> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 83.675.w)),
              SizedBox(
                height: 1.5.h,
                child: PopupMenuButton(
                    iconSize: 18,
                    padding: EdgeInsets.all(0),
                    icon: Icon(Icons.more_horiz),
                    itemBuilder: (context) => [
                          PopupMenuItem(
                            child: Text("Delete"),
                            value: 1,
                            onTap: () async {
                              await widget.postModel?.replies
                                  .doc(widget.model?.id)
                                  .delete();
                            },
                          ),
                        ]),
              ),
            ],
          ),
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 6.38.w)),
              Image.asset("assets/UserC.png"),
              AutoSizeText(widget.model!.author!),
              Padding(padding: EdgeInsets.only(left: 1.w)),
              AutoSizeText(
                DateFormat("yyyy-MM-dd").format(widget.model!.date!.toDate()),
              ),
              Padding(padding: EdgeInsets.only(left: 21.66.w)),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 0.25.w)),
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 13.61.w)),
              Container(
                width: 73.33.w,
                child: AutoSizeText(widget.model!.content!),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 2.5.w)),
        ],
      ),
    );
  }
}
