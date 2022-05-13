// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, deprecated_member_use, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:auto_size_text/auto_size_text.dart';
import 'package:esensei/models/user.dart';
import 'package:esensei/services/auth.dart';
import 'package:esensei/shared/loading.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MenteeLogin extends StatefulWidget {
  final Function toggleView;
  MenteeLogin({required this.toggleView});

  @override
  State<MenteeLogin> createState() => _MenteeLoginState();
}

class _MenteeLoginState extends State<MenteeLogin> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  bool rememberMe = false;
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    double Wrefix = (MediaQuery.of(context).size.width) / 360;
    double Hrefix = (MediaQuery.of(context).size.height) / 800;
    return loading
        ? Loading()
        : Scaffold(
            body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Stack(children: [
                Container(
                  color: Color(0xffC42340),
                  height: 115 * Hrefix,
                ),
                Container(
                  width: 360 * Wrefix,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Padding(padding: EdgeInsets.only(top: 76 * Hrefix)),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 206 * Wrefix,
                                    height: 35 * Hrefix,
                                    child: AutoSizeText(
                                      "Hi, Mentee!",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontFamily: "Roboto-Medium"),
                                    ),
                                    margin: EdgeInsets.only(left: 32 * Wrefix),
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(top: 16 * Hrefix)),
                                  Container(
                                    width: 206 * Wrefix,
                                    height: 63 * Hrefix,
                                    child: AutoSizeText(
                                      "Please fill up the necessary information to continue",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: "Roboto-Light"),
                                    ),
                                    margin: EdgeInsets.only(left: 32 * Wrefix),
                                  ),
                                ],
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 6 * Wrefix)),
                              Container(
                                  height: 91 * Hrefix,
                                  width: 69.67 * Wrefix,
                                  child: Image.asset('assets/SignIn.png'))
                            ],
                          )
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 24 * Hrefix)),
                      Container(
                          width: 206 * Wrefix,
                          height: 19 * Hrefix,
                          child: AutoSizeText(
                            "E-mail/Username",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontFamily: "Roboto-Medium"),
                          )),
                      Container(
                          width: 267 * Wrefix,
                          height: 52 * Hrefix,
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
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: BorderSide(
                                          color: Color(0xffE0DDDB)))))),
                      Padding(padding: EdgeInsets.only(top: 28 * Hrefix)),
                      Container(
                          width: 206 * Wrefix,
                          height: 19 * Hrefix,
                          child: AutoSizeText("Password",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontFamily: "Roboto-Light"))),
                      Container(
                          width: 267 * Wrefix,
                          height: 52 * Hrefix,
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
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: BorderSide(
                                          color: Color(0xffE0DDDB)))))),
                      Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left: 47 * Wrefix)),
                          Checkbox(
                            tristate: true,
                            onChanged: (bool? value) {},
                            value: null,
                          ),
                          Container(
                              width: 206 * Wrefix,
                              height: 18 * Hrefix,
                              child: AutoSizeText(
                                "Remember Me",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Roboto-LightItalic"),
                              ))
                        ],
                      ),
                      Container(
                        width: 206 * Wrefix,
                        height: 43 * Hrefix,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xffC42340))),
                          child: AutoSizeText("LOGIN",
                              style: TextStyle(fontFamily: "Roboto-Medium")),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() => loading = true);
                              MyUser? result = await _auth.loginAccountMentee(
                                  email, password);
                              if (result == null) {
                                print("returned null");
                                if (this.mounted) {
                                  setState(() => loading = false);
                                }
                              }
                            }
                          },
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 11 * Hrefix)),
                      Container(
                        width: 206 * Wrefix,
                        height: 43 * Hrefix,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xff7A7975))),
                          child: Text("LOGIN WITH GOOGLE",
                              style: TextStyle(fontFamily: "Roboto-Medium")),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {}
                          },
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 39 * Wrefix)),
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
                  margin: EdgeInsets.only(top: 81 * Hrefix),
                  decoration: BoxDecoration(
                    color: Color(0xffEDEDED),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  height: 730 * Hrefix,
                ),
              ]),
            ),
          ));
  }
}
