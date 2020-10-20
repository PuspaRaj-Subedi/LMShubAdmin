import 'dart:async';
import 'package:LMShubAdmin/controllers/splash_controller.dart';
import 'package:LMShubAdmin/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}

class SplashState extends StateMVC<Splash> {
  SplashController _con;

  SplashState() : super(SplashController()) {
    _con = controller;
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (currentUser.token == null) {
        Navigator.of(context).pushReplacementNamed('/Login');
      } else {
        Navigator.of(context).pushReplacementNamed('/Libary', arguments: 0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/libary_icon.png',
                height: 80,
              ),
              SizedBox(height: 50),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
