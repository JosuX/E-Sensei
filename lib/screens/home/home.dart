// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:esensei/screens/home/dashboard/cards/AddQuestion.dart';
import 'package:esensei/screens/home/dashboard/cards/AnswerQuestion.dart';
import 'package:esensei/screens/home/dashboard/cards/SubjectFeed.dart';
import 'package:esensei/screens/home/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Dashboard Settings
  bool isGrid = false;

  var pagelist = {
    "Dashboard": 1,
    "SubjectFeed": 2,
    "AddQuestion": 3,
    "AnswerQuestion": 4
  };
  int curr_page = 1;
  var selected_subject;
  var selected_post;
  void toggleView(String page, {var subject, var post}) {
    setState(() {
      selected_subject = subject;
      selected_post = post;
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

      case 3:
        {
          return AddQuestion(toggleView: toggleView, subject: selected_subject);
        }

      case 4:
        {
          return AnswerQuestion(
            toggleView: toggleView,
            subject: selected_subject,
            post: selected_post,
          );
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
