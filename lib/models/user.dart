class User {
  String id;
  String firstName;
  String lastName;
  String email;
  String phone;
  String token;
  String password;

  User();

  User.fromJSON(Map<String, dynamic> jsonMap) {
    id = jsonMap['id'].toString();
    firstName = jsonMap['first_name'] != null ? jsonMap['first_name'] : '';
    lastName = jsonMap['last_name'] != null ? jsonMap['last_name'] : '';
    phone = jsonMap['phone'] != null ? jsonMap['phone'] : '';
    email = jsonMap['email'] != null ? jsonMap['email'] : '';
    token = jsonMap['token'] != null ? jsonMap['token'] : '';
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["email"] = email;
    map["first_name"] = firstName;
    map["last_name"] = lastName;
    map["password"] = password;
    map["token"] = token;
    map["phone"] = phone;
    return map;
  }
}
