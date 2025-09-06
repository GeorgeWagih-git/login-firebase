class UserModel {
  String? name;
  String? email;
  String? phone;
  String? fcm;
  UserModel({
    required this.email,
    required this.name,
    required this.phone,
    required this.fcm,
  });

  UserModel.fromMap(Map<String, dynamic> userMap) {
    name = userMap['name'];
    email = userMap['email'];
    phone = userMap['phone'];
    fcm = userMap['fcm'];
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> myMap = {};
    myMap['name'] = name;
    myMap['email'] = email;
    myMap['phone'] = phone;
    myMap['fcm'] = fcm;
    return myMap;
  }
}
