import 'package:shared_preferences/shared_preferences.dart';

Future<String?> checkUID() async {
  var shared = await SharedPreferences.getInstance();

  String? uid = shared.getString('uid');
  if (uid != null) {
    print("🖨️ UserId : $uid");
    return uid;
  } else {
    print("🖨️ no user id stored");
    return null;
  }
}
