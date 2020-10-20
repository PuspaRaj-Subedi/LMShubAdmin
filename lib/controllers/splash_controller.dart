import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:LMShubAdmin/repository/user_repository.dart' as userRepo;

class SplashController extends ControllerMVC {
  GlobalKey<ScaffoldState> scaffoldKey;
  SplashController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }

  @override
  void initState() {
    super.initState();
    userRepo.getCurrentUser().then((user) {
      setState(() {
        userRepo.currentUser = user;
      });
    });
  }
}
