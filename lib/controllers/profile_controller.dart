import 'package:LMShubAdmin/models/user.dart';
import 'package:LMShubAdmin/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class ProfileController extends ControllerMVC {
  User user = new User();
  GlobalKey<ScaffoldState> scaffoldKey;

  ProfileController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
    listenForUser();
  }

  void listenForUser() {
    getCurrentUser().then((_user) {
      setState(() {
        user = _user;
      });
    });
  }
}
