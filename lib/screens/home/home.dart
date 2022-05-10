// ignore_for_file: non_constant_identifier_names

import 'package:esensei/models/user.dart';
import 'package:esensei/services/auth.dart';
import 'package:esensei/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: ElevatedButton(
          onPressed: () async {
            await _auth.signOut();
          },
          child: Text("Sign Out"),
        ),
        margin: EdgeInsets.only(top: 200),
      ),
    ));
  }
}
