// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, non_constant_identifier_names
import 'package:esensei/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NavBar extends StatelessWidget {
  final AuthService _auth = AuthService();
  final String? user_name;
  final String? user_email;

  NavBar({this.user_name, this.user_email});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xffE3555E),
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(),
                accountName: Text(user_name!),
                accountEmail: Text(user_email!),
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
