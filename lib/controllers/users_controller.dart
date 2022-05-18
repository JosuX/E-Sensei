import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:esensei/models/user.dart';

class UsersController extends GetxController {
  final CollectionReference users =
      FirebaseFirestore.instance.collection("users");
  Rx<MyUser> currentUser = MyUser().obs;

  Future<MyUser> currentUserFromSnapshot(User? user) async {
    if (user != null) {
      var userdata = await users.doc(user.uid).snapshots().first;
      MyUser curr_AppUser = MyUser(
          uid: user.uid,
          email: userdata.get("email"),
          name: userdata.get("name"),
          photo_url: userdata.get("photo"),
          isMentor: userdata.get("isMentor"),
          bookmarks: userdata.get("bookmarks"));
      return curr_AppUser;
    }
    return MyUser(email: null);
  }

  @override
  void onInit() async {
    super.onInit();
    currentUser.bindStream(FirebaseAuth.instance
        .userChanges()
        .asyncMap((User? user) => currentUserFromSnapshot(user)));
  }
}
