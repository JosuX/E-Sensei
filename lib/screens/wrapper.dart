import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esensei/screens/authenticate/authenticate.dart';
import 'package:esensei/screens/home/home.dart';
import 'package:esensei/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:esensei/models/user.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final curr_user = Provider.of<MyUser?>(context);
    //return Home or Authenticate
    if (curr_user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
