import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double Wrefix = (MediaQuery.of(context).size.width) / 360;
    double Hrefix = (MediaQuery.of(context).size.height) / 800;
    return Scaffold(
        body: Stack(children: [
      Container(
        color: Color(0xffC42340),
        height: 115 * Hrefix,
      ),
      Container(
        width: 360 * Wrefix,
        margin: EdgeInsets.only(top: 81 * Hrefix),
        decoration: BoxDecoration(
          color: Color(0xffEDEDED),
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: Center(
            child: SpinKitFoldingCube(color: Color(0xffC42340), size: 50)),
      )
    ]));
  }
}
