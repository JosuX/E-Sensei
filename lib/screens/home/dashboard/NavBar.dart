// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esensei/services/auth.dart';
import 'package:esensei/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class NavBar extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    CurrentUser? curr_user_snapshot = Provider.of<CurrentUser?>(context);
    String? curr_user_name = curr_user_snapshot?.user.name;
    String? curr_user_email = curr_user_snapshot?.user.email;
    return Drawer(
      child: Container(
        color: Color(0xffE3555E),
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(),
                accountName: Text(curr_user_name!),
                accountEmail: Text(curr_user_email!),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Color(0xffE3555E),
                  child: (ClipOval(
                      child: Image.asset('assets/SignIn.png',
                          fit: BoxFit.contain, width: 10.h, height: 10.h))),
                )),
            Stack(
              children: [
                Container(
                    margin: EdgeInsets.only(right: 36.11.w),
                    height: 47.5.h,
                    width: 100.w,
                    child: Image.asset(
                      "assets/NavBarLogo.png",
                      fit: BoxFit.contain,
                    )),
                Column(
                  children: [
                    Divider(
                      height: 1,
                      thickness: 3,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.drafts,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Drafts',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () => null,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.bookmark,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Bookmarks',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () => null,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.account_circle_outlined,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Manage Account',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () => null,
                    ),
                    Divider(
                      height: 1,
                      thickness: 3,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.account_circle,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Users',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.help,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Help',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () => null,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Settings',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () => null,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 3.75.h,
                        width: 25.w,
                        margin: EdgeInsets.only(top: 12.5.h, right: 7.5.w),
                        child: ElevatedButton.icon(
                          icon:
                              Icon(Icons.logout, color: Colors.black, size: 10),
                          label: Text('Signout',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12)),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xffFFFFFF))),
                          onPressed: () {
                            _auth.signOut();
                          },
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
