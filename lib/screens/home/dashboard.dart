// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, sized_box_for_whitespace, deprecated_member_use

import 'package:dashboard/navigation_drawer.dart';
import 'package:flutter/material.dart';

class Template extends StatefulWidget {
  const Template({Key? key}) : super(key: key);

  @override
  State<Template> createState() => _TemplateState();
}

class _TemplateState extends State<Template> {
  @override
  Widget build(BuildContext context) {
    double Wrefix = (MediaQuery.of(context).size.width) / 360;
    double Hrefix = (MediaQuery.of(context).size.height) / 800;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_circle_outline_sharp),
        backgroundColor: Colors.red,
        hoverColor: Colors.white,
        onPressed: () {},
      ),
        drawer: NavBar(),
        body: Stack(children: [
      Container(
        color: Color(0xffC42340),
        height: 115 * Hrefix,
        child: Column(
          children: [
            Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 31 * Hrefix)),
                Row(
                  children: [
                    Container(
                      width: 200,
                      margin: EdgeInsets.only(left: 60),
                      child: Text('Mentor Home Page',style: TextStyle(fontSize: 23, color: Colors.white))
                    )
                  ]
                )
              ]
            )
          ]
        )
      ),
      Container(
        width: 360 * Wrefix,
        child: Column(
          children: [
            Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 21 * Hrefix)),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 115,
                          height: 24,
                          child: FlatButton.icon(
                            label: Text('Subjects'),
                            onPressed: () {},
                            icon: Icon(Icons.arrow_drop_down)
                          )
                        )
                      ]
                    )
                  ]
                )
              ]
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