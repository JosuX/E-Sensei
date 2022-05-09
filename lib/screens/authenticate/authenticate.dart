// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, non_constant_identifier_names

import 'package:esensei/screens/authenticate/CreateAccount.dart';
import 'package:esensei/screens/authenticate/FrontPage.dart';
import 'package:esensei/screens/authenticate/MenteeLogin.dart';
import 'package:esensei/screens/authenticate/MentorLogin.dart';
import 'package:esensei/screens/authenticate/RolePage.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  var pagelist = {
    "FrontPage": 1,
    "RolePage": 2,
    "MentorLogin": 3,
    "MenteeLogin": 4,
    "CreateAccount": 5
  };
  int curr_page = 1;
  int isMentor = -1;
  void toggleView(String page) {
    setState(() => curr_page = pagelist[page]!.toInt());
  }

  void setRole(select) {
    isMentor = select;
  }

  int getRole() {
    return isMentor;
  }

  @override
  Widget build(BuildContext context) {
    switch (curr_page) {
      case 1:
        {
          return FrontPage(toggleView: toggleView);
        }
        break;

      case 2:
        {
          return RolePage(toggleView: toggleView, setRole: setRole);
        }
        break;

      case 3:
        {
          return MentorLogin(toggleView: toggleView);
        }
        break;

      case 4:
        {
          return MenteeLogin(toggleView: toggleView);
        }
        break;

      case 5:
        {
          return CreateAccount(toggleView: toggleView, getRole: getRole);
        }
        break;

      default:
        {
          return FrontPage(toggleView: toggleView);
        }
        break;
    }
  }
}
