// ignore_for_file: prefer_const_constructors
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SubjectCard extends StatefulWidget {
  SubjectCard({Key? key}) : super(key: key);

  @override
  State<SubjectCard> createState() => _SubjectCardState();
}

class _SubjectCardState extends State<SubjectCard> {
  @override
  Widget build(BuildContext context) {
    double Wrefix = (MediaQuery.of(context).size.width) / 360;
    double Hrefix = (MediaQuery.of(context).size.height) / 800;
    var menuItems = <String>['Delete'];
    return Container(
      width: 157 * Wrefix,
      height: 109 * Hrefix,
      decoration: BoxDecoration(
          color: Color(0xff006BA6),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 3 * Wrefix,
              height: 12 * Hrefix,
              child: PopupMenuButton(
                  elevation: 0,
                  offset: Offset(200, 0),
                  itemBuilder: (BuildContext context) {
                    return menuItems.map((String choice) {
                      return PopupMenuItem<String>(
                        child: Text(choice),
                        value: choice,
                      );
                    }).toList();
                  }),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8 * Hrefix),
          ),
          AutoSizeText(
            "CpET15-M",
            minFontSize: 20,
          ),
          Padding(
            padding: EdgeInsets.only(top: 12 * Hrefix),
          ),
          Container(
            width: 141 * Wrefix,
            child: Divider(
              color: Colors.black,
              thickness: 1.5,
            ),
          )
        ],
      ),
    );
  }
}
