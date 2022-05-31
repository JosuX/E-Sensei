import 'package:esensei/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:esensei/models/user.dart';

class UsersController extends GetxController {
  static DatabaseService dbService = DatabaseService();
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  final mentorsQuery = dbService.users
      .where("email", isNotEqualTo: _auth.currentUser?.email)
      .where("isMentor", whereIn: [true])
      .withConverter(
          fromFirestore: MyUser.fromFirestore,
          toFirestore: (MyUser user, _) => user.toFirestore())
      .obs;

  final menteesQuery = dbService.users
      .where("email", isNotEqualTo: _auth.currentUser?.email)
      .where("isMentor", whereIn: [false])
      .withConverter(
          fromFirestore: MyUser.fromFirestore,
          toFirestore: (MyUser user, _) => user.toFirestore())
      .obs;
  Rx<MyUser> currentUser = MyUser().obs;

  Future<MyUser> currentUserFromSnapshot(User? user) async {
    if (user != null) {
      var userdata = await dbService.users.doc(user.uid).snapshots().first;
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
    currentUser.bindStream(_auth
        .userChanges()
        .asyncMap((User? user) => currentUserFromSnapshot(user)));
  }
}
