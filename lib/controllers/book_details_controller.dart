import 'package:LMShubAdmin/models/book.dart';
import 'package:LMShubAdmin/repository/book_repository.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class BookDetailsController extends ControllerMVC {
  Book book;
  GlobalKey<FormState> commentFormKey;
  GlobalKey<ScaffoldState> scaffoldKey;
  BookDetailsController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }

  void listenForBook({String id, String message}) async {
    final Stream<Book> stream = await bookDetail(id);
    stream.listen((Book _book) {
      setState(() => book = _book);
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

  Future<void> refreshOrder() async {
    listenForBook();
  }
}
