import 'dart:convert';
import 'dart:io';

import 'package:LMShubAdmin/controllers/book_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:LMShubAdmin/elements/DrawerWidget.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class AddBookWidget extends StatefulWidget {
  @override
  _AddBookWidgetState createState() => _AddBookWidgetState();
}

class _AddBookWidgetState extends StateMVC<AddBookWidget> {
  BookController _con;
  File file;

  _choose() async {
    file = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (file == null) return;
    String base64Image = base64Encode(file.readAsBytesSync());
    _con.books.image = base64Image;
  }

  _AddBookWidgetState() : super(BookController()) {
    _con = controller;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.scaffoldKey,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              color: Colors.white,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        shadowColor: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).accentColor,
        title: Center(
          child: Column(children: [
            Text(
              'LMShub',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ]),
        ),
      ),
      drawer: DrawerWidget(),
      body: new Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Form(
                    key: _con.scaffoldKey,
                    child: Column(children: [
                      TextFormField(
                        keyboardType: TextInputType.text,
                        onSaved: (input) => _con.books.title = input,
                        validator: (input) => input.length < 3
                            ? "Should be more than 3 characters"
                            : null,
                        decoration: InputDecoration(
                            labelText: 'Book Name',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).accentColor),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).accentColor))),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        onSaved: (input) => _con.books.author = input,
                        validator: (input) => input.length < 3
                            ? "Should be more than 3 characters"
                            : null,
                        decoration: InputDecoration(
                            labelText: 'Book Author',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).accentColor),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).accentColor))),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        onSaved: (input) => _con.books.quantity = input,
                        validator: (input) =>
                            input.length < 1 ? "Should be include" : null,
                        decoration: InputDecoration(
                            labelText: 'Quantity',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).accentColor),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).accentColor))),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        onSaved: (input) => _con.books.description = input,
                        validator: (input) =>
                            input.length < 3 ? "Description Required" : null,
                        decoration: InputDecoration(
                            labelText: 'Description',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).accentColor),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).accentColor))),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      RaisedButton(
                        color: Colors.green,
                        onPressed: () {
                          _choose();
                        },
                        child: new Text(
                          "Pick Book Image",
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 60.0,
                      ),
                      Container(
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Theme.of(context).accentColor,
                          elevation: 7.0,
                          child: FlatButton(
                            onPressed: () {
                              _con.addBook();
                            },
                            padding: EdgeInsets.symmetric(
                                horizontal: 66, vertical: 5),
                            color: Theme.of(context).accentColor,
                            shape: StadiumBorder(),
                            child: Text(
                              'Add Book',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
