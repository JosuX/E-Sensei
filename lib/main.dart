// ignore_for_file: prefer_const_constructors

import 'package:esensei/controllers/users_controller.dart';
import 'package:esensei/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(UsersController());
    return Sizer(
        builder: (context, orientation, deviceType) =>
            GetMaterialApp(debugShowCheckedModeBanner: false, home: Wrapper()));
  }
}
