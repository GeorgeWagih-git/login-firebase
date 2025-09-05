class UserModel {
  String? name;
  String? email;
  String? phone;
  UserModel({required this.email, required this.name, required this.phone});

  UserModel.fromMap(Map<String, dynamic> userMap) {
    name = userMap['name'];
    email = userMap['email'];
    phone = userMap['phone'];
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> myMap = {};
    myMap['name'] = name;
    myMap['email'] = email;
    myMap['phone'] = phone;
    return myMap;
  }
}
