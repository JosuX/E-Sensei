// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unused_local_variable
import 'package:esensei/screens/home/cards/SubjectCard.dart';
import 'package:esensei/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    double Wrefix = (MediaQuery.of(context).size.width) / 360;
    double Hrefix = (MediaQuery.of(context).size.height) / 800;

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 100),
          ),
          TextFormField(),
          TextFormField(),
          Container(
            child: ElevatedButton(
              onPressed: () async {},
              child: Text("Sign Anon"),
            ),
            margin: EdgeInsets.only(top: 200),
          ),
          SubjectCard()
        ],
      ),
    ));
  }
}
