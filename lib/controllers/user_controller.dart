import 'package:LMShubAdmin/helpers/helper.dart';
import 'package:LMShubAdmin/models/user.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:LMShubAdmin/repository/user_repository.dart' as repository;

class UserController extends ControllerMVC {
  User user = new User();
  bool hidePassword = true;
  bool loading = false;
  GlobalKey<FormState> loginFormKey;
  GlobalKey<FormState> registerFormKey;
  GlobalKey<ScaffoldState> scaffoldKey;
  OverlayEntry loader;

  UserController() {
    loader = Helper.overlayLoader(context);
    loginFormKey = new GlobalKey<FormState>();
    registerFormKey = new GlobalKey<FormState>();
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }

  void login() async {
    FocusScope.of(context).unfocus();
    if (loginFormKey.currentState.validate()) {
      loginFormKey.currentState.save();
      Overlay.of(context).insert(loader);
      repository.login(user).then((value) {
        print(value.token);
        if (value != null && value.token != null) {
          Fluttertoast.showToast(
            msg: "Success",
          );
          Navigator.of(context).pushNamed('/Libary');
        } else {
          Fluttertoast.showToast(
            msg: "Wrong email or password",
          );
        }
      }).catchError((e) {
        loader.remove();
        Helper.hideLoader(loader);
        Fluttertoast.showToast(
          msg: "Wrong email or password",
        );
      }).whenComplete(() {
        Helper.hideLoader(loader);
      });
    }
  }

  void register() async {
    FocusScope.of(context).unfocus();
    if (registerFormKey.currentState.validate()) {
      registerFormKey.currentState.save();
      Overlay.of(context).insert(loader);
      repository.register(user).then((value) {
        print(value);
        if (value == 200) {
          Navigator.of(context).pushNamed('/Login');
        } else {
          Fluttertoast.showToast(
            msg: "Something's Wrong",
          );
        }
      }).catchError((e) {
        loader.remove();
        Helper.hideLoader(loader);
        Fluttertoast.showToast(
          msg: "Something's Wrong",
        );
      }).whenComplete(() {
        Helper.hideLoader(loader);
      });
    }
  }
}
