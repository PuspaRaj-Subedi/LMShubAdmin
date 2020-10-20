import 'package:LMShubAdmin/models/book.dart';
import 'package:LMShubAdmin/repository/book_repository.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class BookController extends ControllerMVC {
  List<Book> books = <Book>[];
  GlobalKey<ScaffoldState> scaffoldKey;

  BookController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }

  void listenForBook({String message}) async {
    final Stream<Book> stream = await allBook();
    stream.listen((Book _book) {
      setState(() {
        books.add(_book);
      });
    }, onError: (a) {
      Fluttertoast.showToast(
        msg: "Verify your Internet Connection",
      );
    }, onDone: () {
      if (message != null) {
        Fluttertoast.showToast(
          msg: message,
        );
      }
    });
  }
}
