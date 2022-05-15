// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:esensei/services/auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:sizer/sizer.dart';

class CreateAccount extends StatefulWidget {
  final Function toggleView;
  final Function getRole;
  CreateAccount({required this.toggleView, required this.getRole});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String fullname = "";
  String passwordc = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        String? returnPage;
        if (widget.getRole() == 0) {
          returnPage = "MenteeLogin";
        }
        if (widget.getRole() == 1) {
          returnPage = "MentorLogin";
        }
        if (widget.getRole() == -1) {
          returnPage = "RolePage";
        }
        widget.toggleView(returnPage);
        return Future.value(false);
      },
      child: Scaffold(
          body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Stack(children: [
            Container(
              color: const Color(0xffC42340),
              height: 12.88.h,
            ),
            Container(
              width: 100.w,
              child: Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 2.375.h),
                      ),
                      Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 10.55.w),
                              height: 8.75.h,
                              width: 49.72.w,
                              child: const AutoSizeText(
                                "Create New Account",
                                style: TextStyle(fontFamily: "Roboto-Medium"),
                                textAlign: TextAlign.left,
                                minFontSize: 28,
                                maxLines: 2,
                              )),
                          Padding(padding: EdgeInsets.only(top: 1.125.h)),
                          Container(
                            margin: EdgeInsets.only(left: 8.33.w),
                            child: Image.asset(
                              "assets/SignUp.png",
                              fit: BoxFit.contain,
                            ),
                            height: 16.39.w,
                            width: 9.25.h,
                          )
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 1.75.h),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        margin: EdgeInsets.only(left: 13.88.w),
                        height: 2.38.h,
                        width: 57.22.w,
                        child: const AutoSizeText(
                          "Full Name",
                          style: TextStyle(fontFamily: "Roboto-Light"),
                          textAlign: TextAlign.left,
                          minFontSize: 16,
                          maxLines: 1,
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0.875.h),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Color(0xffE0DDDB),
                      ),
                      margin: EdgeInsets.only(left: 10.55.w),
                      height: 6.50.h,
                      width: 74.17.w,
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        validator: (val) =>
                            val!.length < 6 ? "Enter your Full Name" : null,
                        onChanged: (val) {
                          setState(() => fullname = val);
                        },
                        decoration: const InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.25.h),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        margin: EdgeInsets.only(left: 13.88.w),
                        height: 2.38.h,
                        width: 34.17.w,
                        child: const AutoSizeText(
                          "Email/Username",
                          style: TextStyle(fontFamily: "Roboto-Light"),
                          textAlign: TextAlign.left,
                          minFontSize: 16,
                          maxLines: 1,
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0.38.h),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Color(0xffE0DDDB),
                      ),
                      margin: EdgeInsets.only(left: 10.55.w),
                      height: 6.5.h,
                      width: 74.17.w,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) => !(RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(email))
                            ? "Enter a valid email"
                            : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                        decoration: const InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2.88.h),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        margin: EdgeInsets.only(left: 13.88.w),
                        height: 2.38.h,
                        width: 57.22.w,
                        child: const AutoSizeText(
                          "Password*",
                          style: TextStyle(fontFamily: "Roboto-Light"),
                          textAlign: TextAlign.left,
                          minFontSize: 16,
                          maxLines: 1,
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0.75.h),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Color(0xffE0DDDB),
                      ),
                      margin: EdgeInsets.only(left: 10.55.w),
                      height: 6.5.h,
                      width: 74.17.w,
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        validator: (val) => val!.length < 8
                            ? "Password must be 8 characters in length"
                            : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2.38.h),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        margin: EdgeInsets.only(left: 13.88.w),
                        height: 2.38.h,
                        width: 57.22.w,
                        child: const AutoSizeText(
                          "Confirm Password*",
                          style: TextStyle(fontFamily: "Roboto-Light"),
                          textAlign: TextAlign.left,
                          minFontSize: 16,
                          maxLines: 1,
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0.75.h),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Color(0xffE0DDDB),
                      ),
                      margin: EdgeInsets.only(left: 10.55.w),
                      height: 6.5.h,
                      width: 74.17.w,
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        validator: (val) => !(val == password)
                            ? "Incorrect password inputted"
                            : null,
                        onChanged: (val) {
                          setState(() => passwordc = val);
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 2.h)),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 11.94.w),
                      ),
                      Checkbox(
                        tristate: true,
                        onChanged: (bool? value) {},
                        value: null,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 0.25.h),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 3.05.w),
                          height: 2.25.h,
                          width: 57.22.w,
                          child: const AutoSizeText(
                            "I agree with Terms & Conditions",
                            style: TextStyle(
                                color: Color(0xffEE92A4),
                                fontFamily: "Roboto-LightItalic"),
                            textAlign: TextAlign.left,
                            minFontSize: 15,
                            maxLines: 1,
                          )),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.5.h),
                  ),
                  Container(
                    width: 57.22.w,
                    height: 5.38.h,
                    child: ElevatedButton(
                      child: AutoSizeText(
                        'Create Account',
                        style: TextStyle(fontFamily: "Roboto-Medium"),
                        minFontSize: 15,
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xffC42330))),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          dynamic result = await _auth.createAccount(
                              email, password, fullname, widget.getRole());
                          if (result == null) {
                            setState(
                                () => error = "Please supply a valid email.");
                          }
                        }
                      },
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 2.h)),
                  RichText(
                    text: TextSpan(
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Roboto-LightItalic"),
                        children: <TextSpan>[
                          TextSpan(text: "Already have an account? "),
                          TextSpan(
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Roboto-LightItalic",
                                  decoration: TextDecoration.underline),
                              text: "Sign In",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  String? returnPage;
                                  if (widget.getRole() == 0) {
                                    returnPage = "MenteeLogin";
                                  }
                                  if (widget.getRole() == 1) {
                                    returnPage = "MentorLogin";
                                  }
                                  if (widget.getRole() == -1) {
                                    returnPage = "RolePage";
                                  }
                                  widget.toggleView(returnPage);
                                })
                        ]),
                  )
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
