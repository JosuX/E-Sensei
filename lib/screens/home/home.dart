// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:esensei/screens/home/dashboard/cards/SubjectFeed.dart';
import 'package:esensei/shared/loading.dart';
import 'package:esensei/screens/home/dashboard/dashboard.dart';
import 'package:esensei/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Dashboard Settings
  bool isGrid = false;

  var pagelist = {"Dashboard": 1, "SubjectFeed": 2};
  int curr_page = 1;
  var selected_subject;
  void toggleView(String page, var subject) {
    setState(() {
      selected_subject = subject;
      curr_page = pagelist[page]!.toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (curr_page) {
      case 1:
        {
          return Dashboard(toggleView: toggleView);
        }

      case 2:
        {
          return SubjectFeed(toggleView: toggleView, subject: selected_subject);
        }

      default:
        {
          return Dashboard(
            toggleView: toggleView,
          );
        }
    }
  }
}
