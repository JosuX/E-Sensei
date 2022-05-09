// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, sized_box_for_whitespace, use_key_in_widget_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class FrontPage extends StatefulWidget {
  final Function toggleView;
  FrontPage({required this.toggleView});

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  @override
  Widget build(BuildContext context) {
    double Wrefix = (MediaQuery.of(context).size.width) / 360;
    double Hrefix = (MediaQuery.of(context).size.height) / 800;
    return Scaffold(
        body: Stack(children: [
      Container(
        color: Color(0xffC42340),
        height: 115 * Hrefix,
      ),
      Container(
        width: 360 * Wrefix,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 63 * Hrefix),
            ),
            Container(
              child: Image.asset("assets/logo.png"),
              width: 113 * Wrefix,
              height: 111 * Hrefix,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20 * Hrefix),
            ),
            AutoSizeText(
              "Welcome to",
              minFontSize: 35,
              style: TextStyle(fontFamily: "Roboto-Medium"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 14 * Hrefix),
            ),
            Container(
              child: Image.asset("assets/Welcome.png"),
              width: 318 * Wrefix,
              height: 208 * Hrefix,
            ),
            Padding(
              padding: EdgeInsets.only(top: 14 * Hrefix),
            ),
            AutoSizeText(
              "E-Sensei!",
              minFontSize: 30,
              style: TextStyle(fontFamily: "Roboto-Medium"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 26 * Hrefix),
            ),
            Container(
              width: 206 * Wrefix,
              height: 43 * Hrefix,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xffC42340))),
                onPressed: (() {
                  widget.toggleView("RolePage");
                }),
                child: AutoSizeText(
                  "PROCEED",
                  minFontSize: 16,
                  style: TextStyle(fontFamily: "Roboto-Medium"),
                ),
              ),
            )
          ],
        ),
        margin: EdgeInsets.only(top: 81 * Hrefix),
        decoration: BoxDecoration(
          color: Color(0xffEDEDED),
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        height: 730 * Hrefix,
      ),
    ]));
  }
}
