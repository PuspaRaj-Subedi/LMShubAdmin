class Book {
  String id;
  String isbn;
  String author;
  String quantity;
  String description;
  String title;
  String image;

  Book();

  Book.fromJSON(Map<String, dynamic> jsonMap) {
    id = jsonMap['id'].toString();
    isbn = jsonMap['ISBN'] != null ? jsonMap['ISBN'] : '';
    quantity = jsonMap['quantity'] != null ? jsonMap['quantity'] : '';
    author =
        jsonMap['author'] != null ? jsonMap['author'].toString() : 'No one';
    title = jsonMap['title'] != null ? jsonMap['title'] : 'title';
    description =
        jsonMap['description'] != null ? jsonMap['description'] : 'description';
    image = jsonMap['image'] != null ? jsonMap['image'] : 'image';
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["ISBN"] = isbn;
    map["author"] = author;
    map["quantity"] = quantity;
    map["description"] = description;
    map["title"] = title;
    map["image"] = image;
    // map["comment"] = feedback.map((element) => element.toMap()).toList();

    return map;
  }
}
