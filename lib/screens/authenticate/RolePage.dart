// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class RolePage extends StatefulWidget {
  final Function toggleView;
  final Function setRole;
  RolePage({required this.toggleView, required this.setRole});

  @override
  State<RolePage> createState() => _RolePageState();
}

class _RolePageState extends State<RolePage> {
  @override
  Widget build(BuildContext context) {
    double Wrefix = (MediaQuery.of(context).size.width) / 360;
    double Hrefix = (MediaQuery.of(context).size.height) / 800;

    return Scaffold(
      body: Stack(
        children: [
          Container(color: Color(0xffC42340), height: 115 * Hrefix),
          Container(
              width: 360 * Wrefix,
              decoration: BoxDecoration(
                color: Color(0xffEDEDED),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              margin: EdgeInsets.only(top: 81 * Hrefix),
              height: 730 * Hrefix,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 63 * Hrefix),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        margin: EdgeInsets.only(left: 53 * Wrefix),
                        height: 80 * Hrefix,
                        width: 206 * Wrefix,
                        child: AutoSizeText(
                          "Please choose your role.",
                          textAlign: TextAlign.left,
                          minFontSize: 30,
                          maxLines: 2,
                          style: TextStyle(fontFamily: "Roboto-Medium"),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 56 * Hrefix),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    width: 267 * Wrefix,
                    height: 66 * Hrefix,
                    child: ElevatedButton(
                      onPressed: () {
                        widget.setRole(1);
                        widget.toggleView("MentorLogin");
                      },
                      child: AutoSizeText(
                        "Mentor",
                        minFontSize: 25,
                        style: TextStyle(fontFamily: "Roboto-Medium"),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xffC42340))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 42 * Hrefix),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    width: 267 * Wrefix,
                    height: 66 * Hrefix,
                    child: ElevatedButton(
                      onPressed: () {
                        widget.setRole(0);
                        widget.toggleView("MenteeLogin");
                      },
                      child: AutoSizeText(
                        "Mentee",
                        minFontSize: 25,
                        style: TextStyle(fontFamily: "Roboto-Medium"),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xff7A7975))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16 * Hrefix),
                  ),
                  Expanded(
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Image.asset(
                          "assets/RolePage.png",
                        )),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
