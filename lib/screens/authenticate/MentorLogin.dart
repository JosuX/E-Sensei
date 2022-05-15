// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, deprecated_member_use, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:auto_size_text/auto_size_text.dart';
import 'package:esensei/models/user.dart';
import 'package:esensei/services/auth.dart';
import 'package:esensei/shared/loading.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MentorLogin extends StatefulWidget {
  final Function toggleView;
  MentorLogin({required this.toggleView});

  @override
  State<MentorLogin> createState() => _MentorLoginState();
}

class _MentorLoginState extends State<MentorLogin> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  bool rememberMe = false;
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : WillPopScope(
            onWillPop: () async {
              widget.toggleView("RolePage");
              return Future.value(false);
            },
            child: Scaffold(
                body: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Stack(children: [
                  Container(
                    color: Color(0xffC42340),
                    height: 14.375.h,
                  ),
                  Container(
                    width: 100.w,
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Padding(padding: EdgeInsets.only(top: 9.5.h)),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: 57.22.w,
                                      height: 4.375.h,
                                      child: AutoSizeText(
                                        "Hi, Mentor!",
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontFamily: "Roboto-Medium"),
                                      ),
                                      margin: EdgeInsets.only(left: 8.88.w),
                                    ),
                                    Padding(padding: EdgeInsets.only(top: 2.h)),
                                    Container(
                                      width: 57.22.w,
                                      height: 7.875.h,
                                      child: AutoSizeText(
                                        "Please fill up the necessary information to continue",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: "Roboto-Light"),
                                      ),
                                      margin: EdgeInsets.only(left: 8.88.w),
                                    ),
                                  ],
                                ),
                                Padding(padding: EdgeInsets.only(left: 1.66.w)),
                                Container(
                                    height: 11.375.h,
                                    width: 19.35.w,
                                    child: Image.asset(
                                      'assets/SignIn.png',
                                      fit: BoxFit.contain,
                                    ))
                              ],
                            )
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 3.h)),
                        Container(
                            width: 57.22.w,
                            height: 2.375.h,
                            child: AutoSizeText(
                              "E-mail/Username",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontFamily: "Roboto-Medium"),
                            )),
                        Container(
                            width: 74.16.w,
                            height: 6.5.h,
                            child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                validator: (val) =>
                                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                            .hasMatch(email)
                                        ? "Enter a valid and registered email"
                                        : null,
                                onChanged: (val) {
                                  setState(() => email = val);
                                },
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Color(0xffE0DDDB),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        borderSide: BorderSide(
                                            color: Color(0xffE0DDDB)))))),
                        Padding(padding: EdgeInsets.only(top: 3.5.h)),
                        Container(
                            width: 57.22.w,
                            height: 2.375.h,
                            child: AutoSizeText("Password",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontFamily: "Roboto-Light"))),
                        Container(
                            width: 74.16.w,
                            height: 6.5.h,
                            child: TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                validator: (val) => val!.length < 8
                                    ? "Password must be 8 characters in length"
                                    : null,
                                onChanged: (val) {
                                  setState(() => password = val);
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Color(0xffE0DDDB),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        borderSide: BorderSide(
                                            color: Color(0xffE0DDDB)))))),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.only(left: 13.05.w)),
                            Checkbox(
                              tristate: true,
                              onChanged: (bool? value) {},
                              value: null,
                            ),
                            Container(
                                width: 57.22.w,
                                height: 2.25.h,
                                child: AutoSizeText(
                                  "Remember Me",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Roboto-LightItalic"),
                                ))
                          ],
                        ),
                        Container(
                          width: 57.22.w,
                          height: 5.375.h,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xffC42340))),
                            child: AutoSizeText("LOGIN",
                                style: TextStyle(fontFamily: "Roboto-Medium")),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() => loading = true);
                                MyUser? result = await _auth.loginAccountMentor(
                                    email, password);
                                if (result == null) {
                                  if (this.mounted) {
                                    setState(() => loading = false);
                                  }
                                }
                              }
                            },
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 1.375.h)),
                        Container(
                          width: 57.22.w,
                          height: 5.375.h,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xff7A7975))),
                            child: Text("LOGIN WITH GOOGLE",
                                style: TextStyle(fontFamily: "Roboto-Medium")),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {}
                            },
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 4.875.h)),
                        Container(
                            child: RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Roboto-LightItalic"),
                              children: <TextSpan>[
                                TextSpan(text: "Don't have an account yet? "),
                                TextSpan(
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Roboto-LightItalic",
                                        decoration: TextDecoration.underline),
                                    text: "Click here",
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        widget.toggleView("CreateAccount");
                                      })
                              ]),
                        ))
                      ],
                    ),
                    margin: EdgeInsets.only(top: 10.125.h),
                    decoration: BoxDecoration(
                      color: Color(0xffEDEDED),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    height: 91.25.h,
                  ),
                ]),
              ),
            )),
          );
  }
}
