import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import 'package:LMShubAdmin/repository/user_repository.dart' as userRepo;

class Controller extends AppConMVC {
  GlobalKey<ScaffoldState> scaffoldKey;
  Controller() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }
  @override
  void initState() {
    userRepo.getCurrentUser();
    super.initState();
  }
}
