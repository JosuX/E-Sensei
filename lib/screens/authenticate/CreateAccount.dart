// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:esensei/services/auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

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
    double Wrefix = (MediaQuery.of(context).size.width) / 360;
    double Hrefix = (MediaQuery.of(context).size.height) / 800;

    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Stack(children: [
          Container(
            color: const Color(0xffC42340),
            height: 115 * Hrefix,
          ),
          Container(
            width: 360 * Wrefix,
            child: Column(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 19 * Hrefix),
                    ),
                    Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 38 * Wrefix),
                            height: 75 * Hrefix,
                            width: 179 * Wrefix,
                            child: const AutoSizeText(
                              "Create New Account",
                              style: TextStyle(fontFamily: "Roboto-Medium"),
                              textAlign: TextAlign.left,
                              minFontSize: 30,
                              maxLines: 2,
                            )),
                        Padding(padding: EdgeInsets.only(top: 9 * Hrefix)),
                        Container(
                          margin: EdgeInsets.only(left: 30 * Wrefix),
                          height: 74 * Hrefix,
                          width: 59 * Wrefix,
                          child: Image.asset("assets/SignUp.png"),
                        )
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 14 * Hrefix),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      margin: EdgeInsets.only(left: 50 * Wrefix),
                      height: 19 * Hrefix,
                      width: 206 * Wrefix,
                      child: const AutoSizeText(
                        "Full Name",
                        style: TextStyle(fontFamily: "Roboto-Light"),
                        textAlign: TextAlign.left,
                        minFontSize: 16,
                        maxLines: 1,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 7 * Hrefix),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Color(0xffE0DDDB),
                    ),
                    margin: EdgeInsets.only(left: 38 * Wrefix),
                    height: 52 * Hrefix,
                    width: 267 * Wrefix,
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
                  padding: EdgeInsets.only(top: 26 * Hrefix),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      margin: EdgeInsets.only(left: 50 * Wrefix),
                      height: 19 * Hrefix,
                      width: 123 * Wrefix,
                      child: const AutoSizeText(
                        "Email/Username",
                        style: TextStyle(fontFamily: "Roboto-Light"),
                        textAlign: TextAlign.left,
                        minFontSize: 16,
                        maxLines: 1,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 3 * Hrefix),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Color(0xffE0DDDB),
                    ),
                    margin: EdgeInsets.only(left: 38 * Wrefix),
                    height: 52 * Hrefix,
                    width: 267 * Wrefix,
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
                  padding: EdgeInsets.only(top: 24 * Hrefix),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      margin: EdgeInsets.only(left: 50 * Wrefix),
                      height: 19 * Hrefix,
                      width: 206 * Wrefix,
                      child: const AutoSizeText(
                        "Password*",
                        style: TextStyle(fontFamily: "Roboto-Light"),
                        textAlign: TextAlign.left,
                        minFontSize: 16,
                        maxLines: 1,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 6 * Hrefix),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Color(0xffE0DDDB),
                    ),
                    margin: EdgeInsets.only(left: 38 * Wrefix),
                    height: 52 * Hrefix,
                    width: 267 * Wrefix,
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
                  padding: EdgeInsets.only(top: 19 * Hrefix),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      margin: EdgeInsets.only(left: 50 * Wrefix),
                      height: 19 * Hrefix,
                      width: 206 * Wrefix,
                      child: const AutoSizeText(
                        "Confirm Password*",
                        style: TextStyle(fontFamily: "Roboto-Light"),
                        textAlign: TextAlign.left,
                        minFontSize: 16,
                        maxLines: 1,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 6 * Hrefix),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Color(0xffE0DDDB),
                    ),
                    margin: EdgeInsets.only(left: 38 * Wrefix),
                    height: 52 * Hrefix,
                    width: 267 * Wrefix,
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
                Padding(padding: EdgeInsets.only(top: 16 * Hrefix)),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 43 * Hrefix),
                    ),
                    Checkbox(
                      tristate: true,
                      onChanged: (bool? value) {},
                      value: null,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2 * Hrefix),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 11 * Wrefix),
                        height: 18 * Hrefix,
                        width: 206 * Wrefix,
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
                  padding: EdgeInsets.only(top: 28 * Hrefix),
                ),
                Container(
                  width: 206 * Wrefix,
                  height: 43 * Hrefix,
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
                Padding(padding: EdgeInsets.only(top: 39 * Wrefix)),
                Container(
                    child: RichText(
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
                                widget.toggleView("RolePage");
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
