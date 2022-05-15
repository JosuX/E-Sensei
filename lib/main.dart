// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esensei/screens/home/dashboard/cards/SubjectFeed.dart';
import 'package:esensei/screens/wrapper.dart';
import 'package:esensei/services/auth.dart';
import 'package:esensei/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          StreamProvider<CurrentUser?>.value(
              value:
                  DatabaseService(uid: FirebaseAuth.instance.currentUser?.uid)
                      .currentUserSnapshot,
              initialData: null),
          StreamProvider<MyUser?>.value(
              value: AuthService().user, initialData: null)
        ],
        child: Sizer(
            builder: (context, orientation, deviceType) => MaterialApp(
                debugShowCheckedModeBanner: false, home: Wrapper())));
  }
}
