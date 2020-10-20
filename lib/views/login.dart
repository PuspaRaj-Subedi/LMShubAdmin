import 'package:LMShubAdmin/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:LMShubAdmin/repository/user_repository.dart' as userRepo;

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends StateMVC<LoginWidget> {
  UserController _con;

  _LoginWidgetState() : super(UserController()) {
    _con = controller;
  }
  @override
  void initState() {
    super.initState();
    if (userRepo.currentUser.token != null) {
      Navigator.of(context).pushReplacementNamed('/Libary', arguments: 2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.scaffoldKey,
      resizeToAvoidBottomPadding: true,
      body: new Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).accentColor
                  ], end: Alignment.bottomCenter, begin: Alignment.topCenter),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child:
                    Center(child: Image.asset('assets/images/libary_icon.png')),
              ),
              Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(children: [
                  Form(
                    key: _con.loginFormKey,
                    child: Column(children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (input) => _con.user.email = input,
                        validator: (input) => !input.contains('@')
                            ? "Should be a valid email"
                            : null,
                        decoration: InputDecoration(
                            labelText: 'Email',
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
                        onSaved: (input) => _con.user.password = input,
                        validator: (input) => input.length < 3
                            ? "Should be more than 3 characters"
                            : null,
                        obscureText: _con.hidePassword,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _con.hidePassword = !_con.hidePassword;
                                });
                              },
                              color: Theme.of(context).focusColor,
                              icon: Icon(_con.hidePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).accentColor),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).accentColor))),
                      ),
                    ]),
                  ),
                ]),
              ),
              SizedBox(height: 20.0),
              Container(
                height: 40.0,
                child: Material(
                  borderRadius: BorderRadius.circular(20.0),
                  elevation: 7.0,
                  child: FlatButton(
                    onPressed: () {
                      _con.login();
                    },
                    padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                    color: Theme.of(context).accentColor,
                    shape: StadiumBorder(),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('New To LMShub App'),
                  SizedBox(width: 5.0),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/Register');
                      },
                      child: Text('Register',
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline)))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
