// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:esensei/controllers/users_controller.dart';
import 'package:esensei/screens/authenticate/authenticate.dart';
import 'package:esensei/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<UsersController>(
        builder: ((controller) => controller.currentUser.value.email == null
            ? Authenticate()
            : Home()));
  }
}
