import 'dart:io';

class Borrow {
  String id;
  String book;
  String user;
  String quantity;

  Borrow();

  Borrow.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      id = jsonMap['id'].toString();
      book = jsonMap['book_id'] != null ? jsonMap['book_id'] : '';
      user = jsonMap['user_id'] != null ? jsonMap['user_id'] : '';
      quantity = jsonMap['requested_quantity'] != null
          ? jsonMap['requested_quantity']
          : '';
    } catch (e) {
      print(e);
    }
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["user_id"] = user;
    map["book_id"] = book;
    map["requested_quantity"] = quantity;
    return map;
  }
}
