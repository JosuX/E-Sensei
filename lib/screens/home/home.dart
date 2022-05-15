// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esensei/models/user.dart';
import 'package:esensei/screens/home/dashboard/dashboard.dart';
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
  var pagelist = {"Dashboard": 1, "SubjectFeed": 2};
  @override
  Widget build(BuildContext context) {
    return Dashboard();
  }
}
